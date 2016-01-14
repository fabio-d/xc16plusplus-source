        .data
        .word   0
dsfr:   .word   1
        .text

        btst.b  xsfr,#1
        btst.b  xsfr+1,#1
        btst.b  dsfr,#1
        btst.b  dsfr+1,#1
        btst.b  CSFR,#1
        btst.b  CSFR+1,#1

        btst    xsfr,#1
        btst    xsfr,#9
        btst    dsfr,#1
        btst    dsfr,#9
        btst    CSFR,#1
        btst    CSFR,#9

        btst.w  xsfr,#1
        btst.w  xsfr,#9
        btst.w  dsfr,#1
        btst.w  dsfr,#9
        btst.w  CSFR,#1
        btst.w  CSFR,#9

        .equ    CSFR,4

