#ld:
#objects: /ld-pic30-coff/cert0402a.out /ld-pic30-coff/cert0402b.out
#objdump: -d -j .text
#name: BIT_SELECT_4 Relocation

\./\./ld-pic30-coff/tmpdir/cert0402a\.o:     file format coff-pic30

Disassembly of section \.text:

000001bc <\.text>:
 1bc:	00 00 ff    	nopr      
 1be:	35 50 a3    	btst\.c    \[w5\+\+\], #0x5
 1c0:	00 00 ff    	nopr      
 1c2:	00 00 ff    	nopr      
	\.\.\.
 1c8:	55 88 a3    	btst\.z    \[\+\+w5\], #0x8

000001ca <__reset>:
 1ca:	01 50 a3    	btst\.c    w1, #0x5
 1cc:	12 88 a3    	btst\.z    \[w2\], #0x8
 1ce:	12 80 a3    	btst\.c    \[w2\], #0x8
