#ld: 
#objects: /ld-pic30-coff/cert0443a.out /ld-pic30-coff/cert0443b.out
#objdump: -s -j .data
#name: RELWORD relocation in .data

.+cert0443a.o:     file format coff-pic30

Contents of section .data:
 0800 00000100 ff7f0080 ffff0000 0100ff7f  .+
 0810 0080ffff 00000100 ff7f0080 ffff0000  .+
 0820 0100ff7f 0080ffff 00000100 ff7f0080  .+
 0830 ffff0000 0100ff7f 0080ffff 00000100  .+
 0840 ff7f0080 ffff0000 0100ff7f 0080ffff  .+
