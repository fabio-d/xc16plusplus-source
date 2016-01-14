

		.global symBT1
		.global symBT2
		.global symBT3
		.global symBT4
		.global symBT5

		.text

		nopr
		nopr	
		
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr

		.equiv symBT1, 0x00
		.equiv symBT2, 0x01
		.equiv symBT3, 0x7F
		.equiv symBT4, 0x80
		.equiv symBT5, 0xFF
		

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
		.equiv symBD1, 0x00
		.equiv symBD2, 0x01
		.equiv symBD3, 0x7F
		.equiv symBD4, 0x80
		.equiv symBD5, 0xFF

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


		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

