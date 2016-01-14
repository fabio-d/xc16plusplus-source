		.global __reset
		.global externfooT1

		.text

		.byte 1
		.byte 0
externfooT1:	.byte 0xA5	

		.pword psvoffset(externfooT1)
		.pword psvoffset(externfooT2)				
	
	
__reset:	nop
		nop
		nopr
		nopr
		
		.data		

		.word psvoffset(externfooT1)
		.word psvoffset(externfooT2)
		
		.byte 0xFF
	
		
		.end
