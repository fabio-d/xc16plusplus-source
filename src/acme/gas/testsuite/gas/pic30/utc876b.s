	.text
	.byte 1
	.byte 0
	.byte 5
	.pbyte test+0xFE
	.byte 0xA5
	.org 0xFC
test:	.byte 0xFC

	.data
	.byte 1		
	.byte 2
	.byte 3

	.org 0xFF
datasym:.byte 0xFF
	.byte 00
	
	.end
