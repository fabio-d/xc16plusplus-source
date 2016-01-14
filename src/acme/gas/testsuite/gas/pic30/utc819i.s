; The penultimate instruction of a DO loop may not be RETFIE.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	retfie
DoLoopEnd:
	nop
	.end









