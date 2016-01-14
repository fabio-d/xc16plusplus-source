	.global	i1	; export
	.section	.const1 ;  data memory
i1:
	.byte 0xbb
	.global	i2	; export
	.section	.const2,"x"
i2:
	.word	0x3322
	.global	i4	; export
	.section	.const4,"x"
i4:
	.long	0x77665544
        .word 0

	.end
