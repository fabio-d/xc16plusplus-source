#ld: 
#objects: /ld-pic30-coff/cert0440a.out /ld-pic30-coff/cert0440b.out
#objdump: -d -j .text
#name: WORD_TBLOFFSET relocation in .text


.+cert0440b\.o:     file format coff-pic30[[:space:]]*

Disassembly of section \.text:

00000100 \<\.text\>:
     100:	00 00 ff    	nopr      
     102:	00 00 ff    	nopr      
     104:	8e 12 2c    	mov\.w     \#0xc128, w14
     106:	ad 12 2c    	mov\.w     \#0xc12a, w13
     108:	cc 12 2c    	mov\.w     \#0xc12c, w12
     10a:	eb 12 2c    	mov\.w     \#0xc12e, w11
     10c:	0a 13 2c    	mov\.w     \#0xc130, w10
     10e:	09 50 24    	mov\.w     \#0x4500, w9
     110:	28 90 2f    	mov\.w     \#0xf902, w8
     112:	27 90 24    	mov\.w     \#0x4902, w7
     114:	46 d0 24    	mov\.w     \#0x4d04, w6
     116:	05 10 2c    	mov\.w     \#0xc100, w5
     118:	00 00 ff    	nopr      
     11a:	00 00 ff    	nopr      
     11c:	00 00 ff    	nopr      
     11e:	00 00 ff    	nopr      
     120:	00 00 ff    	nopr      
     122:	00 00 ff    	nopr      
	\.\.\.

00024500 \<symBT1\>:
	\.\.\.

0002f902 \<symBT2\>:
	\.\.\.

00034902 \<symBT3\>:
	\.\.\.

00034d04 \<symBT4\>:
	\.\.\.

0003c100 \<symBT5\>:
   3c100:	00 00 00    	nop       

0003c102 \<__reset\>:
   3c102:	00 00 00    	nop       
   3c104:	00 00 ff    	nopr      
   3c106:	00 00 ff    	nopr      
   3c108:	8e 12 2c    	mov\.w     \#0xc128, w14
   3c10a:	ad 12 2c    	mov\.w     \#0xc12a, w13
   3c10c:	cc 12 2c    	mov\.w     \#0xc12c, w12
   3c10e:	eb 12 2c    	mov\.w     \#0xc12e, w11
   3c110:	0a 13 2c    	mov\.w     \#0xc130, w10
   3c112:	09 50 24    	mov\.w     \#0x4500, w9
   3c114:	28 90 2f    	mov\.w     \#0xf902, w8
   3c116:	27 90 24    	mov\.w     \#0x4902, w7
   3c118:	46 d0 24    	mov\.w     \#0x4d04, w6
   3c11a:	05 10 2c    	mov\.w     \#0xc100, w5
   3c11c:	00 00 ff    	nopr      
   3c11e:	00 00 ff    	nopr      
   3c120:	00 00 ff    	nopr      
   3c122:	00 00 ff    	nopr      
   3c124:	00 00 ff    	nopr      
   3c126:	00 00 ff    	nopr      

0003c128 \<symAT1\>:
   3c128:	00 00 00    	nop       

0003c12a \<symAT2\>:
   3c12a:	00 00 00    	nop       

0003c12c \<symAT3\>:
   3c12c:	00 00 00    	nop       

0003c12e \<symAT4\>:
   3c12e:	00 00 00    	nop       

0003c130 \<symAT5\>:
   3c130:	00 00 00    	nop       
