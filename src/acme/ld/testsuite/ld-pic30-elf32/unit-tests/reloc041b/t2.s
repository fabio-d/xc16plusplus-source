;
; Test cases for reloc041b
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
	.word psvoffset(i2)

	.align 2
T3:
	.byte i1
	.byte i1
	.byte i1
	.long psvoffset(i4)

	.align 2
T4:
	.byte i1
	.byte i1
	.word psvoffset(i2)
	.byte i1

	.align 2
T5:
	.byte i1
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T6:
	.byte i1
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T7:
	.byte i1
	.byte i1
	.long psvoffset(i4)
	.byte i1

	.align 2
T8:
	.byte i1
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T9:
	.byte i1
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T10:
	.byte i1
	.word psvoffset(i2)
	.byte i1
	.byte i1

	.align 2
T11:
	.byte i1
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)

	.align 2
T12:
	.byte i1
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)

	.align 2
T13:
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1

	.align 2
T14:
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T15:
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T16:
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1

	.align 2
T17:
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T18:
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T19:
	.byte i1
	.long psvoffset(i4)
	.byte i1
	.byte i1

	.align 2
T20:
	.byte i1
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)

	.align 2
T21:
	.byte i1
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)

	.align 2
T22:
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1

	.align 2
T23:
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T24:
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T25:
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1

	.align 2
T26:
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T27:
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T28:
	.word psvoffset(i2)
	.byte i1
	.byte i1
	.byte i1

	.align 2
T29:
	.word psvoffset(i2)
	.byte i1
	.byte i1
	.word psvoffset(i2)

	.align 2
T30:
	.word psvoffset(i2)
	.byte i1
	.byte i1
	.long psvoffset(i4)

	.align 2
T31:
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)
	.byte i1

	.align 2
T32:
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T33:
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T34:
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)
	.byte i1

	.align 2
T35:
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T36:
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T37:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1
	.byte i1

	.align 2
T38:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)

	.align 2
T39:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)

	.align 2
T40:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1

	.align 2
T41:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T42:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T43:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1

	.align 2
T44:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T45:
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T46:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1
	.byte i1

	.align 2
T47:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)

	.align 2
T48:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)

	.align 2
T49:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1

	.align 2
T50:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T51:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T52:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1

	.align 2
T53:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T54:
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T55:
	.long psvoffset(i4)
	.byte i1
	.byte i1
	.byte i1

	.align 2
T56:
	.long psvoffset(i4)
	.byte i1
	.byte i1
	.word psvoffset(i2)

	.align 2
T57:
	.long psvoffset(i4)
	.byte i1
	.byte i1
	.long psvoffset(i4)

	.align 2
T58:
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)
	.byte i1

	.align 2
T59:
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T60:
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T61:
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)
	.byte i1

	.align 2
T62:
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T63:
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T64:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1
	.byte i1

	.align 2
T65:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1
	.word psvoffset(i2)

	.align 2
T66:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1
	.long psvoffset(i4)

	.align 2
T67:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.byte i1

	.align 2
T68:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T69:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T70:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.byte i1

	.align 2
T71:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T72:
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)
	.long psvoffset(i4)

	.align 2
T73:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1
	.byte i1

	.align 2
T74:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1
	.word psvoffset(i2)

	.align 2
T75:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1
	.long psvoffset(i4)

	.align 2
T76:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.byte i1

	.align 2
T77:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.word psvoffset(i2)

	.align 2
T78:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)
	.long psvoffset(i4)

	.align 2
T79:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.byte i1

	.align 2
T80:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.word psvoffset(i2)

	.align 2
T81:
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)
	.long psvoffset(i4)
END:
