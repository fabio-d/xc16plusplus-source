#!/bin/bash
cd "$(dirname "$0")"
THISDIR="$PWD"

SRCDIR="$THISDIR/src"
BUILD=$("$SRCDIR/XC_GCC/gcc/config.guess")

# Read XC16 version number from the official src_build.sh script
MCHP_VERSION=$(sed -n 's/.*MCHP_VERSION=\(v[^ ]*\).*/\1/p' src_build.sh)

# Set the XC16++ revision number
XC16PLUSPLUS_REVISION=2

if [ "$1" == "linux32" ];
then
	# Tested on Fedora 22
	HOST=i386-linux
	CFLAGS=-m32
elif [ "$1" == "linux64" ];
then
	# Tested on Fedora 22
	HOST=x86_64-linux
	CFLAGS=-m64
elif [ "$1" == "windows32" ];
then
	# Tested with mingw32-gcc on Fedora 22
	HOST=i686-w64-mingw32
elif [ "$1" == "windows64" ];
then
	# Tested with mingw64-gcc on Fedora 22
	HOST=x86_64-w64-mingw32
elif [ "$1" == "osx32" ];
then
	# Tested with a cross-compling gcc 5.3.0 compiled by
	# https://github.com/tpoechtrager/osxcross on Fedora 22, using
	# MacOSX10.5.sdk from https://github.com/phracker/MacOSX-SDKs
	HOST=i386-apple-darwin9
elif [ "$1" == "osx64" ];
then
	# Tested with a cross-compling gcc 5.3.0 compiled by
	# https://github.com/tpoechtrager/osxcross on Fedora 22, using
	# MacOSX10.5.sdk from https://github.com/phracker/MacOSX-SDKs
	HOST=x86_64-apple-darwin9
else
	echo "Usage: $0 <linux32 | linux64 | windows32 | windows64 | osx32 | osx64>" >&2
	exit 1
fi

BUILDDIR="$THISDIR/build-$1"
INSTALLDIR="$THISDIR/install-$1/bin"

MAKEFLAGS="-j$(($(nproc || sysctl -n hw.ncpu)+1))" # Enable parallel builds

echo "Building xc16plusplus with:"
echo " TARGET=$1"
echo " BUILD=$BUILD"
echo " HOST=$HOST"
echo " MCHP_VERSION=$MCHP_VERSION"
echo " XC16PLUSPLUS_REVISION=$XC16PLUSPLUS_REVISION"
echo " MAKEFLAGS=$MAKEFLAGS"
echo

set -ex # Exit on error and print executed commands

echo "== LIBELF =="
mkdir -p "$BUILDDIR/libelf"
cd "$BUILDDIR/libelf"
CFLAGS="$CFLAGS" \
"$SRCDIR/XC_GCC/libelf/configure" --build=$BUILD --host=$HOST \
	--prefix="$BUILDDIR/host-libs" --disable-nls
make $MAKEFLAGS
make install

echo "== GMP =="
mkdir -p "$BUILDDIR/gmp"
cd "$BUILDDIR/gmp"
"$SRCDIR/XC_GCC/gmp/configure" --build=$BUILD --host=$HOST --disable-shared \
	--enable-static --disable-cxx --prefix="$BUILDDIR/host-libs"
make $MAKEFLAGS
make install

if [[ "$1" != osx* ]]; # Use system's zlib on OSX
then
	echo "== ZLIB =="
	cp -rv "$SRCDIR/XC_GCC/zlib" "$BUILDDIR/zlib"
	cd "$BUILDDIR/zlib"
	# ZLIB has no support for host triplets, so we piggyback on gmp's past
	# compiler detection work
	AR="$(sed -n 's/^AR = //p' ../gmp/Makefile)" \
	CC="$(sed -n 's/^CC = //p' ../gmp/Makefile)" \
	CFLAGS="$(sed -n 's/^CFLAGS = //p' ../gmp/Makefile)" \
	RANLIB="$(sed -n 's/^RANLIB = //p' ../gmp/Makefile)" \
		./configure --prefix="$BUILDDIR/host-libs"
	make $MAKEFLAGS
	make install

	OPT_ZLIB=--with-zlib="$BUILDDIR/host-libs"
else
	OPT_ZLIB=""
fi

function build_gcc()
{
	OMF=$1
	echo "== GCC ($OMF) =="
	mkdir -p "$BUILDDIR/gcc-$OMF"
	cd "$BUILDDIR/gcc-$OMF"

	if [ "$OMF" == "elf" ];
	then
		OPT_DWARF2="--with-dwarf2"
	else
		OPT_DWARF2=""
	fi

	# Pretend some .info files exist and are up to date (so that the build
	# does not fail because of missing makeinfo program)
	touch "$SRCDIR/XC_GCC/gcc/mpc/doc/mpc.info" "$SRCDIR/XC_GCC/gcc/mpfr/mpfr.info"
	touch "$SRCDIR/XC_GCC/gcc/gmp/doc/gmp.info" || \
		touch "$SRCDIR/XC_GCC/gmp/doc/gmp.info"

	AR="$(sed -n 's/^AR = //p' ../gmp/Makefile)" \
	MAKEINFO=missing AS_FOR_TARGET=missing LD_FOR_TARGET=missing \
	CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=0 -DMCHP_VERSION=$MCHP_VERSION -DXC16PLUSPLUS_REVISION=$XC16PLUSPLUS_REVISION -D_BUILD_C30_ -D_BUILD_MCHP_ -O2 -DRESOURCE_MISMATCH_OK -I$SRCDIR/c30_resource/src/c30/" \
	"$SRCDIR/XC_GCC/gcc/configure" \
		--build=$BUILD --host=$HOST --target=pic30-$OMF $OPT_DWARF2 \
		--with-bugurl="https://github.com/fabio-d/xc16plusplus/issues" \
		--disable-threads --disable-libmudflap --disable-libssp \
		--disable-libstdcxx-pch --disable-hosted-libstdcxx \
		--with-gnu-as --with-gnu-ld --enable-languages=c++ \
		--disable-nls --disable-libgomp --without-headers \
		--disable-libffi --disable-bootstrap --disable-lto \
		--{libexecdir,prefix}="$INSTALLDIR" --program-prefix="pic30-" \
		--with-{gmp,libelf}="$BUILDDIR/host-libs" $OPT_ZLIB

	make $MAKEFLAGS all-gcc || \
		make -C gcc $MAKEFLAGS cc1plus g++ || \
		make -C gcc $MAKEFLAGS cc1plus.exe g++.exe

	mkdir -p "$INSTALLDIR/bin"
	cp -v gcc/cc1plus "$INSTALLDIR/bin/$OMF-cc1plus" || \
		cp -v gcc/cc1plus.exe "$INSTALLDIR/bin/$OMF-cc1plus.exe"
	cp -v gcc/g++ "$INSTALLDIR/bin/$OMF-g++" || \
		cp -v gcc/g++.exe "$INSTALLDIR/bin/$OMF-g++.exe"
}

build_gcc elf
build_gcc coff
