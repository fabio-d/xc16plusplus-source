		.title Certification tests
		.sbttl subtitle1 test


		.data
bytesymd:	.byte 	0xFF
intsymd:	.int	0xA55A
longsymd:	.long	0x12345678

		.text
bytesymt:	.byte 	0xFF
intsymt:	.int	0xA55A
longsymt:	.long	0x12345678

1:		mov	w1, w2
		mov	w3, w4
2:		mov	w3, w4
		mov	w3, w4		
3:		goto	1b
		
		mov	w3, w4
		
		


		.end
