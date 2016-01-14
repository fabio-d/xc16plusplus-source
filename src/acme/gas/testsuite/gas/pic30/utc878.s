	.text
	.byte 0
	.byte 5
	.pbyte datasym+256
	.byte 0xA5
	.org 0xFC

	.data
	.byte 1		
	.byte 2
	.byte 3

	.org 0xFF
datasym:.byte 0xFF
	.byte 00
	
	.end
