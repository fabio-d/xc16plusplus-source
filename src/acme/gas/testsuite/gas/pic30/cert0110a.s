	.title cert0110 .org Advance Location Counter
	.sbttl subtitle1 test

	.data

long1:	.long	0x10000000
int1:	.int	0x1000
long2:	.long	0x20000000
int2:	.int	0x2000
long3:	.long	0x30000000
int3:	.int	0x3000
orgnext: .int	0xFFFF

	.org	0x100
	
long4:	.long	0x40000000
int4:	.int	0x4000
long5:	.long	0x50000000
int5:	.int	0x5000
long6:	.long	0x60000000
int6:	.int	0x6000
long7:	.long	0x70000000
int7:	.int	0x8000


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
