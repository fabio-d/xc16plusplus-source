; The penultimate instruction of a DO loop may not be REPEAT.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	repeat	#1
DoLoopEnd:
	nop
	.end












