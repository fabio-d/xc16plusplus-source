		.global __reset

		.text
__reset:	nop
		nop
		nop
		nop
		nop
		nopr
		add.b     extdec1
		nopr
		add.b     extdec3
		add.b     extdec2
		add.b     extdec4
	
	        nop

		.data
extdec3:        .byte   0x01
extdec2:	.int	0x1234

		.global extdec2
		.global	extdec3
		
		.end
