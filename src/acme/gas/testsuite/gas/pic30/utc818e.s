; The last instruction of a DO loop may not be a CALL.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	call	DoLoopEnd
	nop
	.end





