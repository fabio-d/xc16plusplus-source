		.global foo_lt
		.global foo_ld
		.global __reset
	
		.text
__reset:	nop
	
foo_lt:		nopr
foo_ld:		nop

		.word handle(foo_lt)
		.word handle(foo_ld)
		.word handle(foo_ed)
		.word handle(foo_et)

		.data
		.word handle(foo_lt)
		.word handle(foo_ld)
		.word handle(foo_ed)
		.word handle(foo_et)


