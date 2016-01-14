        .data
        .word   0
dsfr:   .word   1
        .text

        btsc.b  xsfr,#1
        btsc.b  xsfr+1,#1
        btsc.b  dsfr,#1
        btsc.b  dsfr+1,#1
        btsc.b  CSFR,#1
        btsc.b  CSFR+1,#1

        btsc    xsfr,#1
        btsc    xsfr,#9
        btsc    dsfr,#1
        btsc    dsfr,#9
        btsc    CSFR,#1
        btsc    CSFR,#9

        btsc.w  xsfr,#1
        btsc.w  xsfr,#9
        btsc.w  dsfr,#1
        btsc.w  dsfr,#9
        btsc.w  CSFR,#1
        btsc.w  CSFR,#9

        .equ    CSFR,4

