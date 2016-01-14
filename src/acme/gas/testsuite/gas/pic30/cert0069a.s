
	.title cert0069a .equ Set value of symbol out of range
	.sbttl subtitle1 test

	
	.data



	.text
	.global main
   goto externdefine
 	goto main2
	nopr
	.global foo
foo:	nopr

	
main:
4:	MOV	#one, w5
5:	MOV	#two, w5
6:	MOV	#three, w5
7:	MOV	#four, w5
8:	MOV	#five, w5
9:	MOV	#six, w5

0:	nop
0:	nopr
0:	nopr


	.equ	zero, 0
	.equ	one, 1
	.equ	two, 2
	.equ	three, 3
	.equ	four, 4
	.equ	five, 5
	.equ	six, 6
	.equ	tff, 255
	.equ	tfs, 256
	.equ	max16, 0xFFFF
	.equ	max24, 0xFFFFFF
	.equ	max32, 0xFFFFFFFF
	.equ	orange, 0x100000000

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
