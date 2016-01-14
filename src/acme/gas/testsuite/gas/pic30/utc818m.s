; The last instruction of a DO loop may not be DO.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	do	#1,DoLoopEnd-4
	nop
	.end













