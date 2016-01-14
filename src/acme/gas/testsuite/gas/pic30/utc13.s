      	.global foo
foo:
	nopr

bar:
	.org (0xFFFE + 2)
	call foo
	goto bar
