#ld: 
#objects: /ld-pic30-coff/cert0700a.out /ld-pic30-coff/cert0700b.out
#objdump: -d -j foo
#name: .align directive in an arbitrary readonly section 

.*cert0700a.o:     file format coff-pic30

Disassembly of section foo:

00008730 \<foo\>:
	\.\.\.

0000873c \<algn4\>:
	\.\.\.

00008840 \<algn0x10\>:
	\.\.\.

00008848 \<algn2\>:
    8848:	01 00       	\.word 0x1
	\.\.\.

00008850 \<fileb1\>:
    8850:	01 00       	\.word 0x1
    8852:	00 00       	\.word 0
    8854:	02 03       	\.word 0x302

00008855 \<fileb2\>:
    8855:	00 00       	\.word 0
	\.\.\.
