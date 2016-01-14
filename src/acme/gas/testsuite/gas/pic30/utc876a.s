	.text
	.byte 1
	.byte 0
	.byte 5
	.pbyte datasym+0xFF
	.byte 0xA5
	.org 0x100
test:	.byte 0xFF	

	.data
	.byte 1		
	.byte 2
	.byte 3

	.org 0xFF
datasym:.byte 0xFF
	.byte 00
	
	.end
