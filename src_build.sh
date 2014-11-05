:

THIS_DIR=`pwd`

OS=`uname -s`

export OS
export CC
export EXTRA_CFLAGS
export ACME_CONFIGURE
export EXE

case $OS in
  Darwin)  OS="OS/X"
             CC="gcc"
             EXTRA_CFLAGS=""
             ACME_CONFIGURE="--target=pic30-@omf --host=i386-darwin"
             EXE=""
             ;;
  CYGWIN*) OS="Windows/Cygwin"
             CC="i686-pc-mingw32-gcc"
             EXTRA_CFLAGS=""
             ACME_CONFIGURE="--target=pic30-@omf --host=i386-pc-mingw32"
             EXE=".exe"
             ;;
  *)       OS="Linux/Unknown"
             CC="gcc"
             EXTRA_CFLAGS=""
             ACME_CONFIGURE="--target=pic30-@omf --host=i386-linux"
             EXE=""
             ;;
esac


echo "Building for $OS"

mkdir -p install/bin/bin
export install_dir=`pwd`/install

mkdir bin
(
  cd bin

  for OMF in elf coff; do
    mkdir acme-${OMF}-native
    ( 
       cd acme-${OMF}-native
       lconfigure=`echo $ACME_CONFIGURE | sed -e 's/@omf/${OMF}/g'`
       lconfigure=`eval echo $lconfigure`
       CFLAGS="-DRESOURCE_MISMATCH_OK" $THIS_DIR/src/acme/configure $lconfigure
       make
       cp -f gas/as-new${EXE} ${install_dir}/bin/bin/${OMF}-as${EXE}
       cp -f ld/ld-new${EXE}  ${install_dir}/bin/bin/${OMF}-ld${EXE}
       cp -f binutils/objdump${EXE} ${install_dir}/bin/bin/${OMF}-objdump${EXE}
       cp -f binutils/bin2hex${EXE} ${install_dir}/bin/bin/${OMF}-bin2hex${EXE}
       cp -f binutils/strip-new${EXE} ${install_dir}/bin/bin/${OMF}-strip${EXE}
       cp -f binutils/ar${EXE}        ${install_dir}/bin/bin/${OMF}-ar${EXE}
    )

    SRC=`ls -1d $THIS_DIR/src/XC*`
    mkdir gcc-${OMF}-native
    (
       cd gcc-${OMF}-native
       export EXTRA_CFLAGS
       $THIS_DIR/build_XC16_451 -user -src=$SRC -omf=$OMF -cross=i686-pc-mingw32-nolm  -D_FORTIFY_SOURCE=0 -DMCHP_VERSION=v0_00
       cp gcc/gcc/xgcc${EXE} ${install_dir}/bin/bin/${OMF}-gcc${EXE}
       cp gcc/gcc/cc1${EXE} ${install_dir}/bin/bin/${OMF}-cc1${EXE}
       cp gcc/gcc/cpp${EXE} ${install_dir}/bin/bin/${OMF}-cpp${EXE}
    )
  done

)

cp src/c30_resource/src/c30/c30_device.info $install_dir/bin/

