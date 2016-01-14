; The penultimate instruction of a DO loop may not be RCALLW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	rcall	w0
DoLoopEnd:
	nop
	.end







