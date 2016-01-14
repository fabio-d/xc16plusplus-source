	.title cert0307 .porg Advance Location Counter
	.sbttl subtitle1 test

	.data

long1:	.long	0x10000000
int1:	.int	0x1000
long2:	.long	0x20000000
int2:	.int	0x2000
long3:	.long	0x30000000
int3:	.int	0x3000
long4:	.long	0x40000000
int4:	.int	0x4000
long5:	.long	0x50000000
int5:	.int	0x5000
long6:	.long	0x60000000
int6:	.int	0x6000
long7:	.long	0x70000000
int7:	.int	0x8000
	.nolist

	.text

	.org 0, 0
main:
	MOV #5, w5
	MOV #1, w6
1:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
2:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
	addc w5, w6, w7

        bra 3f


        .porg 0x100, 0xA5

        .pfillvalue 0x56
        .fillupper  0x34
        .fillvalue  0x12

        .porg 0x180

        .porg 0x1E0, 0xA5

        .pfillvalue 0xA5
        .porg 0x1F0

	.org 0x200, 0xFF

3:	MUL.US	w5, w6, w8

        bra 2f

        .porg 0x300, 0x5A

        NOP
        bra 2f

        .fillvalue
        .pfillvalue
        .fillupper

        .porg 0x400, 0x55

        NOP
        bra 2f

        .porg 0x480
        NOP
        bra 2f

        .org 0x500, 0xAA

2:	MOV #1, w6
4:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	bra lb

        .org 0x580

5:	MOV #1, w6
	addc w5, w6, w7
	MOV #1, w6
	MUL.US	w5, w6, w8
6:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8

	MOV	w1, w8
	MOV #64159, w5
7:	MOV #1, w6
	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6
8:	addc w5, w6, w7
	MUL.US	w5, w6, w8
	MOV #1, w6

9:	addc w5, w6, w7
	MUL.US	w5, w6, w8

        .pfillvalue 0xFF
	.org 0x600, 0x01

0:	goto	main
	goto	1b
	goto 	2b

        .org 0x680

	goto	3b
	goto	4b
	goto	5b
	goto	6b

        .porg 0x700

	goto	7b
	goto	8b
	goto	9b
	goto	0b
	.end
