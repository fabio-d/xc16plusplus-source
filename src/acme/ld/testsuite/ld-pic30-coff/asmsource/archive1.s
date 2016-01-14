	.text
	.align 4
	

	
arch1:	mov	w1, w2
	call arch2
	
	return
	.global	arch1	; export	
	.end
	

