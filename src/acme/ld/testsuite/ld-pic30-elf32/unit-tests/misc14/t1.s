	.text
	.global __reset
__reset:
	.pbyte f1,f2,f3,f4

	.section foo,"r"
	.byte f1,f2,f3,f4

	.section dat,"d"
	.byte f1,f2,f3,f4

