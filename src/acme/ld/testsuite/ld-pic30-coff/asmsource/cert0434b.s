
		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5
	
		.text
		
		.equiv symBT1, 0x0000
		.equiv symBT2, 0x03FFF
		.equiv symBT3, 0x01FFF
		.equiv symBT4, 0x02000
		.equiv symBT5, 1
		
		nop
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
		.equiv symBD1, 0x0000
		.equiv symBD2, 16383
		.equiv symBD3, 8191
		.equiv symBD4, 8192
		.equiv symBD5, 1		
		
		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

