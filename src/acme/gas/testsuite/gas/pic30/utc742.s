	.text
	MOV #locrel-32768, w5
	nopr
	nopr
	
	.data
locrel:	.byte 0xFF
	.end

