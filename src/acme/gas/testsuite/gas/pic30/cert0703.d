#as:
#objdump: -d -r -j ".text"
#name: .incbin directive aligned in .text
#source: cert0703.s

.*\.o:     file format coff-pic30

Disassembly of section \.text:

00000000 \<\.text\>:
   0:	00 00 04    	goto      0x0 \<\.text\>
   2:	00 00 00 
			0: PROGRAM ADDRESS LSB	END
			2: PROGRAM ADDRESS MSB	END
	\.\.\.
  10:	00 01 00    	nop       
  12:	02 03 00    	nop       
  14:	04 05 00    	nop       
  16:	06 07 00    	nop       
  18:	08 09 00    	nop       
  1a:	0a 0b 00    	nop       
  1c:	0c 0d 00    	nop       
  1e:	0e 0f 00    	nop       
  20:	10 11 00    	nop       
  22:	12 13 00    	nop       
  24:	14 15 00    	nop       
  26:	16 17 00    	nop       
  28:	18 19 00    	nop       
  2a:	1a 1b 00    	nop       
  2c:	1c 1d 00    	nop       
  2e:	1e 1f 00    	nop       
  30:	20 21 00    	nop       
  32:	22 23 00    	nop       
  34:	24 25 00    	nop       
  36:	26 27 00    	nop       
  38:	28 29 00    	nop       
  3a:	2a 2b 00    	nop       
  3c:	2c 2d 00    	nop       
  3e:	2e 2f 00    	nop       
  40:	30 31 00    	nop       
  42:	32 33 00    	nop       
  44:	34 35 00    	nop       
  46:	36 37 00    	nop       
  48:	38 39 00    	nop       
  4a:	3a 3b 00    	nop       
  4c:	3c 3d 00    	nop       
  4e:	3e 3f 00    	nop       
  50:	40 41 00    	nop       
  52:	42 43 00    	nop       
  54:	44 45 00    	nop       
  56:	46 47 00    	nop       
  58:	48 49 00    	nop       
  5a:	4a 4b 00    	nop       
  5c:	4c 4d 00    	nop       
  5e:	4e 4f 00    	nop       
  60:	50 51 00    	nop       
  62:	52 53 00    	nop       
  64:	54 55 00    	nop       
  66:	56 57 00    	nop       
  68:	58 59 00    	nop       
  6a:	5a 5b 00    	nop       
  6c:	5c 5d 00    	nop       
  6e:	5e 5f 00    	nop       
  70:	60 61 00    	nop       
  72:	62 63 00    	nop       
  74:	64 65 00    	nop       
  76:	66 67 00    	nop       
  78:	68 69 00    	nop       
  7a:	6a 6b 00    	nop       
  7c:	6c 6d 00    	nop       
  7e:	6e 6f 00    	nop       
  80:	70 71 00    	nop       
  82:	72 73 00    	nop       
  84:	74 75 00    	nop       
  86:	76 77 00    	nop       
  88:	78 79 00    	nop       
  8a:	7a 7b 00    	nop       
  8c:	7c 7d 00    	nop       
  8e:	7e 7f 00    	nop       
  90:	80 81 00    	nop       
  92:	82 83 00    	nop       
  94:	84 85 00    	nop       
  96:	86 87 00    	nop       
  98:	88 89 00    	nop       
  9a:	8a 8b 00    	nop       
  9c:	8c 8d 00    	nop       
  9e:	8e 8f 00    	nop       
  a0:	90 91 00    	nop       
  a2:	92 93 00    	nop       
  a4:	94 95 00    	nop       
  a6:	96 97 00    	nop       
  a8:	98 99 00    	nop       
  aa:	9a 9b 00    	nop       
  ac:	9c 9d 00    	nop       
  ae:	9e 9f 00    	nop       
  b0:	a0 a1 00    	nop       
  b2:	a2 a3 00    	nop       
  b4:	a4 a5 00    	nop       
  b6:	a6 a7 00    	nop       
  b8:	a8 a9 00    	nop       
  ba:	aa ab 00    	nop       
  bc:	ac ad 00    	nop       
  be:	ae af 00    	nop       
  c0:	b0 b1 00    	nop       
  c2:	b2 b3 00    	nop       
  c4:	b4 b5 00    	nop       
  c6:	b6 b7 00    	nop       
  c8:	b8 b9 00    	nop       
  ca:	ba bb 00    	nop       
  cc:	bc bd 00    	nop       
  ce:	be bf 00    	nop       
  d0:	c0 c1 00    	nop       
  d2:	c2 c3 00    	nop       
  d4:	c4 c5 00    	nop       
  d6:	c6 c7 00    	nop       
  d8:	c8 c9 00    	nop       
  da:	ca cb 00    	nop       
  dc:	cc cd 00    	nop       
  de:	ce cf 00    	nop       
  e0:	d0 d1 00    	nop       
  e2:	d2 d3 00    	nop       
  e4:	d4 d5 00    	nop       
  e6:	d6 d7 00    	nop       
  e8:	d8 d9 00    	nop       
  ea:	da db 00    	nop       
  ec:	dc dd 00    	nop       
  ee:	de df 00    	nop       
  f0:	e0 e1 00    	nop       
  f2:	e2 e3 00    	nop       
  f4:	e4 e5 00    	nop       
  f6:	e6 e7 00    	nop       
  f8:	e8 e9 00    	nop       
  fa:	ea eb 00    	nop       
  fc:	ec ed 00    	nop       
  fe:	ee ef 00    	nop       
 100:	f0 f1 00    	nop       
 102:	f2 f3 00    	nop       
 104:	f4 f5 00    	nop       
 106:	f6 f7 00    	nop       
 108:	f8 f9 00    	nop       
 10a:	fa fb 00    	nop       
 10c:	fc fd 00    	nop       
 10e:	fe ff 00    	nop       
 110:	00 00 00    	nop       

00000112 \<END\>:
 112:	00 40 da    	\.pword 0xda4000
	\.\.\.
