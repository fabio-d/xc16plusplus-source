; The last instruction of a DO loop may not be RCALLW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	rcall	w0
	nop
	.end







