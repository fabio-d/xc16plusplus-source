	.title cert0102 .long, text
	.sbttl subtitle1 test

	.data


	.text
	.nolist
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
	
	.list
long1:	.long 1
long2:	.long 2
long3:  .long 256
long4:  .long 32768
long5:  .long -1
long6:  .long -2
long7:  .long -256
long8:  .long -32768
long9:  .long 100000
long10: .long -100000

	.nolist	
	
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
	
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
		
0:	goto	main	

	.end
