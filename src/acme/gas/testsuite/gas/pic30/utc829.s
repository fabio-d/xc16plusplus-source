	.text
	LNK #MAX
	
test:	.byte 0xA5	

	.data
START:	.byte 0x00

	.org 16382
MAX:	.byte 0xa2

	.end
