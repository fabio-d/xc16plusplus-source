; The last instruction of a DO loop may not be RCALL.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	rcall	DoLoopEnd
	nop
	.end






