		.global __reset
		.global externfooB1
		.global externfooB2
		.global externfooB3
		.global externfooB4


		.data
	
		.byte 1
		.byte 0
		.byte 0xA5	
		.byte 0xFF
		.byte 0

		.text
	
externfooB1:	.byte 2
		.align 4
externfooB2:	.byte 4
		.align 4
externfooB3:	.byte 0x5A
		.align 4
externfooB4:	.byte 0x00
		.byte 0xFF

	
		.align 4	
pwordBfromb:	.pword tbloffset(externfooB1)
		.pword tbloffset(externfooB2)
		.pword tbloffset(externfooB3)
		.pword tbloffset(externfooB4)	
	
pwordAfromb:	.pword tbloffset(externfooA1)
		.pword tbloffset(externfooA2)
		.pword tbloffset(externfooA3)
		.pword tbloffset(externfooA4)	
	
startnop:	nop
		nop
		nop
		nopr
		nopr
		nopr

		.global pwordBfromb
		.global pwordAfromb
		.global startnop
	
		.end
