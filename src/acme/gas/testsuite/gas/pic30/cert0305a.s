	.title cert0305 .org Advance Location Counter
	.sbttl subtitle1 test

	.data

	.nolist
	.text

main:
	MOV #5, w5
	MOV #1, w6	
1:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	
	.list
	addc w5, w6, w7
	
	.org 0x100, 0xA5
	
3:	MUL.US	w5, w6, w8
	.nolist
	
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	bra lb
	
5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	

	MOV	w1, w8
	MOV #64159, w5
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	
	.list
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	.nolist
	
0:	goto	main	

	.end
