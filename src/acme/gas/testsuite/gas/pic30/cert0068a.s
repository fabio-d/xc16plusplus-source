
	.title cert0068a .equ Set value of symbol limit
	.sbttl subtitle1 test

	
	.data



	.text
	.global main
one:	goto externdefine
two:	goto main2
three:	nopr
	.global foo
foo:	nopr

	
main:
four:	MOV	#tbloffset(one), w5
five:	MOV	#tbloffset(two), w5
six:	MOV	#tbloffset(three), w5
tff:	MOV	#tbloffset(four), w5
tfs:	MOV	#tbloffset(five), w5
max16:	MOV	#tbloffset(six), w5

max24:	nop
max32:	nopr


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
