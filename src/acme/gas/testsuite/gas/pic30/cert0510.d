
dump\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<L21\>:
   0:	00 00 00    	nop       
Disassembly of section \.data:

00000000 \<\.data\>:
   0:	01 00    	\.word 0x01
			1: PADDR	foo0
	\.\.\.
			5: PADDR	const0
			9: PADDR	L11
			d: PADDR	L21
			11: PADDR	noplab
			15: PADDR	foo2
			19: PADDR	const1
Disassembly of section foo0:

00000000 \<foo0-0x100\>:
	\.\.\.

00000100 \<foo0\>:
 100:	00 01    	\.word 0x100
	\.\.\.
			105: PADDR	foo0
			109: PADDR	const0
			10d: PADDR	L11
			111: PADDR	L21
			115: PADDR	noplab
			119: PADDR	foo2
			11d: PADDR	const1
Disassembly of section \.const:

00000000 \<\.const\>:
	\.\.\.
			0: PADDR	foo0
			4: PADDR	const0
			8: PADDR	L11
			c: PADDR	L21
			10: PADDR	noplab
			14: PADDR	foo2
			18: PADDR	const1
  1c:	01 00    	\.word 0x01
	\.\.\.

000000ff \<const0\>:
  ff:	10 00    	\.word 0x10

00000100 \<L0\>:
	\.\.\.
 120:	11 04    	\.word 0x411
	\.\.\.

00000200 \<const1\>:
 200:	40 00    	\.word 0x40

00000201 \<L0\>:
	\.\.\.
 207:	44 00    	\.word 0x44
			208: PADDR	foo0
	\.\.\.
			20c: PADDR	const0
			210: PADDR	L11
			214: PADDR	L21
			218: PADDR	noplab
			21c: PADDR	foo2
			220: PADDR	const1
Disassembly of section foo1:

00000000 \<foo1\>:
       0:	02 00    	\.word 0x02
	\.\.\.

00008000 \<L11\>:
    8000:	20 00    	\.word 0x20

00008001 \<L0\>:
	\.\.\.
    8011:	22 00    	\.word 0x22
			8012: PADDR	foo0
	\.\.\.
			8016: PADDR	const0
			801a: PADDR	L11
			801e: PADDR	L21
			8022: PADDR	noplab
			8026: PADDR	foo2
			802a: PADDR	const1
Disassembly of section foo2:

00000000 \<foo2\>:
   0:	03 00    	\.word 0x03

00000001 \<L0\>:
	\.\.\.
   5:	33 44    	\.word 0x4433
	\.\.\.
			7: PADDR	foo0
			b: PADDR	const0
			f: PADDR	L11
			13: PADDR	L21
			17: PADDR	noplab
			1b: PADDR	foo2
			1f: PADDR	const1
