		.global __reset
		.global somesym
		.global lcnt
		.data
		.equiv lcnt, 2
		
		.data
		.byte 0
		.byte 1
		.byte 2
		
		.text
__reset:	mov w1, w2

                .equiv somesym,  3
		nopr
                nopr
		DO #1, 4
		nopr
		nopr
		DO #1, extnval
		nopr
		nopr
		
		DO #lcnt, 0x7FFE
		
		mov w6, w5	
		
		DO #0x3FFF, 2
	
		mov w5, w6
		mov w6, w7
		
		DO #somesym, 32766
		
		nopr
		goto main
		
		.end

