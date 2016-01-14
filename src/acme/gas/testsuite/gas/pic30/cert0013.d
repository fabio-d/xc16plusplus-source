#as: --gdwarf2
#objdump: -s -g
#name: --gdwarf2 DWARF2 debug info

# 


.*: .*

Contents of section \.text\:
 0000 0000ff00 0000ff00 74650000 73740000  \.\.\.\.\.\.\.\.te\.\.st\.\.
 0010 206f0000 66200000 61730000 63690000   o\.\.f \.\.as\.\.ci\.\.
 0020 697a0000 20770000 61720000 6e690000  iz\.\. w\.\.ar\.\.ni\.\.
 0030 6e670000                             ng\.\.            
fake\:
typedef void void\;
void foo \/\* 0x4 \*\/\;
