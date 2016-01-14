	.text
	.org 0x08
test:	.byte 0xA5	

	DO #test, here
	mov w5, w6
	nop
	nop
	nop
here:	nop
	nop
	nop

	.end
