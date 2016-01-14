#ld: 
#objects: /ld-pic30-coff/cert0425a.out /ld-pic30-coff/cert0425b.out
#objdump: -d -j .text
#name: SFR Relocation

.*cert0425a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<__reset\>:
	\.\.\.
 10e:	46 80 bf    	mov\.w     0x46, WREG
 110:	44 80 bf    	mov\.w     0x44, WREG
 112:	46 80 bf    	mov\.w     0x46, WREG
 114:	44 80 bf    	mov\.w     0x44, WREG
 116:	46 80 bf    	mov\.w     0x46, WREG
 118:	44 80 bf    	mov\.w     0x44, WREG
 11a:	46 80 bf    	mov\.w     0x46, WREG
 11c:	44 80 bf    	mov\.w     0x44, WREG
 11e:	46 80 bf    	mov\.w     0x46, WREG
 120:	44 80 bf    	mov\.w     0x44, WREG
 122:	46 80 bf    	mov\.w     0x46, WREG
 124:	02 88 bf    	mov\.w     0x802, WREG
 126:	00 88 bf    	mov\.w     0x800, WREG

00000128 \<\.text\>:
 128:	00 00 ff    	nopr      
 12a:	00 00 ff    	nopr      
 12c:	00 00 ff    	nopr      
 12e:	00 00 ff    	nopr      
 130:	00 00 ff    	nopr      
 132:	00 00 ff    	nopr      
 134:	00 00 ff    	nopr      
 136:	46 80 bf    	mov\.w     0x46, WREG
 138:	44 80 bf    	mov\.w     0x44, WREG
 13a:	46 80 bf    	mov\.w     0x46, WREG
 13c:	44 80 bf    	mov\.w     0x44, WREG
 13e:	46 80 bf    	mov\.w     0x46, WREG
 140:	44 80 bf    	mov\.w     0x44, WREG
 142:	46 80 bf    	mov\.w     0x46, WREG
 144:	44 80 bf    	mov\.w     0x44, WREG
 146:	46 80 bf    	mov\.w     0x46, WREG
 148:	44 80 bf    	mov\.w     0x44, WREG
 14a:	46 80 bf    	mov\.w     0x46, WREG
 14c:	02 88 bf    	mov\.w     0x802, WREG
 14e:	00 88 bf    	mov\.w     0x800, WREG
