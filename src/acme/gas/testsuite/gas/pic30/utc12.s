	call foo
	goto bar
	.org (0x10000+2)
	.global foo
	.global bar
foo:
	nopr
	nopr
bar:
