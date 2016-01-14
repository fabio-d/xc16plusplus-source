#ld: -defsym __reset=0
#objects: /ld-pic30-coff/13bitSFRrelocA.out /ld-pic30-coff/13bitSFRrelocB.out 
#objdump: -d -j .text -r
#name: 13-bit SFR Relocation


.+cert0004.o:     file format coff-pic30

Disassembly of section \.text:

000001bc \<\.text\>:
 1bc:	25 90 20    	mov\.w     \#0x902, w5
 1be:	06 90 20    	mov\.w     \#0x900, w6
 1c0:	00 00 ff    	nopr      

000001c2 \<\.text\>:
 1c2:	00 00 ff    	nopr      
