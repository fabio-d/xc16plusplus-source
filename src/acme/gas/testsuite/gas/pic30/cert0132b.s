	.title cert0130
	.sbttl subtitle1 test
	.list
	.data
long1:	.long	0x10000000
int1:	.int	0x1000
byte1:	.byte	0x20
short1:	.short	-32768-1
byte2:	.byte	0xFF
short2:	.short 	0xFFFF
byte3:	.byte	0xFF
short3d: .short 0

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
	
short3t:	.short	0xFFFF

	
	MOV #1, w6
	addc w5, w6, w7

short4t:	.short 	0x5678
	
3:	MUL.US	w5, w6, w8
	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8	
	bra 1b
	
short5t:	.short 	0
	
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
	
	
	.eject
	.sbttl subtitle on page 4
	
8:	addc w5, w6, w7

	MUL.US	w5, w6, w8
	MOV #1, w6
9:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	
0:	goto	main	
		
	.end
