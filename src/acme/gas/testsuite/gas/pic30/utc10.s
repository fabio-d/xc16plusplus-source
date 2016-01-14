	nopr
	.global foo
foo:
	nopr
bar:
	.org 0xFFFE
	call foo
	goto bar
