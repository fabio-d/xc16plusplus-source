#ld:
#objects: /ld-pic30-coff/cert0404a.out /ld-pic30-coff/cert0404b.out
#objdump: -d -j .text
#name: BRANCH_ABSOLUTE Relocation


.*/ld-pic30-coff/tmpdir/cert0404a\.o:     file format coff-pic30

Disassembly of section \.text:

00000100 \<\.text\>:
	\.\.\.
    9d60:	00 00 ff    	nopr      
    9d62:	00 00 ff    	nopr      
    9d64:	00 00 ff    	nopr      

00009d66 \<L0\>:
    9d66:	ff bf 37    	bra       0x1d66
	\.\.\.

00009d80 \<L0\>:
    9d80:	fe ff 37    	bra       0x9d7e
	\.\.\.

00009da2 \<__reset\>:
	\.\.\.
    9daa:	2a d1 37    	bra       0x4000
    9dac:	00 00 ff    	nopr      
    9dae:	00 00 ff    	nopr      
    9db0:	00 00 ff    	nopr      
    9db2:	00 00 ff    	nopr      
    9db4:	00 00 ff    	nopr      
	\.\.\.

000139e2 \<L0\>:
   139e2:	00 00 37    	bra       0x139e4
	\.\.\.

000139f4 \<L0\>:
   139f4:	fa ff 37    	bra       0x139ea
	\.\.\.
   13a06:	00 00 ff    	nopr      
   13a08:	00 00 ff    	nopr      
   13a0a:	00 00 ff    	nopr      
