#ld: 
#objects: /ld-pic30-coff/cert0700a.out /ld-pic30-coff/cert0700b.out
#objdump: -d -j .const
#name: .align directive in a .const readonly section 

.*cert0700b.o:     file format coff-pic30

Disassembly of section \.const:

00008600 \<constb1\>:
	\.\.\.

0000860c \<constalgn4\>:
	\.\.\.

00008710 \<constalgn0x10\>:
	\.\.\.

00008718 \<constalgn2\>:
    8718:	01 00       	\.word 0x1
	\.\.\.

00008720 \<constfileb1\>:
    8720:	01 00       	\.word 0x1
    8722:	00 00       	\.word 0
    8724:	02 03       	\.word 0x302

00008725 \<constfileb2\>:
    8725:	00 00       	\.word 0
	\.\.\.
