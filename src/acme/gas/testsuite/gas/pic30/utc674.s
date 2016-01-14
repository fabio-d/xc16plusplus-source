	.data
	.org 16383
here:
	.byte 0xFF

	.text
	DO #here, test
test:	nop

	.end
