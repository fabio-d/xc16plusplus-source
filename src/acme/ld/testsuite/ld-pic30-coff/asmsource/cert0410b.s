		.global foo_ed
		.global foo_et

		.text
foo_ed:		nopr
foo_et:		nop
		
		.word handle(foo_lt)
		.word handle(foo_ld)
		.word handle(foo_ed)
		.word handle(foo_et)
