		.equiv bitsym1, 1

		nopr
		nop
		nopr
		nop
		nopr
		nop

		BTST.b		bitsym1, #temp
		
		nopr
		nop
		nop
		nopr
		nopr
		nop
		
		BTST.b		bitsym2, #externalsym

		.data
		.byte 0x01
 		.byte 0x02
		.byte 0x03
		.byte 0x04
		.equiv temp, 3	


		.global temp
		.global bitsym1
		.end

