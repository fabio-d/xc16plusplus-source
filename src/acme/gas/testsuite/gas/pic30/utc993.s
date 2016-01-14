	.text
	pwrsav #foo
	.data
	.byte 0x0F
foo:	.byte 0xFF
