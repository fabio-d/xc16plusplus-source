		.text
		.global __reset
		.equiv bitsym1, 0x05		
__reset:	BTST.c			W1, #bitsym1
		BTST.z			[W2], #bitsym2
		BTST.c			[w2], #bitsym2

		.data

temp: 		.byte 	0xA5
		.global temp
		.global bitsym1
		.end

