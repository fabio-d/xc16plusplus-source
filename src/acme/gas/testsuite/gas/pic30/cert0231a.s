
	.title cert0231 Reserve copies of bytes in data min/max
	.sbttl subtitle1 test

	.data
	.ascii "Begin first fill"
	.fill	0, 1, 1
	.fill	1, 0, 1
	.fill	1, 1, 0
	.ascii "Begin second fill"
	.fill	0, 0, 0

	.ascii "Begin third fill"
	.fill 	0x0F, 4, 0x12345678

	.ascii "Begin fourth fill"
	.fill 	0xFF, 9, 0xFFFFFFFF	

	/* The repeat value is apparently a 32-bit signed value */
	
	.ascii	"End of data section"
		

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

	.end
