		.global __reset
		.global externfooA1
		.global externfooA2
		.global externfooA3
		.global externfooA4


		.data
	
		.byte 1
		.byte 0
		.byte 0xA5	
		.byte 0xFF

		.text
		.byte 0
		.align 4
externfooA1:	.byte 1
		.align 4
externfooA2:	.byte 2
		nop
	
externfooA3:	.byte 0xA5
		.align 4
externfooA4:	.byte 0xFF
		.byte 0x00
	
		.align 4
	
pwordBfroma:	.pword tbloffset(externfooB1)
		.pword tbloffset(externfooB2)
		.pword tbloffset(externfooB3)
		.pword tbloffset(externfooB4)	
	
pwordAfroma:	.pword tbloffset(externfooA1)
		.pword tbloffset(externfooA2)
		.pword tbloffset(externfooA3)
		.pword tbloffset(externfooA4)	

		.global pwordBfroma
		.global pwordAfroma
	
__reset:	nop
		nop
		nop
		nopr
		nopr
		nopr
	
		.end
