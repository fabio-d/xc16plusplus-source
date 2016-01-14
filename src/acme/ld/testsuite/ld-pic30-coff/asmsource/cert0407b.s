		.global con2
		.global d5b
		.global maxpos_b
		.global minneg_b
		
		.data
		.equiv con2, 4
		.int	4
		.equiv maxpos_b, 31
		.equiv minneg_b, -32	


		.text
		nop	
		
		nopr
		.byte 4

		.equiv d5b, 4

		sftac	A, #0
		sftac	A, #-16
		
		sftac	B, #1
		
		sftac	A, #con1
		sftac	A, #con2
		
		sftac	B, #d5a	
		sftac	B, #d5b

.if 0		
		sftac   A, #maxpos_a
		sftac   A, #minneg_a		
		sftac   B, #maxpos_a
		sftac   B, #minneg_a			
.endif		
				
.if 0		
		sftac   A, #maxpos_b
		sftac   A, #minneg_b

		sftac   B, #maxpos_b
		sftac   B, #minneg_b	
.endif
		.end
