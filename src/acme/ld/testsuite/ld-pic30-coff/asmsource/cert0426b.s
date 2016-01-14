
		.text
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		nopr
		nop
		add.b	extdec2
		add.b	extdec1
		add.b	extdec3
		add.b	extdec4
		nop	
		
		.data
extdec4:	.byte 	0xCD
	
		.data
extdec1:	.byte	0xAB
	
		.global extdec1
		.global extdec4
		.end
