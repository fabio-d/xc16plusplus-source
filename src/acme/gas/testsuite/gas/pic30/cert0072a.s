
	.title cert0071a Set value of an undefined symbol limits
	.sbttl subtitle1 test

	
	.data



	.text
	.global main
	goto externdefine
	goto main2
	nopr
	.global foo
foo:	nopr

	.equiv	max8, 0xFE
	.equiv	max16,0xFFFE
	.equiv	max24, 0xFFFFFE
	.equiv	max32, 0xFFFFFFFE
	.equiv	oRange, 0x100000000	

	.global max8
	.global max16
	.global max24
	.global max32
	.global oRange
	
main:
	mov	max8, w6
	mov	max16, w6

	MOV #5, w5
	MOV #1, w6	
1:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
5:	MOV #1, w6
	addc w5, w6, w7
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
