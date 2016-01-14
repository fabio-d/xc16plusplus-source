		.global con2
		.global d5b
		
		.data
		.equiv con2, 7
		.int	4



		.text
		nop	
		
		nopr
		.byte 4

		.equiv d5b, 0

		add w5, #0, A
		add w4, #7, B		
		add w3, #1, A		

		add w2, #con1, A
		add w1, #con2, B		
		
		add w6, #d5a, B		
		add w7, #d5b, A		
		

		.end

		
		.end
