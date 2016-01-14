        .data
        .word   0
dsfr:   .word   1
        .text

        btss.b  xsfr,#1
        btss.b  xsfr+1,#1
        btss.b  dsfr,#1
        btss.b  dsfr+1,#1
        btss.b  CSFR,#1
        btss.b  CSFR+1,#1

        btss    xsfr,#1
        btss    xsfr,#9
        btss    dsfr,#1
        btss    dsfr,#9
        btss    CSFR,#1
        btss    CSFR,#9

        btss.w  xsfr,#1
        btss.w  xsfr,#9
        btss.w  dsfr,#1
        btss.w  dsfr,#9
        btss.w  CSFR,#1
        btss.w  CSFR,#9

        .equ    CSFR,4

