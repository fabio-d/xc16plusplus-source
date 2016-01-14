	.text
	.align 8

	
	
arch2:	mov	w2, w3
	call arch1
	return
	.global	arch2	; export	

	.end
	
