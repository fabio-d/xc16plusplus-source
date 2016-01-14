	.title cert0283
	.sbttl subtitle1 test
	.list
	.data
long1:	.long	0x10000000

	.section data1,data
int1:	.int	0x1000

	.section testw,data
long2:	.long	0x20000000
int2:	.int	0x2000

	.section bsstest,bss
long3:	.long	0x30000000

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
	MOV #1, w6
	addc w5, w6, w7
	
	.section testn,data,noload
3:	.long   0x12345678
	.int    0xabcd
4:	.short	0x1234
	.long   0xabcdef01
	
	.eject
	.sbttl subtitle on page 3


	.section testx,code
5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8	
	
	.eject
	
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
	
	.text
0:	goto	main	
		
	.end
