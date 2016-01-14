	.text
	.byte 1
test:	.byte 0
	.byte 5
	.byte 0xA5

	.data
	.byte 1		
	.byte tbloffset(test)	
datasym:.byte 2
	.byte 3
	
	.end
