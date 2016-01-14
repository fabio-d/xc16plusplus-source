	.text
	.byte 1
	.byte 0
test:	.byte 0xA5

	.data
	.word tbloffset(datasym)
	.byte 1
datasym:.byte 2
	.byte 3
	
	.end
