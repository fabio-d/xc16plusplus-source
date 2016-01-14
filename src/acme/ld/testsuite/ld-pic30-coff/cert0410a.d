#ld: 
#objects: /ld-pic30-coff/cert0410a.out /ld-pic30-coff/cert0410b.out
#objdump: -d -s -r
#name: HANDLE Relocation


.+cert0410a.o:     file format coff-pic30

Contents of section \.reset:
 0000 100104 000000                .+
Contents of section \.text:
 0100 120104 000000 140104 000000  .+
 0108 2c0104 000000 2e0104 000000  .+
Contents of section \.ivt:
 0004 380100 380100 380100 380100  .+
 000c 380100 380100 380100 380100  .+
 0014 380100 380100 380100 380100  .+
 001c 380100 380100 380100 380100  .+
 0024 380100 380100 380100 380100  .+
 002c 380100 380100 380100 380100  .+
 0034 380100 380100 380100 380100  .+
 003c 380100 380100 380100 380100  .+
 0044 380100 380100 380100 380100  .+
 004c 380100 380100 380100 380100  .+
 0054 380100 380100 380100 380100  .+
 005c 380100 380100 380100 380100  .+
 0064 380100 380100 380100 380100  .+
 006c 380100 380100 380100 380100  .+
 0074 380100 380100 380100 380100  .+
 007c 380100 380100                .+
Contents of section \.aivt:
 0084 380100 380100 380100 380100  .+
 008c 380100 380100 380100 380100  .+
 0094 380100 380100 380100 380100  .+
 009c 380100 380100 380100 380100  .+
 00a4 380100 380100 380100 380100  .+
 00ac 380100 380100 380100 380100  .+
 00b4 380100 380100 380100 380100  .+
 00bc 380100 380100 380100 380100  .+
 00c4 380100 380100 380100 380100  .+
 00cc 380100 380100 380100 380100  .+
 00d4 380100 380100 380100 380100  .+
 00dc 380100 380100 380100 380100  .+
 00e4 380100 380100 380100 380100  .+
 00ec 380100 380100 380100 380100  .+
 00f4 380100 380100 380100 380100  .+
 00fc 380100 380100                .+
Contents of section \.data:
 0800 12011401 2c012e01           .+
Contents of section \.text:
 0110 000000 0000ff 000000 120100  .+
 0118 140100 2c0100 2e0100         .+
Contents of section \.dinit:
 011e 000800 080000 020000 120114  .+
 0126 012c01 2e0100 000000         .+
Contents of section \.text:
 012c 0000ff 000000 120100 140100  .+
 0134 2c0100 2e0100                .+
Contents of section \.isr:
 0138 0000fe                       .+
Disassembly of section \.reset:

00000000 \<\.reset\>:
   0:	10 01 04    	goto      0x110 \<__reset\>
   2:	00 00 00 
Disassembly of section \.text:

00000100 \<\.handle\>:
 100:	12 01 04    	goto      0x112 \<foo_lt\>
 102:	00 00 00 
 104:	14 01 04    	goto      0x114 \<foo_ld\>
 106:	00 00 00 
 108:	2c 01 04    	goto      0x12c \<foo_ed\>
 10a:	00 00 00 
 10c:	2e 01 04    	goto      0x12e \<foo_et\>
 10e:	00 00 00 
Disassembly of section \.ivt:

00000004 \<\.ivt\>:
   4:	38 01 00    	nop       
   6:	38 01 00    	nop       
   8:	38 01 00    	nop       
   a:	38 01 00    	nop       
   c:	38 01 00    	nop       
   e:	38 01 00    	nop       
  10:	38 01 00    	nop       
  12:	38 01 00    	nop       
  14:	38 01 00    	nop       
  16:	38 01 00    	nop       
  18:	38 01 00    	nop       
  1a:	38 01 00    	nop       
  1c:	38 01 00    	nop       
  1e:	38 01 00    	nop       
  20:	38 01 00    	nop       
  22:	38 01 00    	nop       
  24:	38 01 00    	nop       
  26:	38 01 00    	nop       
  28:	38 01 00    	nop       
  2a:	38 01 00    	nop       
  2c:	38 01 00    	nop       
  2e:	38 01 00    	nop       
  30:	38 01 00    	nop       
  32:	38 01 00    	nop       
  34:	38 01 00    	nop       
  36:	38 01 00    	nop       
  38:	38 01 00    	nop       
  3a:	38 01 00    	nop       
  3c:	38 01 00    	nop       
  3e:	38 01 00    	nop       
  40:	38 01 00    	nop       
  42:	38 01 00    	nop       
  44:	38 01 00    	nop       
  46:	38 01 00    	nop       
  48:	38 01 00    	nop       
  4a:	38 01 00    	nop       
  4c:	38 01 00    	nop       
  4e:	38 01 00    	nop       
  50:	38 01 00    	nop       
  52:	38 01 00    	nop       
  54:	38 01 00    	nop       
  56:	38 01 00    	nop       
  58:	38 01 00    	nop       
  5a:	38 01 00    	nop       
  5c:	38 01 00    	nop       
  5e:	38 01 00    	nop       
  60:	38 01 00    	nop       
  62:	38 01 00    	nop       
  64:	38 01 00    	nop       
  66:	38 01 00    	nop       
  68:	38 01 00    	nop       
  6a:	38 01 00    	nop       
  6c:	38 01 00    	nop       
  6e:	38 01 00    	nop       
  70:	38 01 00    	nop       
  72:	38 01 00    	nop       
  74:	38 01 00    	nop       
  76:	38 01 00    	nop       
  78:	38 01 00    	nop       
  7a:	38 01 00    	nop       
  7c:	38 01 00    	nop       
  7e:	38 01 00    	nop       
