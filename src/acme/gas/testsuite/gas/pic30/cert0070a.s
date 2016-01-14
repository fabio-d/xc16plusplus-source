
	.title cert0070a Set value of an undefined symbol
	.sbttl subtitle1 test

	.data

	.text
	.global main
	goto externdefine
	goto main2
	nopr
	.global foo
foo:	nopr

	.equiv	one, 2
	.equiv	two, 4
	.equiv	three, 6
	.equiv	four, 8
	.equiv	five, 10
	.equiv	six, 12
	
main:
	MOV	one, w6
	MOV	two, w6
	MOV	three, w6
	MOV	four, w6
	MOV	five, w6
	MOV	six, w6

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
      goto 1b
      goto 2b
      goto 3b
      goto 4b
      goto 5b
      goto 6b
      goto 7b
      goto 8b
      goto 9b
      goto 0b
