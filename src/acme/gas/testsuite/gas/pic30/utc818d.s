; The last instruction of a DO loop may not be a GOTOW.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	goto	w0
	nop
	.end




