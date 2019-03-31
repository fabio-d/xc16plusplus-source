# XC16++ source repository

***Unofficial*** C++ compiler for PIC24 and dsPIC chips, based on the [official
XC16 compiler from Microchip](http://www.microchip.com/pagehandler/en_us/devtools/mplabxc/).
It is neither endorsed nor supported in any form by Microchip.

## This is not the repository you are looking for

If you just want to install the C++ compiler, **this is not the repository you
are looking for**. Please refer to
https://github.com/fabio-d/xc16plusplus/releases instead.

## About this repository

I use this repository to track Microchip's official XC16 releases along with my
patches that enable C++ support every time they release a new version.

This repository contains both the official XC16 source **and** my patches (see
below).

The [xc16plusplus](https://github.com/fabio-d/xc16plusplus) companion repository
contains **release notes**, **examples**, **automatic tests** and
**support files** that **are NOT present in this repository**. Unless you want
to **rebuild** or **modify** XC16++, the
[xc16plusplus](https://github.com/fabio-d/xc16plusplus) repository will probably
be more useful to you.

This repository is organized in several branches:
 * The *upstream-official* branch has one commit for each official xc16 release.
   Official .zip/.tar source archives are extracted and stored mostly
   unmodified in this branch (any difference is documented in commit messages);
 * Each *xc16++-vX.YY* branch (e.g. *xc16++-v1.24*) forks from the corresponding
   commit in the *upstream-official* branch and contains all the patches needed
   to make C++ work with that version;
 * The *master* branch contains the README.md and LICENSE files only.

# License

Patches are released under the same license as the portion of the XC16 source
code they apply to, i.e. GNU General Public License, version 3 or (if
applicable) later.

The GPL **does not** extend to programs compiled by XC16++.
