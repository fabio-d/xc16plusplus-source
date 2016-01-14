	.title cert0134
	.sbttl subtitle1 test
	.list
	.data
long1:	.long	0x10000000
int1:	.int	0x1000
byte1:	.byte	0x20
single1d:	.single		-INF
byte2:	.byte	0xFF
single2d:	.single 	0
byte3:	.byte	0xFF
single3d: 	.single		-0
short3d: .short 0
single4d:	.single		NaN
single5d:	.single		+INF

	.global	short2

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
	
single1t:	.single		-INF



	
	MOV #1, w6
	addc w5, w6, w7

single2t:	.single 	0
	
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	bra 1b
	
	
	.eject
	.sbttl subtitle on page 3

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
	
	
single3t: 	.single		-0
		.byte		0xFF
single4t:	.single		NaN	
single5t:	.single		+INF	
	.eject
	.sbttl subtitle on page 4
	
8:	addc w5, w6, w7

	MUL.US	w5, w6, w8
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	
0:	goto	main	
		
	.end