Disassembly of section \.aivt:

00000084 \<\.aivt\>:
  84:	38 01 00    	nop       
  86:	38 01 00    	nop       
  88:	38 01 00    	nop       
  8a:	38 01 00    	nop       
  8c:	38 01 00    	nop       
  8e:	38 01 00    	nop       
  90:	38 01 00    	nop       
  92:	38 01 00    	nop       
  94:	38 01 00    	nop       
  96:	38 01 00    	nop       
  98:	38 01 00    	nop       
  9a:	38 01 00    	nop       
  9c:	38 01 00    	nop       
  9e:	38 01 00    	nop       
  a0:	38 01 00    	nop       
  a2:	38 01 00    	nop       
  a4:	38 01 00    	nop       
  a6:	38 01 00    	nop       
  a8:	38 01 00    	nop       
  aa:	38 01 00    	nop       
  ac:	38 01 00    	nop       
  ae:	38 01 00    	nop       
  b0:	38 01 00    	nop       
  b2:	38 01 00    	nop       
  b4:	38 01 00    	nop       
  b6:	38 01 00    	nop       
  b8:	38 01 00    	nop       
  ba:	38 01 00    	nop       
  bc:	38 01 00    	nop       
  be:	38 01 00    	nop       
  c0:	38 01 00    	nop       
  c2:	38 01 00    	nop       
  c4:	38 01 00    	nop       
  c6:	38 01 00    	nop       
  c8:	38 01 00    	nop       
  ca:	38 01 00    	nop       
  cc:	38 01 00    	nop       
  ce:	38 01 00    	nop       
  d0:	38 01 00    	nop       
  d2:	38 01 00    	nop       
  d4:	38 01 00    	nop       
  d6:	38 01 00    	nop       
  d8:	38 01 00    	nop       
  da:	38 01 00    	nop       
  dc:	38 01 00    	nop       
  de:	38 01 00    	nop       
  e0:	38 01 00    	nop       
  e2:	38 01 00    	nop       
  e4:	38 01 00    	nop       
  e6:	38 01 00    	nop       
  e8:	38 01 00    	nop       
  ea:	38 01 00    	nop       
  ec:	38 01 00    	nop       
  ee:	38 01 00    	nop       
  f0:	38 01 00    	nop       
  f2:	38 01 00    	nop       
  f4:	38 01 00    	nop       
  f6:	38 01 00    	nop       
  f8:	38 01 00    	nop       
  fa:	38 01 00    	nop       
  fc:	38 01 00    	nop       
  fe:	38 01 00    	nop       
Disassembly of section \.text:

00000110 \<__reset\>:
 110:	00 00 00    	nop       

00000112 \<foo_lt\>:
 112:	00 00 ff    	nopr      

00000114 \<foo_ld\>:
 114:	00 00 00    	nop       
 116:	12 01 00    	nop       
 118:	14 01 00    	nop       
 11a:	2c 01 00    	nop       
 11c:	2e 01 00    	nop       
Disassembly of section \.dinit:

0000011e \<\.dinit\>:
 11e:	00 08 00    	nop       
 120:	08 00 00    	nop       
 122:	02 00 00    	nop       
 124:	12 01 14    	subr\.w    w8, \[w2], w2
 126:	01 2c 01    	\.pword 0x012c01
 128:	2e 01 00    	nop       
 12a:	00 00 00    	nop       
Disassembly of section \.text:

0000012c \<foo_ed\>:
 12c:	00 00 ff    	nopr      

0000012e \<foo_et\>:
 12e:	00 00 00    	nop       
 130:	12 01 00    	nop       
 132:	14 01 00    	nop       
 134:	2c 01 00    	nop       
 136:	2e 01 00    	nop       
Disassembly of section \.isr:

00000138 \<__DefaultInterrupt\>:
 138:	00 00 fe    	reset     
