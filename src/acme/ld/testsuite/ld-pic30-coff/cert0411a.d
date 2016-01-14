#ld:
#objects: /ld-pic30-coff/cert0411a.out /ld-pic30-coff/cert0411b.out
#objdump: -d -j .text
#name: LOOP_COUNT Relocation

.*cert0411a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
 100:	01 01 78    	mov\.w     w1, w2
 102:	00 00 ff    	nopr      
 104:	00 00 ff    	nopr      
 106:	01 00 08    	do        #0x1, 0x4
 108:	7d ff 00 
 10a:	00 00 ff    	nopr      
 10c:	00 00 ff    	nopr      
 10e:	01 00 08    	do        #0x1, 0x13e \<extnval\>
 110:	16 00 00 
 112:	00 00 ff    	nopr      
 114:	00 00 ff    	nopr      
 116:	02 00 08    	do        #0x2, 0x7ffe
 118:	72 3f 00 
 11a:	86 02 78    	mov\.w     w6, w5
 11c:	ff 3f 08    	do        #0x3fff, 0x2
 11e:	71 ff 00 
 120:	05 03 78    	mov\.w     w5, w6
 122:	86 03 78    	mov\.w     w6, w7
 124:	03 00 08    	do        #0x3, 0x7ffe
 126:	6b 3f 00 
 128:	00 00 ff    	nopr      
 12a:	2e 01 04    	goto      0x12e \<main\>
 12c:	00 00 00 

0000012e \<main\>:
 12e:	01 01 78    	mov\.w     w1, w2
 130:	00 00 ff    	nopr      
 132:	00 00 ff    	nopr      
 134:	00 00 ff    	nopr      
 136:	00 00 ff    	nopr      
 138:	00 00 ff    	nopr      
 13a:	00 00 ff    	nopr      
 13c:	00 00 00    	nop       

0000013e \<extnval\>:
 13e:	86 02 78    	mov\.w     w6, w5
 140:	02 00 08    	do        #0x2, 0x64
 142:	90 ff 00 
 144:	05 03 78    	mov\.w     w5, w6
 146:	86 03 78    	mov\.w     w6, w7
 148:	00 00 ff    	nopr      
