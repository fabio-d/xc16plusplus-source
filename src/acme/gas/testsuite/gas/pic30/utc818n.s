; The last instruction of a DO loop may not be an instruction within a repeat.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	repeat	#1
DoLoopEnd:
	nop
	.end














