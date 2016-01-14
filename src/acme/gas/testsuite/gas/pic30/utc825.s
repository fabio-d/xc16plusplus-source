	.text
	LNK #MAX+1
	
test:	.byte 0xA5	

	.data
START:	.byte 0x00

	.org 16383
MAX:	.byte 0xA5

	.end
