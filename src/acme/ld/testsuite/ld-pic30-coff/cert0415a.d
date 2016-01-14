#ld:
#objects: /ld-pic30-coff/cert0415a.out /ld-pic30-coff/cert0415b.out
#objdump: -d -j .text
#name: PBYTE Relocation in .text

.+cert0415a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<\.text\>:
 100:	01 02 00    	nop       
 102:	03 04 00    	nop       
 104:	05 00 00    	nop       
 106:	05 00 00    	nop       
 108:	01 02 03    	\.pword 0x030201
 10a:	80 03 02    	call      0x10380 \<__SPLIM_init\+0x390\>
 10c:	01 00 00 
 10e:	a5 00 00    	nop       
 110:	01 00 00    	nop       
 112:	ff 00 00    	nop       
 114:	01 02 03    	\.pword 0x030201
 116:	01 03 02    	call      0x10301 \<__SPLIM_init\+0x311\>
 118:	01 00 00 
 11a:	ff 00 00    	nop       
 11c:	03 00 00    	nop       
 11e:	01 00 00    	nop       
 120:	1a 00 00    	nop       
 122:	00 00 00    	nop       

00000124 \<__reset\>:
 124:	00 60 fe    	clrwdt    
 126:	00 00 00    	nop       
 128:	00 60 fe    	clrwdt    
 12a:	00 60 fe    	clrwdt    
 12c:	00 00 ff    	nopr      
 12e:	00 00 00    	nop       
Disassembly of section \.text:

00000130 \<\.text\>:
 130:	01 00 00    	nop       
 132:	05 00 00    	nop       
 134:	80 00 00    	nop       
 136:	a5 00 00    	nop       
 138:	01 00 00    	nop       
 13a:	ff 00 00    	nop       
 13c:	a5 00 00    	nop       
 13e:	ff 00 00    	nop       
 140:	03 00 00    	nop       
 142:	01 00 00    	nop       
 144:	1a 00 00    	nop       
	\.\.\.
 14a:	00 00 ff    	nopr      
 14c:	00 00 ff    	nopr      
