	.title Certification tests
	.sbttl subtitle1 test

	.data

	.byte 0
abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:	.byte 1
a0123456789:	.byte 2
	.byte 3
.def:	.byte 4
_ghi:	.byte 100
	.byte 125
	.int  0
	.int  255
	.int  256
	.int 1000
	.int 2555
	.byte 0x00
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x64
	.byte 0x7D
	.byte 0x7F


	.text
	

._:	.byte 0
	.byte 1
	.byte 2
	.byte 3
	.byte 4
	.byte 100
	.byte 125
	.int  0
	.int  255
	.int  256
	.int 1000
	.int 2555
	.byte 0x00
	.byte 0x01
	.byte 0x02
	.byte 0x03
	.byte 0x04
	.byte 0x64
	.byte 0x7D
	.int 0
	.int 0xFF
	.int 0x100
	.int 0x3E8
	.int 0x9FB
	.long 0
	.long 1
	.long 2
	.long 100
	.long 125
	.long 32767
	.long 65535
	.long 0x01
	.long 0x02
	.long 0x00
	.long 0x64
	.long 0x7D
	.long 0x7F

	.end
