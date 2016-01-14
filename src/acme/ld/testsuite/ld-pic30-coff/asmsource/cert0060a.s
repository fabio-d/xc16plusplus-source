		.text
__reset:	nopr	
		nopr
		nop
		mov	#temp, w5		
		nop
temp2:		nop
		
		.global __reset
		.global ext
		.global temp2

		.data
		.align 2
ext:		.byte 	0x5A
		.global ext
		.end

