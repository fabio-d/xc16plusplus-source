#as: --listing-cont-lines=10
#name: ssr 23359: Provide a second mnemonic for the BRA Z and BRA NZ instructions
#objdump: -d -r
#source: ssr23359.s


.*\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<\.text\>:
   0:	00 00 32    	bra       Z, \. \+ 0x2
			0: PC RELATIVE BRANCH	L11
   2:	00 00 32    	bra       Z, \. \+ 0x2
			2: PC RELATIVE BRANCH	L21
   4:	00 00 3a    	bra       NZ, \. \+ 0x2
			4: PC RELATIVE BRANCH	L11
   6:	00 00 3a    	bra       NZ, \. \+ 0x2
			6: PC RELATIVE BRANCH	L21

00000008 \<L11\>:
   8:	00 00 00    	nop       

0000000a \<L21\>:
   a:	00 00 00    	nop       
