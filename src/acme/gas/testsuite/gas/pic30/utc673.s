	.data
	.org 1
test:	.byte 0xA5	
	
	.text
	DO #test, here
	nop
	nop
	nop
here:	nop
	nop
	nop

	.end
