#as: 
#objdump: -d -r
#name: RCALL with literal operand

dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<\.text\>:
       0:	00 00 07    	rcall     \. \+ 0x2
			0: BRANCH ABSOLUTE	L0
	\.\.\.
    8000:	00 00 07    	rcall     \. \+ 0x2
			8000: BRANCH ABSOLUTE	L0
