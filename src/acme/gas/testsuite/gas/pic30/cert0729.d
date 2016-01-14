#as:
#objdump: -s -j ".text"
#name: .pincbin directive in .text with skip==0 and count==15
#source: cert0729.s


.+\.o:     file format coff-pic30

Contents of section \.text:
 0000 0040da 000102 030405 060708  \.@Ú\.\.\.\.\.\.\.\.\.
 0008 090a0b 0c0d0e 0040da         	\.\.\.\.\.\.@Ú   
