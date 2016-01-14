
	.title cert0089 .int Assemble Numbers limits, data
	.sbttl subtitle1 test

	.data

	.int 1-1, 0-0, -1+1
	.int 0xFFFFFFFE+1, 1+0xFFFFFFFE
	.int 0xFFFFFFFF - 0xFFFFFFFF
	.int 0xFF
	.int 0xFF + 1	
	.int 0xFFFF
	.int 0xFFFF + 1	
	.int 0xFFFFFF
	.int 0xFFFFFF + 1	
	.int 0xFFFFFF - 1
	.int 0xFFFFFFFF
	
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
	addc w5, w6, w7
3:	MUL.US	w5, w6, w8
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
