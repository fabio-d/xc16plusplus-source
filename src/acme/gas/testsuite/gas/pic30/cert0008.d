#as: --no-warn
#objdump: -s -j .text
#name: no fatal warnings

# This file is used as a positive test of --fatal-warnings\.  We first run this file
# to determine that the file assembles without the command-line option\.

dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 0000ff 746500 737400 206f00  \.\..te\.st\. o\.
 0008 662000 617300 636900 697a00  f \.as\.ci\.iz\.
 0010 207700 617200 6e6900 6e6700   w\.ar\.ni\.ng\.
 0018 0a0000                       \.\.\.         
