        .data
        .word   0
dsfr:   .word   1
        .text

        bset.b  xsfr,#1
        bset.b  xsfr+1,#1
        bset.b  dsfr,#1
        bset.b  dsfr+1,#1
        bset.b  CSFR,#1
        bset.b  CSFR+1,#1

        bset    xsfr,#1
        bset    xsfr,#9
        bset    dsfr,#1
        bset    dsfr,#9
        bset    CSFR,#1
        bset    CSFR,#9

        bset.w  xsfr,#1
        bset.w  xsfr,#9
        bset.w  dsfr,#1
        bset.w  dsfr,#9
        bset.w  CSFR,#1
        bset.w  CSFR,#9

        .equ    CSFR,4

