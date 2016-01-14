#ld:
#objects: /ld-pic30-coff/cert0418a.out /ld-pic30-coff/cert0418b.out
#objdump: -d -j .text
#name: PROGRAM_ADDRESS_LSB Relocation

.+cert0418a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
	\.\.\.
 108:	00 00 ff    	nopr      
 10a:	00 00 ff    	nopr      
 10c:	00 00 ff    	nopr      
 10e:	00 00 ff    	nopr      
 110:	00 00 ff    	nopr      
 112:	04 03 04    	goto      0x304 \<gotoself2\>
 114:	00 00 00 
	\.\.\.

00000200 \<gotoself1\>:
 200:	00 02 04    	goto      0x200 \<gotoself1\>
 202:	00 00 00 

00000204 \<\.text\>:
 204:	00 00 ff    	nopr      
 206:	00 00 ff    	nopr      
 208:	00 00 ff    	nopr      
	\.\.\.
 20e:	00 02 04    	goto      0x200 \<gotoself1\>
 210:	00 00 00 
	\.\.\.

00000304 \<gotoself2\>:
 304:	04 03 04    	goto      0x304 \<gotoself2\>
 306:	00 00 00 
