;
; Test cases for data relocations in program memory
;
	.text

	.align 2
T1:
	.pbyte i1
	.pbyte i1
	.pbyte i1
	.pbyte i1

	.align 2
T2:
	.pbyte i1
	.pbyte i1
	.pbyte i1
	.pword i2

	.align 2
T3:
	.pbyte i1
	.pbyte i1
	.pword i2
	.pbyte i1

	.align 2
T4:
	.pbyte i1
	.pbyte i1
	.pword i2
	.pword i2

	.align 2
T5:
	.pbyte i1
	.pword i2
	.pbyte i1
	.pbyte i1

	.align 2
T6:
	.pbyte i1
	.pword i2
	.pbyte i1
	.pword i2

	.align 2
T7:
	.pbyte i1
	.pword i2
	.pword i2
	.pbyte i1

	.align 2
T8:
	.pbyte i1
	.pword i2
	.pword i2
	.pword i2

	.align 2
T9:
	.pword i2
	.pbyte i1
	.pbyte i1
	.pbyte i1

	.align 2
T10:
	.pword i2
	.pbyte i1
	.pbyte i1
	.pword i2

	.align 2
T11:
	.pword i2
	.pbyte i1
	.pword i2
	.pbyte i1

	.align 2
T12:
	.pword i2
	.pbyte i1
	.pword i2
	.pword i2

	.align 2
T13:
	.pword i2
	.pword i2
	.pbyte i1
	.pbyte i1

	.align 2
T14:
	.pword i2
	.pword i2
	.pbyte i1
	.pword i2

	.align 2
T15:
	.pword i2
	.pword i2
	.pword i2
	.pbyte i1

	.align 2
T16:
	.pword i2
	.pword i2
	.pword i2
	.pword i2
END:
