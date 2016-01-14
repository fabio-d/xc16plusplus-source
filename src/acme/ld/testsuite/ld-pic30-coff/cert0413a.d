#ld: 
#objects: /ld-pic30-coff/cert0413a.out /ld-pic30-coff/cert0413b.out
#objdump: -d -j .text
#name: TBLOFFSET Relocation

.+cert0413a\.o:     file format .+-pic30

Disassembly of section \.text:

00000100 <\.text>:
	\.\.\.

00000104 <externfooA1>:
 104:	01 00 00    	nop       
 106:	00 00 00    	nop       

00000108 <externfooA2>:
 108:	02 00 00    	nop       
 10a:	00 00 00    	nop       

0000010c <externfooA3>:
 10c:	a5 00 00    	nop       
 10e:	00 00 00    	nop       

00000110 <externfooA4>:
 110:	ff 00 00    	nop       
 112:	00 00 00    	nop       

00000114 <pwordBfroma>:
 114:	30 01 00    	nop       
 116:	34 01 00    	nop       
 118:	38 01 00    	nop       
 11a:	3c 01 00    	nop       

0000011c <pwordAfroma>:
 11c:	04 01 00    	nop       
 11e:	08 01 00    	nop       
 120:	0c 01 00    	nop       
 122:	10 01 00    	nop       

00000124 <__reset>:
	\.\.\.
 12a:	00 00 ff    	nopr      
 12c:	00 00 ff    	nopr      
 12e:	00 00 ff    	nopr      

00000130 <externfooB1>:
 130:	02 00 00    	nop       
 132:	00 00 00    	nop       

00000134 <externfooB2>:
 134:	04 00 00    	nop       
 136:	00 00 00    	nop       

00000138 <externfooB3>:
 138:	5a 00 00    	nop       
 13a:	00 00 00    	nop       

0000013c <externfooB4>:
 13c:	00 ff 00    	nop       
 13e:	00 00 00    	nop       

00000140 <pwordBfromb>:
 140:	30 01 00    	nop       
 142:	34 01 00    	nop       
 144:	38 01 00    	nop       
 146:	3c 01 00    	nop       

00000148 <pwordAfromb>:
 148:	04 01 00    	nop       
 14a:	08 01 00    	nop       
 14c:	0c 01 00    	nop       
 14e:	10 01 00    	nop       

00000150 <startnop>:
	\.\.\.
 156:	00 00 ff    	nopr      
 158:	00 00 ff    	nopr      
 15a:	00 00 ff    	nopr      
