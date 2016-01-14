#ld: 
#objects: /ld-pic30-coff/cert0426a.out /ld-pic30-coff/cert0426b.out
#objdump: -d -j .text
#name: SFR_BYTE Relocation

.*cert0426a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<\.text\>:
 100:	00 00 ff    	nopr      
 102:	00 00 ff    	nopr      
 104:	00 00 ff    	nopr      
 106:	00 00 ff    	nopr      
 108:	00 00 ff    	nopr      
 10a:	00 00 ff    	nopr      
 10c:	00 00 ff    	nopr      
 10e:	00 00 00    	nop       
 110:	01 68 b4    	add\.b     0x801
 112:	07 68 b4    	add\.b     0x807
 114:	00 68 b4    	add\.b     0x800
 116:	06 68 b4    	add\.b     0x806
 118:	00 00 00    	nop       

0000011a \<__reset\>:
	\.\.\.
 124:	00 00 ff    	nopr      
 126:	07 68 b4    	add\.b     0x807
 128:	00 00 ff    	nopr      
 12a:	00 68 b4    	add\.b     0x800
 12c:	01 68 b4    	add\.b     0x801
 12e:	06 68 b4    	add\.b     0x806
 130:	00 00 00    	nop       
