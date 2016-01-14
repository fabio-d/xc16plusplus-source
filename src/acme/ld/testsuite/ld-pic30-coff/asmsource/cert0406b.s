		.global con2
		.global runfunct
		.global constant

		.global b1, b2, b3, b4		
		
		.data
con2:		.int	4


b1:		.word tblpage(runfunct)
b2:		.word tblpage(main)

		.section	.const
		.org 0x124
constant:	.word	0x5678
	
		.text
		.org 0x28000
runfunct:	nop	
		nopr
		nopr
		
		goto main
		
b3:		.word tblpage(runfunct)
b4:		.word tblpage(main)

		
		.end
