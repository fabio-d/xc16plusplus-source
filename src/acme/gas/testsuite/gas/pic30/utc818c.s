; The last instruction of a DO loop may not be a GOTO.
	.text
	do	#1,DoLoopEnd
	nop
	nop
	.section .mytext,"x"
DoLoopEnd:
	goto	DoLoopEnd
	nop
	.end



