	.text
	.byte 1
test:	.byte 2
	.byte 3
	.byte 4
	.align 4
	.word psvoffset(test)
	.byte 0xA5

	.data
	.byte 1		
datasym:.byte 2
	.byte 3
	
	.end
