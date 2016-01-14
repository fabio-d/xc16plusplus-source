	.text
	ASR w1, #locre, w2
	
	.data
	.org 15+1
locre:	.byte 0x01
	.end

