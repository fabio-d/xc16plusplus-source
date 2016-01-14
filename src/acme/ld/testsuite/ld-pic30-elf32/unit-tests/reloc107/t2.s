;
; Test cases for reloc107
;
.if 1
	.text
.else
	.section results,data,address(0xac)
.endif

	.align 2
T1:
	.byte b1
	.byte b1
	.byte b1
	.byte b1

	.align 2
T2:
	.byte b1
	.byte b1
	.byte b1
	.word dmaoffset(b2)

	.align 2
T3:
	.byte b1
	.byte b1
	.byte b1
	.long dmaoffset(b3)

	.align 2
T4:
	.byte b1
	.byte b1
	.word dmaoffset(b2)
	.byte b1

	.align 2
T5:
	.byte b1
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T6:
	.byte b1
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T7:
	.byte b1
	.byte b1
	.long dmaoffset(b3)
	.byte b1

	.align 2
T8:
	.byte b1
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T9:
	.byte b1
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T10:
	.byte b1
	.word dmaoffset(b2)
	.byte b1
	.byte b1

	.align 2
T11:
	.byte b1
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T12:
	.byte b1
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T13:
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T14:
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T15:
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T16:
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T17:
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T18:
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T19:
	.byte b1
	.long dmaoffset(b3)
	.byte b1
	.byte b1

	.align 2
T20:
	.byte b1
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T21:
	.byte b1
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T22:
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T23:
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T24:
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T25:
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T26:
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T27:
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T28:
	.word dmaoffset(b2)
	.byte b1
	.byte b1
	.byte b1

	.align 2
T29:
	.word dmaoffset(b2)
	.byte b1
	.byte b1
	.word dmaoffset(b2)

	.align 2
T30:
	.word dmaoffset(b2)
	.byte b1
	.byte b1
	.long dmaoffset(b3)

	.align 2
T31:
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)
	.byte b1

	.align 2
T32:
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T33:
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T34:
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)
	.byte b1

	.align 2
T35:
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T36:
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T37:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1
	.byte b1

	.align 2
T38:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T39:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T40:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T41:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T42:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T43:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T44:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T45:
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T46:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1
	.byte b1

	.align 2
T47:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T48:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T49:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T50:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T51:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T52:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T53:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T54:
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T55:
	.long dmaoffset(b3)
	.byte b1
	.byte b1
	.byte b1

	.align 2
T56:
	.long dmaoffset(b3)
	.byte b1
	.byte b1
	.word dmaoffset(b2)

	.align 2
T57:
	.long dmaoffset(b3)
	.byte b1
	.byte b1
	.long dmaoffset(b3)

	.align 2
T58:
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)
	.byte b1

	.align 2
T59:
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T60:
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T61:
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)
	.byte b1

	.align 2
T62:
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T63:
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T64:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1
	.byte b1

	.align 2
T65:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T66:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T67:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T68:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T69:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T70:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T71:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T72:
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)
	.long dmaoffset(b3)

	.align 2
T73:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1
	.byte b1

	.align 2
T74:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1
	.word dmaoffset(b2)

	.align 2
T75:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1
	.long dmaoffset(b3)

	.align 2
T76:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.byte b1

	.align 2
T77:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.word dmaoffset(b2)

	.align 2
T78:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)
	.long dmaoffset(b3)

	.align 2
T79:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.byte b1

	.align 2
T80:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.word dmaoffset(b2)

	.align 2
T81:
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
	.long dmaoffset(b3)
END:
