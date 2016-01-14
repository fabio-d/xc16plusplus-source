		.global main
		.global con1
		.global __reset
		
		.global a1, a2, a3, a4

		.data
con1:		.int	0x04

a1:		.word tblpage(runfunct)
a2:		.word tblpage(main)

		.text
__reset:	nop	
		
main:		nopr
		nopr

		mov	#tblpage(constant) , W0
		mov	W0, con1
		
		mov	#tbloffset(constant), W0
		mov	[W0], W1
		
		bra	main
		
a3:		.word tblpage(runfunct)
a4:		.word tblpage(main)

		.end
