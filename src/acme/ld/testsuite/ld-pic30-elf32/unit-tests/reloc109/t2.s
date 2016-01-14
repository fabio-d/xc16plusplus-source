;
; Test cases for reloc109
;
.if 1
	.text
.else
	.data
.endif

	.align 2
T1:
	.pbyte b1
	.pbyte b1
	.pbyte b1

	.align 2
T2:
	.pbyte b1
	.pbyte b1
	.pword dmaoffset(b2)

	.align 2
T3:
	.pbyte b1
	.pword dmaoffset(b2)
	.pbyte b1

	.align 2
T4:
	.pbyte b1
	.pword dmaoffset(b2)
	.pword dmaoffset(b2)

	.align 2
T5:
	.pword dmaoffset(b2)
	.pbyte b1
	.pbyte b1

	.align 2
T6:
	.pword dmaoffset(b2)
	.pbyte b1
	.pword dmaoffset(b2)

	.align 2
T7:
	.pword dmaoffset(b2)
	.pword dmaoffset(b2)
	.pbyte b1

	.align 2
T8:
	.pword dmaoffset(b2)
	.pword dmaoffset(b2)
	.pword dmaoffset(b2)
END:
