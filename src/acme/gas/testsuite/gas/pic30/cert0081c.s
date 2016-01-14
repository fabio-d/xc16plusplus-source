
	.title cert0081 .global directive, undefined symbol
	.sbttl subtitle1 test

	.data
	.global	gll2
gll1:	.byte	1
	.global	gll1
gll2:	.byte	0xAC
	.globl	gll3
gll3:	.byte	0xFF
gll4:	.byte	0x10
	.global	notdefined
	.global	glt6
	.text

main:

	.global glt1
	.globl glt2
	.globl	gll4
	
glt1:	MOV #5, w5
glt2:	MOV #1, w6	
1:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
glt3:	MOV #1, w6
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
glt4:	MUL.US	w5, w6, w8	
glt6:	.global glt4
	.globl glt3

5:	MOV #1, w6
	addc w5, w6, w7
glt5:	MOV #1, w6
	.global glt5
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
		
0:	goto	main	
	
	.end
