#ld: 
#objects: /ld-pic30-coff/cert0701a.out /ld-pic30-coff/cert0701b.out
#objdump: -d -j foo_r 
#name: .align directive in an arbitrary readonly section 

.*cert0701a\.o:     file format coff-pic30

Disassembly of section foo_r:

00008a00 \<foo_r\>:
	\.\.\.

00008a0a \<r_foo0a\>:
    8a0a:	01 12       	\.word 0x1201

00008a0c \<r_foo1\>:
	\.\.\.
    8b0a:	00 34       	\.word 0x3400
    8b0c:	34 34       	\.word 0x3434
    8b0e:	34 34       	\.word 0x3434

00008b10 \<r_foo2\>:
	\.\.\.
    8b18:	00 56       	\.word 0x5600
    8b1a:	56 56       	\.word 0x5656
    8b1c:	56 56       	\.word 0x5656
    8b1e:	56 56       	\.word 0x5656

00008b20 \<r_foo3\>:
    8b20:	00 a5       	\.word 0xa500
	\.\.\.

00008b30 \<r_foo4\>:
    8b30:	00 a6       	\.word 0xa600
    8b32:	9a 9a       	\.word 0x9a9a
    8b34:	9a 9a       	\.word 0x9a9a
    8b36:	9a 9a       	\.word 0x9a9a
    8b38:	9a 9a       	\.word 0x9a9a
    8b3a:	9a 9a       	\.word 0x9a9a
    8b3c:	9a 9a       	\.word 0x9a9a
    8b3e:	9a 9a       	\.word 0x9a9a
    8b40:	9a 9a       	\.word 0x9a9a
    8b42:	9a 9a       	\.word 0x9a9a
    8b44:	9a 9a       	\.word 0x9a9a
    8b46:	9a 9a       	\.word 0x9a9a
    8b48:	9a 9a       	\.word 0x9a9a
    8b4a:	9a 9a       	\.word 0x9a9a
    8b4c:	9a 9a       	\.word 0x9a9a
    8b4e:	9a 9a       	\.word 0x9a9a
    8b50:	9a 9a       	\.word 0x9a9a
    8b52:	9a 9a       	\.word 0x9a9a
    8b54:	9a 9a       	\.word 0x9a9a
    8b56:	9a 9a       	\.word 0x9a9a
    8b58:	9a 9a       	\.word 0x9a9a
    8b5a:	9a 9a       	\.word 0x9a9a
    8b5c:	9a 9a       	\.word 0x9a9a
    8b5e:	9a 9a       	\.word 0x9a9a
    8b60:	9a 9a       	\.word 0x9a9a
    8b62:	9a 9a       	\.word 0x9a9a
    8b64:	9a 9a       	\.word 0x9a9a
    8b66:	9a 9a       	\.word 0x9a9a
    8b68:	9a 9a       	\.word 0x9a9a
    8b6a:	9a 9a       	\.word 0x9a9a
    8b6c:	9a 9a       	\.word 0x9a9a
    8b6e:	9a 9a       	\.word 0x9a9a
    8b70:	9a 9a       	\.word 0x9a9a
    8b72:	9a 9a       	\.word 0x9a9a
    8b74:	9a 9a       	\.word 0x9a9a
    8b76:	9a 9a       	\.word 0x9a9a
    8b78:	9a 9a       	\.word 0x9a9a
    8b7a:	9a 9a       	\.word 0x9a9a
    8b7c:	9a 9a       	\.word 0x9a9a
    8b7e:	9a 9a       	\.word 0x9a9a

00008b80 \<r_foo5\>:
    8b80:	00 a7       	\.word 0xa700
    8b82:	01 00       	\.word 0x1
	\.\.\.

00008c00 \<filebr_foo0\>:
	\.\.\.

00008c09 \<filebr_foo1\>:
	\.\.\.
    8d07:	00 00       	\.word 0
    8d09:	00 00       	\.word 0
    8d0b:	00 00       	\.word 0
    8d0d:	00 00       	\.word 0
	\.\.\.

00008d10 \<filebr_foo2\>:
	\.\.\.
    8d18:	00 56       	\.word 0x5600
    8d1a:	56 56       	\.word 0x5656
    8d1c:	56 56       	\.word 0x5656
    8d1e:	56 56       	\.word 0x5656

00008d20 \<filebr_foo3\>:
    8d20:	00 a5       	\.word 0xa500
	\.\.\.

00008d30 \<filebr_foo4\>:
    8d30:	00 a6       	\.word 0xa600
    8d32:	9a 9a       	\.word 0x9a9a
    8d34:	9a 9a       	\.word 0x9a9a
    8d36:	9a 9a       	\.word 0x9a9a
    8d38:	9a 9a       	\.word 0x9a9a
    8d3a:	9a 9a       	\.word 0x9a9a
    8d3c:	9a 9a       	\.word 0x9a9a
    8d3e:	9a 9a       	\.word 0x9a9a
    8d40:	9a 9a       	\.word 0x9a9a
    8d42:	9a 9a       	\.word 0x9a9a
    8d44:	9a 9a       	\.word 0x9a9a
    8d46:	9a 9a       	\.word 0x9a9a
    8d48:	9a 9a       	\.word 0x9a9a
    8d4a:	9a 9a       	\.word 0x9a9a
    8d4c:	9a 9a       	\.word 0x9a9a
    8d4e:	9a 9a       	\.word 0x9a9a
    8d50:	9a 9a       	\.word 0x9a9a
    8d52:	9a 9a       	\.word 0x9a9a
    8d54:	9a 9a       	\.word 0x9a9a
    8d56:	9a 9a       	\.word 0x9a9a
    8d58:	9a 9a       	\.word 0x9a9a
    8d5a:	9a 9a       	\.word 0x9a9a
    8d5c:	9a 9a       	\.word 0x9a9a
    8d5e:	9a 9a       	\.word 0x9a9a
    8d60:	9a 9a       	\.word 0x9a9a
    8d62:	9a 9a       	\.word 0x9a9a
    8d64:	9a 9a       	\.word 0x9a9a
    8d66:	9a 9a       	\.word 0x9a9a
    8d68:	9a 9a       	\.word 0x9a9a
    8d6a:	9a 9a       	\.word 0x9a9a
    8d6c:	9a 9a       	\.word 0x9a9a
    8d6e:	9a 9a       	\.word 0x9a9a
    8d70:	9a 9a       	\.word 0x9a9a
    8d72:	9a 9a       	\.word 0x9a9a
    8d74:	9a 9a       	\.word 0x9a9a
    8d76:	9a 9a       	\.word 0x9a9a
    8d78:	9a 9a       	\.word 0x9a9a
    8d7a:	9a 9a       	\.word 0x9a9a
    8d7c:	9a 9a       	\.word 0x9a9a
    8d7e:	9a 9a       	\.word 0x9a9a

00008d80 \<filebr_foo5\>:
    8d80:	00 a7       	\.word 0xa700
    8d82:	01 00       	\.word 0x1
	\.\.\.
