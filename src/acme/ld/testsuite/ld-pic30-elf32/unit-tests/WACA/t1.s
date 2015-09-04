.global __reset

	.text
__reset:

;;LDSLV
	ldslv [w7], [w8++], #2
        ldslv [w7++], [w8++], #3

;;VFSLV

        vfslv [w7], [w8++], #2
        vfslv [w7++], [w8++], #3

;;BFINS
        bfins #7, #6, w6, [w4++]
        bfins #7, #6, w6, __data
        bfins #7, #6, #255, w6 

;;BFEXT
        bfext #7, #6, [--W7], w3
        bfext #7, #6, __data, w3

;;LACD
        lac.d w6, B
        lac.d w6, #-2, A

;;SACD
        sac.d A, w2
        sac.d A, #4, [--w2]

;;FLIM
        flim w6, [w5]
        flim w6, [w5], w7
        flim.v w6, [w5], w7

;;DIV
        divf2 w2, w6
	div2.sd w6, w7
	div2.sw w5, w7
	div2.ud w6, w7
	div2.uw w5, w7

;;MINAB
        min A
        min A, w8
	min.v A, w8

;;MAXAB
        max B
	max B, w7
        max.v B, w7

;;NORMACW
        norm A, [w8++]


	.data
__data:
	.word 0xFFFF

