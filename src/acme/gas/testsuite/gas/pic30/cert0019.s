	.text
	nopr
	.global foo
foo:	nopr

	.ascii "test of listing continuation lines.  This line should be really really really long so that gas is forced to use continuation lines."

   .align 2
   nopr

   .data
foo_d:
   .word 1
   .bss
foo_b:
   .space 2
   .end
