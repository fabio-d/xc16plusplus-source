; The penultimate instruction of a DO loop may not be a GOTOW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	goto	w0
DoLoopEnd:
	nop
	.end




