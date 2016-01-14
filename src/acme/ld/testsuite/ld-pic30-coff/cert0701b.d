#ld: 
#objects: /ld-pic30-coff/cert0701a.out /ld-pic30-coff/cert0701b.out
#objdump: -d -j .const
#name: .align directive in an readonly .const section 

.*cert0701b\.o:     file format coff-pic30

Disassembly of section \.const:

00008600 \<const_foo0\>:
	\.\.\.

00008609 \<const_foo1\>:
	\.\.\.
    8707:	00 00       	\.word 0
    8709:	00 00       	\.word 0
    870b:	00 00       	\.word 0
    870d:	00 00       	\.word 0
	\.\.\.

00008710 \<const_foo2\>:
	\.\.\.
    8718:	00 56       	\.word 0x5600
    871a:	56 56       	\.word 0x5656
    871c:	56 56       	\.word 0x5656
    871e:	56 56       	\.word 0x5656

00008720 \<const_foo3\>:
    8720:	00 a5       	\.word 0xa500
	\.\.\.

00008730 \<const_foo4\>:
    8730:	00 a6       	\.word 0xa600
    8732:	9a 9a       	\.word 0x9a9a
    8734:	9a 9a       	\.word 0x9a9a
    8736:	9a 9a       	\.word 0x9a9a
    8738:	9a 9a       	\.word 0x9a9a
    873a:	9a 9a       	\.word 0x9a9a
    873c:	9a 9a       	\.word 0x9a9a
    873e:	9a 9a       	\.word 0x9a9a
    8740:	9a 9a       	\.word 0x9a9a
    8742:	9a 9a       	\.word 0x9a9a
    8744:	9a 9a       	\.word 0x9a9a
    8746:	9a 9a       	\.word 0x9a9a
    8748:	9a 9a       	\.word 0x9a9a
    874a:	9a 9a       	\.word 0x9a9a
    874c:	9a 9a       	\.word 0x9a9a
    874e:	9a 9a       	\.word 0x9a9a
    8750:	9a 9a       	\.word 0x9a9a
    8752:	9a 9a       	\.word 0x9a9a
    8754:	9a 9a       	\.word 0x9a9a
    8756:	9a 9a       	\.word 0x9a9a
    8758:	9a 9a       	\.word 0x9a9a
    875a:	9a 9a       	\.word 0x9a9a
    875c:	9a 9a       	\.word 0x9a9a
    875e:	9a 9a       	\.word 0x9a9a
    8760:	9a 9a       	\.word 0x9a9a
    8762:	9a 9a       	\.word 0x9a9a
    8764:	9a 9a       	\.word 0x9a9a
    8766:	9a 9a       	\.word 0x9a9a
    8768:	9a 9a       	\.word 0x9a9a
    876a:	9a 9a       	\.word 0x9a9a
    876c:	9a 9a       	\.word 0x9a9a
    876e:	9a 9a       	\.word 0x9a9a
    8770:	9a 9a       	\.word 0x9a9a
    8772:	9a 9a       	\.word 0x9a9a
    8774:	9a 9a       	\.word 0x9a9a
    8776:	9a 9a       	\.word 0x9a9a
    8778:	9a 9a       	\.word 0x9a9a
    877a:	9a 9a       	\.word 0x9a9a
    877c:	9a 9a       	\.word 0x9a9a
    877e:	9a 9a       	\.word 0x9a9a

00008780 \<const_foo5\>:
    8780:	00 a7       	\.word 0xa700
    8782:	01 00       	\.word 0x1
	\.\.\.

00008800 \<constbr_foo0\>:
	\.\.\.

00008809 \<constbr_foo1\>:
	\.\.\.
    8907:	00 00       	\.word 0
    8909:	00 00       	\.word 0
    890b:	00 00       	\.word 0
    890d:	00 00       	\.word 0
	\.\.\.

00008910 \<constbr_foo2\>:
	\.\.\.
    8918:	00 56       	\.word 0x5600
    891a:	56 56       	\.word 0x5656
    891c:	56 56       	\.word 0x5656
    891e:	56 56       	\.word 0x5656

00008920 \<constbr_foo3\>:
    8920:	00 a5       	\.word 0xa500
	\.\.\.

00008930 \<constbr_foo4\>:
    8930:	00 a6       	\.word 0xa600
    8932:	9a 9a       	\.word 0x9a9a
    8934:	9a 9a       	\.word 0x9a9a
    8936:	9a 9a       	\.word 0x9a9a
    8938:	9a 9a       	\.word 0x9a9a
    893a:	9a 9a       	\.word 0x9a9a
    893c:	9a 9a       	\.word 0x9a9a
    893e:	9a 9a       	\.word 0x9a9a
    8940:	9a 9a       	\.word 0x9a9a
    8942:	9a 9a       	\.word 0x9a9a
    8944:	9a 9a       	\.word 0x9a9a
    8946:	9a 9a       	\.word 0x9a9a
    8948:	9a 9a       	\.word 0x9a9a
    894a:	9a 9a       	\.word 0x9a9a
    894c:	9a 9a       	\.word 0x9a9a
    894e:	9a 9a       	\.word 0x9a9a
    8950:	9a 9a       	\.word 0x9a9a
    8952:	9a 9a       	\.word 0x9a9a
    8954:	9a 9a       	\.word 0x9a9a
    8956:	9a 9a       	\.word 0x9a9a
    8958:	9a 9a       	\.word 0x9a9a
    895a:	9a 9a       	\.word 0x9a9a
    895c:	9a 9a       	\.word 0x9a9a
    895e:	9a 9a       	\.word 0x9a9a
    8960:	9a 9a       	\.word 0x9a9a
    8962:	9a 9a       	\.word 0x9a9a
    8964:	9a 9a       	\.word 0x9a9a
    8966:	9a 9a       	\.word 0x9a9a
    8968:	9a 9a       	\.word 0x9a9a
    896a:	9a 9a       	\.word 0x9a9a
    896c:	9a 9a       	\.word 0x9a9a
    896e:	9a 9a       	\.word 0x9a9a
    8970:	9a 9a       	\.word 0x9a9a
    8972:	9a 9a       	\.word 0x9a9a
    8974:	9a 9a       	\.word 0x9a9a
    8976:	9a 9a       	\.word 0x9a9a
    8978:	9a 9a       	\.word 0x9a9a
    897a:	9a 9a       	\.word 0x9a9a
    897c:	9a 9a       	\.word 0x9a9a
    897e:	9a 9a       	\.word 0x9a9a

00008980 \<constbr_foo5\>:
    8980:	00 a7       	\.word 0xa700
    8982:	01 00       	\.word 0x1
	\.\.\.
