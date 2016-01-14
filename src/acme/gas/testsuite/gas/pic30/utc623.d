#objdump: -d
#name: Extended mnemonic BTST[.W]


# Test to ensure that the extended mnemonic
# BTST[.W] is translated to BTST.B.

.*: .*


Disassembly of section .text:

00000000 <.text>:
   0:	00 20 ab    	btst.b    0x0, #0x1
   2:	01 20 ab    	btst.b    0x1, #0x1
   4:	02 20 ab    	btst.b    0x2, #0x1
   6:	03 20 ab    	btst.b    0x3, #0x1
   8:	04 20 ab    	btst.b    0x4, #0x1
   a:	05 20 ab    	btst.b    0x5, #0x1
   c:	00 20 ab    	btst.b    0x0, #0x1
   e:	01 20 ab    	btst.b    0x1, #0x1
  10:	02 20 ab    	btst.b    0x2, #0x1
  12:	03 20 ab    	btst.b    0x3, #0x1
  14:	04 20 ab    	btst.b    0x4, #0x1
  16:	05 20 ab    	btst.b    0x5, #0x1
  18:	00 20 ab    	btst.b    0x0, #0x1
  1a:	01 20 ab    	btst.b    0x1, #0x1
  1c:	02 20 ab    	btst.b    0x2, #0x1
  1e:	03 20 ab    	btst.b    0x3, #0x1
  20:	04 20 ab    	btst.b    0x4, #0x1
  22:	05 20 ab    	btst.b    0x5, #0x1
