	.text
	LNK #ODD
	
test:	.byte 0xA5	

	.data
START:	.byte 0x00

	.org 16383
ODD:	.byte 0xA5

	.end
