		
		.global externfooT2


		.text

		.byte 2
		.byte 0xFF
externfooT2:	.byte 0xA6
	

		.pword psvoffset(externfooT1)
		.pword psvoffset(externfooT2)				
	
	
		nopr
		nopr
		nop
		nop
		
		.data		

		.word psvoffset(externfooT1)
		.word psvoffset(externfooT2)				
	
		
		.end
