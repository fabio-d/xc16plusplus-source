	.text
test:	.byte 1
	.byte 0
	.byte 5
	.pbyte datasym-128
	.byte 0xA5
	.org 0xFC

	.data
datasym:.byte 1		
	.byte 2
	.byte 3

	.org 0xFF
	.byte 0xFF
	.byte 00
	
	.end
