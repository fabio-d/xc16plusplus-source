;
; Test cases for reloc051
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
	.pword psvoffset(i2)

	.align 2
T3:
	.pbyte i1
	.pbyte i1
	.pword psvoffset(i2)
	.pbyte i1

	.align 2
T4:
	.pbyte i1
	.pbyte i1
	.pword psvoffset(i2)
	.pword psvoffset(i2)

	.align 2
T5:
	.pbyte i1
	.pword psvoffset(i2)
	.pbyte i1
	.pbyte i1

	.align 2
T6:
	.pbyte i1
	.pword psvoffset(i2)
	.pbyte i1
	.pword psvoffset(i2)

	.align 2
T7:
	.pbyte i1
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pbyte i1

	.align 2
T8:
	.pbyte i1
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pword psvoffset(i2)

	.align 2
T9:
	.pword psvoffset(i2)
	.pbyte i1
	.pbyte i1
	.pbyte i1

	.align 2
T10:
	.pword psvoffset(i2)
	.pbyte i1
	.pbyte i1
	.pword psvoffset(i2)

	.align 2
T11:
	.pword psvoffset(i2)
	.pbyte i1
	.pword psvoffset(i2)
	.pbyte i1

	.align 2
T12:
	.pword psvoffset(i2)
	.pbyte i1
	.pword psvoffset(i2)
	.pword psvoffset(i2)

	.align 2
T13:
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pbyte i1
	.pbyte i1

	.align 2
T14:
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pbyte i1
	.pword psvoffset(i2)

	.align 2
T15:
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pbyte i1

	.align 2
T16:
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pword psvoffset(i2)
	.pword psvoffset(i2)
END:
