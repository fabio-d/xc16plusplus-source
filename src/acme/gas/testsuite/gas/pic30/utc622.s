        .data
        .word   0
dsfr:   .word   1
        .text

        btg.b  xsfr,#1
        btg.b  xsfr+1,#1
        btg.b  dsfr,#1
        btg.b  dsfr+1,#1
        btg.b  CSFR,#1
        btg.b  CSFR+1,#1

        btg    xsfr,#1
        btg    xsfr,#9
        btg    dsfr,#1
        btg    dsfr,#9
        btg    CSFR,#1
        btg    CSFR,#9

        btg.w  xsfr,#1
        btg.w  xsfr,#9
        btg.w  dsfr,#1
        btg.w  dsfr,#9
        btg.w  CSFR,#1
        btg.w  CSFR,#9

        .equ    CSFR,4

