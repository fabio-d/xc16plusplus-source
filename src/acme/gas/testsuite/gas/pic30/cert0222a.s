
	.title cert0222 .hword directive, text, limits
	.sbttl subtitle1 test

	.data

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


	.fill	5, 1, 0xEE
hwd1a:	.hword	0xFFFF
hwd1b:	.hword	0xFFFE
hwd1c:	.hword	0xFFFD
hwd1d:	.hword	0xFFFC
hwd1e:	.hword	0xFFFB
hwd1f:	.hword	0xFFFA
test1:	.byte	0xAC
	.fill	5, 4, 0xEE


	bra lb

5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
7:	MOV #1, w6

hwd2:	.hword	0
	.fill	5, 8, 0xEE
	
	
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
