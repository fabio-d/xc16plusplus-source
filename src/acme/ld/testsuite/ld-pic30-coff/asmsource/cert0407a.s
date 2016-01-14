		.global main
		.global con1
		.global __reset
		
		.global d5a
		.global maxpos_a
		.global minneg_a		
		
		.data
		.equiv con1, 0x04
		.equiv maxpos_a, 31
		.equiv minneg_a, -32
		.int	4


		.text
__reset:	nop	

		.equiv main, 1		
		
		nopr

		.byte 5

		.equiv d5a, 5

		sftac	A, #-16
		sftac	A, #0		
		sftac	B, #-1
	
		sftac	B, #1
		
		sftac	A, #main
		sftac	A, #d5a	
		sftac	B, #d5b
	
		sftac	B, #con1
.if 0	
		sftac   A, #maxpos_b
		sftac   A, #minneg_b
		
		sftac   B, #maxpos_b
		sftac   B, #minneg_b
.endif		
		
.if 0			
		sftac   A, #maxpos_a
		sftac   A, #minneg_a		
		sftac   B, #maxpos_a
		sftac   B, #minneg_a		
.endif		


		.end
