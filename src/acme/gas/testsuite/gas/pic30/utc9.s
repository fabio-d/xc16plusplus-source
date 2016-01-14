	call foo
	goto bar
	.org 0x10000
	.global foo
	.global bar
foo:
	nopr
bar:
