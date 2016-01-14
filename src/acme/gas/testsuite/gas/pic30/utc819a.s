; The penultimate instruction of a DO loop may not be a branch.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	bra	DoLoopEnd
DoLoopEnd:
	nop
	.end

