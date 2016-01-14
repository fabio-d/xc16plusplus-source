	.title cert098 .line
	.sbttl subtitle1 test
	.global lnsymmax
	.global lnsym65535
	.global lnsym255
	.data



	.text
main:

bytesym:	.byte 1
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
	bra 1b
	
	.def lnsym255
	.scl 6
	.line 255
	.val 3
	.endef
	
5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	

	MOV	w1, w8
	
	MOV #64159, w5
	
	.def lnsym65535
	.scl 6
	.line 65535
	.val 2
	.endef
	
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	MOV #1, w6
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	
	.def lnsymmax
	.scl 6
	.line 4294967295
	.val 1
	.endef
	
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
		
0:	goto	main	



	.end
