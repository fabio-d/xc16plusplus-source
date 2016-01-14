; The penultimate instruction of a DO loop may not be RETLW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	retlw	#1,w0
DoLoopEnd:
	nop
	.end











