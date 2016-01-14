; The last instruction of a DO loop may not be RETLW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	retlw	#1,w0
	nop
	.end











