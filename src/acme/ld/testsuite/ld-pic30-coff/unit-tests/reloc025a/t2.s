;
; Test cases for reloc025a
;
.if 1
	.text
.else
	.section .dconst,"d"
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
	.word handle(i2)

	.align 2
T3:
	.byte i1
	.byte i1
	.byte i1
	.word handle(i4)

	.align 2
T4:
	.byte i1
	.byte i1
	.word handle(i2)
	.byte i1

	.align 2
T5:
	.byte i1
	.byte i1
	.word handle(i2)
	.word handle(i2)

	.align 2
T6:
	.byte i1
	.byte i1
	.word handle(i2)
	.word handle(i4)

	.align 2
T7:
	.byte i1
	.byte i1
	.word handle(i4)
	.byte i1

	.align 2
T8:
	.byte i1
	.byte i1
	.word handle(i4)
	.word handle(i2)

	.align 2
T9:
	.byte i1
	.byte i1
	.word handle(i4)
	.word handle(i4)

	.align 2
T10:
	.byte i1
	.word handle(i2)
	.byte i1
	.byte i1

	.align 2
T11:
	.byte i1
	.word handle(i2)
	.byte i1
	.word handle(i2)

	.align 2
T12:
	.byte i1
	.word handle(i2)
	.byte i1
	.word handle(i4)

	.align 2
T13:
	.byte i1
	.word handle(i2)
	.word handle(i2)
	.byte i1

	.align 2
T14:
	.byte i1
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)

	.align 2
T15:
	.byte i1
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)

	.align 2
T16:
	.byte i1
	.word handle(i2)
	.word handle(i4)
	.byte i1

	.align 2
T17:
	.byte i1
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)

	.align 2
T18:
	.byte i1
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)

	.align 2
T19:
	.byte i1
	.word handle(i4)
	.byte i1
	.byte i1

	.align 2
T20:
	.byte i1
	.word handle(i4)
	.byte i1
	.word handle(i2)

	.align 2
T21:
	.byte i1
	.word handle(i4)
	.byte i1
	.word handle(i4)

	.align 2
T22:
	.byte i1
	.word handle(i4)
	.word handle(i2)
	.byte i1

	.align 2
T23:
	.byte i1
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)

	.align 2
T24:
	.byte i1
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)

	.align 2
T25:
	.byte i1
	.word handle(i4)
	.word handle(i4)
	.byte i1

	.align 2
T26:
	.byte i1
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)

	.align 2
T27:
	.byte i1
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)

	.align 2
T28:
	.word handle(i2)
	.byte i1
	.byte i1
	.byte i1

	.align 2
T29:
	.word handle(i2)
	.byte i1
	.byte i1
	.word handle(i2)

	.align 2
T30:
	.word handle(i2)
	.byte i1
	.byte i1
	.word handle(i4)

	.align 2
T31:
	.word handle(i2)
	.byte i1
	.word handle(i2)
	.byte i1

	.align 2
T32:
	.word handle(i2)
	.byte i1
	.word handle(i2)
	.word handle(i2)

	.align 2
T33:
	.word handle(i2)
	.byte i1
	.word handle(i2)
	.word handle(i4)

	.align 2
T34:
	.word handle(i2)
	.byte i1
	.word handle(i4)
	.byte i1

	.align 2
T35:
	.word handle(i2)
	.byte i1
	.word handle(i4)
	.word handle(i2)

	.align 2
T36:
	.word handle(i2)
	.byte i1
	.word handle(i4)
	.word handle(i4)

	.align 2
T37:
	.word handle(i2)
	.word handle(i2)
	.byte i1
	.byte i1

	.align 2
T38:
	.word handle(i2)
	.word handle(i2)
	.byte i1
	.word handle(i2)

	.align 2
T39:
	.word handle(i2)
	.word handle(i2)
	.byte i1
	.word handle(i4)

	.align 2
T40:
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)
	.byte i1

	.align 2
T41:
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)

	.align 2
T42:
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)

	.align 2
T43:
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)
	.byte i1

	.align 2
T44:
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)

	.align 2
T45:
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)

	.align 2
T46:
	.word handle(i2)
	.word handle(i4)
	.byte i1
	.byte i1

	.align 2
T47:
	.word handle(i2)
	.word handle(i4)
	.byte i1
	.word handle(i2)

	.align 2
T48:
	.word handle(i2)
	.word handle(i4)
	.byte i1
	.word handle(i4)

	.align 2
T49:
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)
	.byte i1

	.align 2
T50:
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)

	.align 2
T51:
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)

	.align 2
T52:
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)
	.byte i1

	.align 2
T53:
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)

	.align 2
T54:
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)

	.align 2
T55:
	.word handle(i4)
	.byte i1
	.byte i1
	.byte i1

	.align 2
T56:
	.word handle(i4)
	.byte i1
	.byte i1
	.word handle(i2)

	.align 2
T57:
	.word handle(i4)
	.byte i1
	.byte i1
	.word handle(i4)

	.align 2
T58:
	.word handle(i4)
	.byte i1
	.word handle(i2)
	.byte i1

	.align 2
T59:
	.word handle(i4)
	.byte i1
	.word handle(i2)
	.word handle(i2)

	.align 2
T60:
	.word handle(i4)
	.byte i1
	.word handle(i2)
	.word handle(i4)

	.align 2
T61:
	.word handle(i4)
	.byte i1
	.word handle(i4)
	.byte i1

	.align 2
T62:
	.word handle(i4)
	.byte i1
	.word handle(i4)
	.word handle(i2)

	.align 2
T63:
	.word handle(i4)
	.byte i1
	.word handle(i4)
	.word handle(i4)

	.align 2
T64:
	.word handle(i4)
	.word handle(i2)
	.byte i1
	.byte i1

	.align 2
T65:
	.word handle(i4)
	.word handle(i2)
	.byte i1
	.word handle(i2)

	.align 2
T66:
	.word handle(i4)
	.word handle(i2)
	.byte i1
	.word handle(i4)

	.align 2
T67:
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)
	.byte i1

	.align 2
T68:
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)
	.word handle(i2)

	.align 2
T69:
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)
	.word handle(i4)

	.align 2
T70:
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)
	.byte i1

	.align 2
T71:
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)
	.word handle(i2)

	.align 2
T72:
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)
	.word handle(i4)

	.align 2
T73:
	.word handle(i4)
	.word handle(i4)
	.byte i1
	.byte i1

	.align 2
T74:
	.word handle(i4)
	.word handle(i4)
	.byte i1
	.word handle(i2)

	.align 2
T75:
	.word handle(i4)
	.word handle(i4)
	.byte i1
	.word handle(i4)

	.align 2
T76:
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)
	.byte i1

	.align 2
T77:
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)
	.word handle(i2)

	.align 2
T78:
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)
	.word handle(i4)

	.align 2
T79:
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)
	.byte i1

	.align 2
T80:
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)
	.word handle(i2)

	.align 2
T81:
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)
	.word handle(i4)
END:
