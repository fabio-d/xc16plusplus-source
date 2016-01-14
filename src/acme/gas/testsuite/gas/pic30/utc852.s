	.text
	.byte 1
	.byte 0
test:	.byte 0xA5	
	.word psvoffset(externfoo)
	.end
