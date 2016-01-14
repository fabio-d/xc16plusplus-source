        .data
	.org 0x200
	.global foo
foo:
	.word 0x1234

	.text
	.global __reset
__reset:
	.pword 0x80000+foo
        nop
        
	.end
