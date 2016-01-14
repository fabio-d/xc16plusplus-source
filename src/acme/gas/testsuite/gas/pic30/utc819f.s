; The penultimate instruction of a DO loop may not be RCALL.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	rcall	DoLoopEnd
DoLoopEnd:
	nop
	.end






