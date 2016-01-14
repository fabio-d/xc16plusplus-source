	.global main
	.global extnval
	
	.data
	.byte 1
	.byte 2
 .byte 0	

	.text
main:	mov w1, w2
	nopr
	nopr
	nopr
	nopr
	nopr
	nopr
	nop
extnval:	mov w6, w5
	
	; Add external reloc for loop count
	DO #1, 100
	mov w5, w6
	mov w6, w7
	nopr
	.end
