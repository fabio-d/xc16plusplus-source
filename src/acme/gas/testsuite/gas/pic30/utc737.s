	.text
	MOV #locrel+65535, w5
	
	.data
	.byte 0x00
	.byte 0x01
locrel:	.byte 0x02
	.end

