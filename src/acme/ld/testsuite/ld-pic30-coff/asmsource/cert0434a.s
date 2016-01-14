		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
		
		.equiv symAT1, 0x0000
		.equiv symAT2, 0x03FFF
		.equiv symAT3, 0x01FFF
		.equiv symAT4, 0x2000
		.equiv symAT5, 1
		
__reset:	nop
		nopr
		nop
		nopr
		nopr
	
		nopr
		nopr
		
		DISI #symAT1
		DISI #symAT2
		DISI #symAT3
		DISI #symAT4
		DISI #symAT5
		
		DISI #symAD1
		DISI #symAD2
		DISI #symAD3
		DISI #symAD4
		DISI #symAD5		
		
		
		DISI #symBT1
		DISI #symBT2
		DISI #symBT3
		DISI #symBT4
		DISI #symBT5
				
		DISI #symBD1
		DISI #symBD2
		DISI #symBD3
		DISI #symBD4
		DISI #symBD5		
		
		
		nopr
		nopr
	
			
		.data
		.equiv symAD1, 0x0000
		.equiv symAD2, 16383
		.equiv symAD3, 8191	
		.equiv symAD4, 8192
		.equiv symAD5, 1		
		
		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

