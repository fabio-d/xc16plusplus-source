		.global __reset
		.global somesym
		.global lcnt
		
		.data
		.byte 0
		.byte 1
lcnt:		.byte 2
		
		.text
__reset:	mov w1, w2
		nopr
somesym:	nopr
		DO #1, 2
		nopr
		nopr
		DO #1, extnval
		nopr
		nopr
		
		DO #1, 0x7FFE
		
		mov w6, w5	
		
		DO #0x3FFF, 2
	
		mov w5, w6
		mov w6, w7
		
		DO #lcnt, 32766
		
		nopr
		goto main
		
		.end

