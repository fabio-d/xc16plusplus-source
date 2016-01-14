        .data
        .word   0
dsfr:   .word   1
        .text

        bclr.b  xsfr,#1
        bclr.b  xsfr+1,#1
        bclr.b  dsfr,#1
        bclr.b  dsfr+1,#1
        bclr.b  CSFR,#1
        bclr.b  CSFR+1,#1

        bclr    xsfr,#1
        bclr    xsfr,#9
        bclr    dsfr,#1
        bclr    dsfr,#9
        bclr    CSFR,#1
        bclr    CSFR,#9

        bclr.w  xsfr,#1
        bclr.w  xsfr,#9
        bclr.w  dsfr,#1
        bclr.w  dsfr,#9
        bclr.w  CSFR,#1
        bclr.w  CSFR,#9

        .equ    CSFR,4

