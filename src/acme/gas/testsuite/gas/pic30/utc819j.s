; The penultimate instruction of a DO loop may not be RETURN.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	return
DoLoopEnd:
	nop
	.end










