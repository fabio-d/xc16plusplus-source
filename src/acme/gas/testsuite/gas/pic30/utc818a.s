; The last instruction of a DO loop may not be a branch.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	bra	DoLoopEnd
	.end

