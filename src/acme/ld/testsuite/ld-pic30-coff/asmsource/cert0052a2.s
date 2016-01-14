		.text
__reset:	nopr	
		nopr
		
		.global __reset

		.data
		.org 0x100
ext:		.byte 	0x5A
		.global ext
		.end

