;
; Test cases for data relocations in program memory
;
.if 1
	.text
.else
	.section .dconst,"d"
.endif

	.align 4
T1:
	.byte 01
	.byte 02
	.byte 03
	.byte 04

	.align 4
T2:
	.word 0x1111, 0x2222, 0x3333, 0x4444

	.align 4
T4:
	.long 0x11111111, 0x22222222, 0x33333333, 0x44444444

	.align 4
T5:
	.float 3.1415926

	.align 4
T6:
	.single 3.1415926

	.align 4
T7:
	.double 3.1415926

T9:
	.ascii "Hello, World!!\0"
	.ascii "Cool Dude!!\0"


