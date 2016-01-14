		.global __reset
	
		.global symAT1
		.global symAT2
		.global symAT3
		.global symAT4
		.global symAT5
	
		.text
__reset:	nop

		nopr
		nopr
			
		
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		

		.equiv symAT1, 0x00
		.equiv symAT2, 0x01
		.equiv symAT3, 0x7F
		.equiv symAT4, 0x80
		.equiv symAT5, 0xFF
				

tAD1:		.byte symAD1
tAD2:		.byte symAD2
tAD3:		.byte symAD3
tAD4:		.byte symAD4
tAD5:		.byte symAD5

tBD1:		.byte symBD1
tBD2:		.byte symBD2
tBD3:		.byte symBD3
tBD4:		.byte symBD4
tBD5:		.byte symBD5

tAT1:		.byte symAT1
tAT2:		.byte symAT2
tAT3:		.byte symAT3
tAT4:		.byte symAT4
tAT5:		.byte symAT5
 
tBT1:		.byte symBT1
tBT2:		.byte symBT2
tBT3:		.byte symBT3
tBT4:		.byte symBT4
tBT5:		.byte symBT5

	
		.data

		.equiv symAD1, 0x00
		.equiv symAD2, 0x01
		.equiv symAD3, 0x7F
		.equiv symAD4, 0x80
		.equiv symAD5, 0xFF

dAD1:		.byte symAD1
dAD2:		.byte symAD2
dAD3:		.byte symAD3
dAD4:		.byte symAD4
dAD5:		.byte symAD5

dBD1:		.byte symBD1
dBD2:		.byte symBD2
dBD3:		.byte symBD3
dBD4:		.byte symBD4
dBD5:		.byte symBD5

dAT1:		.byte symAT1
dAT2:		.byte symAT2
dAT3:		.byte symAT3
dAT4:		.byte symAT4
dAT5:		.byte symAT5

dBT1:		.byte symBT1
dBT2:		.byte symBT2
dBT3:		.byte symBT3
dBT4:		.byte symBT4
dBT5:		.byte symBT5

		.global symAD1
		.global symAD2
		.global symAD3
		.global symAD4
		.global symAD5
		
		.end

