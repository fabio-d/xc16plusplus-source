

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

		.equiv symBT1, 0x00000000
		.equiv symBT2, 0x12345678
		.equiv symBT3, 0x7FFFFFFF
		.equiv symBT4, 0x80000000
		.equiv symBT5, 0xFFFFFFFF
		

tAD1:		.long symAD1
tAD2:		.long symAD2
tAD3:		.long symAD3
tAD4:		.long symAD4
tAD5:		.long symAD5

tBD1:		.long symBD1
tBD2:		.long symBD2
tBD3:		.long symBD3
tBD4:		.long symBD4
tBD5:		.long symBD5

tAT1:		.long symAT1
tAT2:		.long symAT2
tAT3:		.long symAT3
tAT4:		.long symAT4
tAT5:		.long symAT5
 
tBT1:		.long symBT1
tBT2:		.long symBT2
tBT3:		.long symBT3
tBT4:		.long symBT4
tBT5:		.long symBT5
		

		.data
		.equiv symBD1, 0x00000000
		.equiv symBD2, 0x12345678
		.equiv symBD3, 0x7FFFFFFF
		.equiv symBD4, 0x80000000
		.equiv symBD5, 0xFFFFFFFF

dAD1:		.long symAD1
dAD2:		.long symAD2
dAD3:		.long symAD3
dAD4:		.long symAD4
dAD5:		.long symAD5

dBD1:		.long symBD1
dBD2:		.long symBD2
dBD3:		.long symBD3
dBD4:		.long symBD4
dBD5:		.long symBD5

dAT1:		.long symAT1
dAT2:		.long symAT2
dAT3:		.long symAT3
dAT4:		.long symAT4
dAT5:		.long symAT5

dBT1:		.long symBT1
dBT2:		.long symBT2
dBT3:		.long symBT3
dBT4:		.long symBT4
dBT5:		.long symBT5


		.global symBD1
		.global symBD2
		.global symBD3
		.global symBD4
		.global symBD5
		
		.end

