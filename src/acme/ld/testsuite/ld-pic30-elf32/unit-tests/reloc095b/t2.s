;
; Test cases for data relocations in data memory
;
.if 0
	.text
.else
	.data
.endif

	.align 2
T1:
	.byte i1
	.byte i1
	.byte i1
	.byte i1

	.align 2
T2:
	.byte i1
	.byte i1
	.byte i1
	.word i2

	.align 2
T3:
	.byte i1
	.byte i1
	.byte i1
	.long i4

	.align 2
T4:
	.byte i1
	.byte i1
	.word i2
	.byte i1

	.align 2
T5:
	.byte i1
	.byte i1
	.word i2
	.word i2

	.align 2
T6:
	.byte i1
	.byte i1
	.word i2
	.long i4

	.align 2
T7:
	.byte i1
	.byte i1
	.long i4
	.byte i1

	.align 2
T8:
	.byte i1
	.byte i1
	.long i4
	.word i2

	.align 2
T9:
	.byte i1
	.byte i1
	.long i4
	.long i4

	.align 2
T10:
	.byte i1
	.word i2
	.byte i1
	.byte i1

	.align 2
T11:
	.byte i1
	.word i2
	.byte i1
	.word i2

	.align 2
T12:
	.byte i1
	.word i2
	.byte i1
	.long i4

	.align 2
T13:
	.byte i1
	.word i2
	.word i2
	.byte i1

	.align 2
T14:
	.byte i1
	.word i2
	.word i2
	.word i2

	.align 2
T15:
	.byte i1
	.word i2
	.word i2
	.long i4

	.align 2
T16:
	.byte i1
	.word i2
	.long i4
	.byte i1

	.align 2
T17:
	.byte i1
	.word i2
	.long i4
	.word i2

	.align 2
T18:
	.byte i1
	.word i2
	.long i4
	.long i4

	.align 2
T19:
	.byte i1
	.long i4
	.byte i1
	.byte i1

	.align 2
T20:
	.byte i1
	.long i4
	.byte i1
	.word i2

	.align 2
T21:
	.byte i1
	.long i4
	.byte i1
	.long i4

	.align 2
T22:
	.byte i1
	.long i4
	.word i2
	.byte i1

	.align 2
T23:
	.byte i1
	.long i4
	.word i2
	.word i2

	.align 2
T24:
	.byte i1
	.long i4
	.word i2
	.long i4

	.align 2
T25:
	.byte i1
	.long i4
	.long i4
	.byte i1

	.align 2
T26:
	.byte i1
	.long i4
	.long i4
	.word i2

	.align 2
T27:
	.byte i1
	.long i4
	.long i4
	.long i4

	.align 2
T28:
	.word i2
	.byte i1
	.byte i1
	.byte i1

	.align 2
T29:
	.word i2
	.byte i1
	.byte i1
	.word i2

	.align 2
T30:
	.word i2
	.byte i1
	.byte i1
	.long i4

	.align 2
T31:
	.word i2
	.byte i1
	.word i2
	.byte i1

	.align 2
T32:
	.word i2
	.byte i1
	.word i2
	.word i2

	.align 2
T33:
	.word i2
	.byte i1
	.word i2
	.long i4

	.align 2
T34:
	.word i2
	.byte i1
	.long i4
	.byte i1

	.align 2
T35:
	.word i2
	.byte i1
	.long i4
	.word i2

	.align 2
T36:
	.word i2
	.byte i1
	.long i4
	.long i4

	.align 2
T37:
	.word i2
	.word i2
	.byte i1
	.byte i1

	.align 2
T38:
	.word i2
	.word i2
	.byte i1
	.word i2

	.align 2
T39:
	.word i2
	.word i2
	.byte i1
	.long i4

	.align 2
T40:
	.word i2
	.word i2
	.word i2
	.byte i1

	.align 2
T41:
	.word i2
	.word i2
	.word i2
	.word i2

	.align 2
T42:
	.word i2
	.word i2
	.word i2
	.long i4

	.align 2
T43:
	.word i2
	.word i2
	.long i4
	.byte i1

	.align 2
T44:
	.word i2
	.word i2
	.long i4
	.word i2

	.align 2
T45:
	.word i2
	.word i2
	.long i4
	.long i4

	.align 2
T46:
	.word i2
	.long i4
	.byte i1
	.byte i1

	.align 2
T47:
	.word i2
	.long i4
	.byte i1
	.word i2

	.align 2
T48:
	.word i2
	.long i4
	.byte i1
	.long i4

	.align 2
T49:
	.word i2
	.long i4
	.word i2
	.byte i1

	.align 2
T50:
	.word i2
	.long i4
	.word i2
	.word i2

	.align 2
T51:
	.word i2
	.long i4
	.word i2
	.long i4

	.align 2
T52:
	.word i2
	.long i4
	.long i4
	.byte i1

	.align 2
T53:
	.word i2
	.long i4
	.long i4
	.word i2

	.align 2
T54:
	.word i2
	.long i4
	.long i4
	.long i4

	.align 2
T55:
	.long i4
	.byte i1
	.byte i1
	.byte i1

	.align 2
T56:
	.long i4
	.byte i1
	.byte i1
	.word i2

	.align 2
T57:
	.long i4
	.byte i1
	.byte i1
	.long i4

	.align 2
T58:
	.long i4
	.byte i1
	.word i2
	.byte i1

	.align 2
T59:
	.long i4
	.byte i1
	.word i2
	.word i2

	.align 2
T60:
	.long i4
	.byte i1
	.word i2
	.long i4

	.align 2
T61:
	.long i4
	.byte i1
	.long i4
	.byte i1

	.align 2
T62:
	.long i4
	.byte i1
	.long i4
	.word i2

	.align 2
T63:
	.long i4
	.byte i1
	.long i4
	.long i4

	.align 2
T64:
	.long i4
	.word i2
	.byte i1
	.byte i1

	.align 2
T65:
	.long i4
	.word i2
	.byte i1
	.word i2

	.align 2
T66:
	.long i4
	.word i2
	.byte i1
	.long i4

	.align 2
T67:
	.long i4
	.word i2
	.word i2
	.byte i1

	.align 2
T68:
	.long i4
	.word i2
	.word i2
	.word i2

	.align 2
T69:
	.long i4
	.word i2
	.word i2
	.long i4

	.align 2
T70:
	.long i4
	.word i2
	.long i4
	.byte i1

	.align 2
T71:
	.long i4
	.word i2
	.long i4
	.word i2

	.align 2
T72:
	.long i4
	.word i2
	.long i4
	.long i4

	.align 2
T73:
	.long i4
	.long i4
	.byte i1
	.byte i1

	.align 2
T74:
	.long i4
	.long i4
	.byte i1
	.word i2

	.align 2
T75:
	.long i4
	.long i4
	.byte i1
	.long i4

	.align 2
T76:
	.long i4
	.long i4
	.word i2
	.byte i1

	.align 2
T77:
	.long i4
	.long i4
	.word i2
	.word i2

	.align 2
T78:
	.long i4
	.long i4
	.word i2
	.long i4

	.align 2
T79:
	.long i4
	.long i4
	.long i4
	.byte i1

	.align 2
T80:
	.long i4
	.long i4
	.long i4
	.word i2

	.align 2
T81:
	.long i4
	.long i4
	.long i4
	.long i4
END:
