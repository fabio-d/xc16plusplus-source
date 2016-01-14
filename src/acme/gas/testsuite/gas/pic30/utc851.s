	.text
	.byte 1
test:	.byte 0
	.byte 0xA5

	.data
	.byte 1
	.word psvoffset(test)		
datasym:.byte 2
	.byte 3
	
	.end
