# XC16++ source repository

***Unofficial*** C++ compiler for PIC24 and dsPIC chips, based on the [official
XC16 compiler from Microchip](http://www.microchip.com/pagehandler/en_us/devtools/mplabxc/).
It is neither endorsed nor supported in any form by Microchip.

## This is not the repository you are looking for

If you just want to download patches against the official Microchip XC16 source,
compile or install C++ support for XC16, **this is not the repository you are
looking for**. Please refer to https://github.com/fabio-d/xc16plusplus instead.

## About this repository

I use this repository to track Microchip's official XC16 releases and rebase my
patches that enable C++ support every time they release a new version.

This repository contains both the official XC16 source **and** my patches.

When I update this repository, I also update https://github.com/fabio-d/xc16plusplus.
**That repository contains the same patches as this one, but in `patch` format
that can easily be applied to the official Microchip source archive**.

The [xc16plusplus](https://github.com/fabio-d/xc16plusplus) repository also
contains **release notes**, **examples**, **tests** and
**support files** that **are NOT present in this repository**. Unless you want
to **modify** XC16++, the [xc16plusplus](https://github.com/fabio-d/xc16plusplus)
repository will probably be more useful to you.

This repository is organized in several branches:
 * The *upstream-official* branch has one commit for each official xc16 release.
   Official .zip/.tar source archives are extracted and stored mostly
   unmodified in this branch (any difference is documented in commit messages);
 * Each *xc16++-vX.YY* branch (e.g. *xc16++-v1.24*) forks from the corresponding
   commit in the *upstream-official* branch and contains all the patches needed
   to make C++ work with that version;
 * The *master* branch contains the README.md and LICENSE files only.

## Updating

I destroy and recreate the *master* branch every time I modify the latest
*xc16++-vX.YY* or the *metadata* branch. Therefore, `git` will always fail to
fast-forward it. The recommended way to update a clone of this repository is to
run the following sequence of commands:
```
git fetch
git checkout master
git reset --hard origin/master
```
and, for each other tracked branch:
```
git checkout tracked-branch-name
git pull
```

The first command will download all the updates without touching neither the
local index nor working tree. The second and third commands will update the
local master branch. The fourth and fifth commands, that must be repeated for
each branch you are interested in, update branch *tracked-branch-name* the
regular way.

# License

Patches are released under the same license as the portion of the XC16 source
code they apply to, i.e. GNU General Public License, version 3 or (if
applicable) later.

The GPL **does not** extend to programs compiled by XC16++.
