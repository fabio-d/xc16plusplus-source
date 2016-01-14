	.title cert tests
	.sbttl subtitle1 test
	.list

		.data
long1:		.long	0x10000000
int1:		.int	0x1000

	.text
	
main:
	MOV #5, w5
	MOV #1, w6
1:	
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	
	.eject
	.sbttl subtitle on page 2
	
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8

word0:		.word	0

	MOV #1, w6
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	bra 4b
	
wordFFFF:	.word 	0xFFFF

	.eject
	.sbttl subtitle on page 3

5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
	
word7FFF:	.word 	0x7FFF

6:	MOV #1, w6
	addc w5, w6, w7
	
	MUL.US	w5, w6, w8	
	MOV	w1, w8
	
	MOV #64159, w5
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
	
	.eject
	.sbttl subtitle on page 4
	
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
0:	goto	main	
		
	.end
