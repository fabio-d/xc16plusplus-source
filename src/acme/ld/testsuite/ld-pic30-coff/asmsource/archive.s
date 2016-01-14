	.text
	.align 4
	.global __reset
	.extern arch2
	.org 0x100
	.align 8
	
__reset:	mov	w1, w2
		call 	arch2
	
	return
	
	.end
