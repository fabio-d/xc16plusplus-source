	.text
	.byte 1
	.byte 0
test:	.byte 0xA5	

	.data	
	.word tbloffset(externfoo)
	.end
