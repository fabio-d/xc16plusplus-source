#objdump: -s
#name: Implicit alignment of program memory (no listing)

.*: .*

Contents of section .text:
 0000 010000 800078 010203 040500  .....x......
 0008 060708 090000 616200 636400  ......ab.cd.
 0010 656600 670000                ef.g..      
Contents of section .data:
 0000 01020304 05060708 09616263 64656667  .........abcdefg
 0010 0000                                 ..              
