	.text
	.byte 1
	.byte 0
	.word tbloffset(datasym)	
test:	.byte 0xA5

	.data

	.byte 1
datasym:.byte 2
	.byte 3
	
	.end
