	.title Certification tests
	.sbttl subtitle1 test

	.data

zero1:	.byte 0*0
zero2:	.byte 0*1
one1:	.byte 0+1
two1:	.byte 1+1
negone1:	.byte 0-1
one2:	.byte 1-0
zero3:	.byte 0/100
five1:	.int  5/1
tff1:	.int  254+1
twenfive1:	.int  5^2
tencube1:	.int  10^3
twohund1:	.int 100+100
tff2:	.byte 155+100
off1:	.byte 255-100
zero4:	.byte 255-255
tff3:	.byte 255-0
ten1:	.byte 5*2
eighty1:	.byte 10*8
sixtwo1:	.byte 10+7+1+2+3+4+5+6+7+8+9
one3:	.byte 10-9


	.text
	
	.byte 0*0
	.byte 0*1
	.byte 0+1
	.byte 1+1
	.byte 0-1
	.byte 1-0
	.byte 0/1
	.int  5/1
	.int  254+1
	.int  5^2
	.int  10^3
	.int 100+100
	.byte 155+100
	.byte 255-100
	.byte 255-255
	.byte 255-0
	.byte 5*2
	.byte 10*8
	.byte 10+7+1+2+3+4+5+6+7+8+9
	.byte 10-9

	.end
