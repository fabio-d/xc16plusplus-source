#ld:
#objects: /ld-pic30-coff/cert0416a.out /ld-pic30-coff/cert0416b.out
#objdump: -d -j .text
#name: PCREL_BRANCH Relocation

.+cert0416a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
	\.\.\.
 108:	fc 00 37    	bra       0x302 \<braself2\>
 10a:	00 00 ff    	nopr      
 10c:	00 00 ff    	nopr      
 10e:	00 00 ff    	nopr      
 110:	00 00 ff    	nopr      
 112:	00 00 ff    	nopr      
 114:	75 00 37    	bra       0x200 \<BRASELF1\>
	\.\.\.

00000200 \<BRASELF1\>:
 200:	ff ff 37    	bra       \.

00000202 \<\.text\>:
 202:	00 00 ff    	nopr      
 204:	00 00 ff    	nopr      
 206:	00 00 ff    	nopr      
 208:	7c 00 37    	bra       0x302 \<braself2\>
	\.\.\.
 20e:	f8 ff 37    	bra       0x200 \<BRASELF1\>
	\.\.\.

00000302 \<braself2\>:
 302:	ff ff 37    	bra       \.
