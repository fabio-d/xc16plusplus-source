; The last instruction of a DO loop may not be REPEAT.
	.text
	do	#1,DoLoopEnd
	nop
	nop
DoLoopEnd:
	repeat	#1
	nop
	.end












