		.global main
		.global con1
		.global __reset
		
		.global d5a
		
		.data
		.equiv con1, 0x03
		.int	4


		.text
__reset:	nop	

		.equiv main, 1		
		
		nopr

		.byte 5

		.equiv d5a, 5
		
		add w5, #0, A
		add w4, #7, B		
		add w3, #1, A		

		add w2, #con1, A
		add w1, #con2, B		
		
		add w6, #d5a, B		
		add w7, #d5b, A		

		.end
