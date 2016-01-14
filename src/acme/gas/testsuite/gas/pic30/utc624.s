        .data
        .word   0
dsfr:   .word   1
        .text

        btsts.b  xsfr,#1
        btsts.b  xsfr+1,#1
        btsts.b  dsfr,#1
        btsts.b  dsfr+1,#1
        btsts.b  CSFR,#1
        btsts.b  CSFR+1,#1

        btsts    xsfr,#1
        btsts    xsfr,#9
        btsts    dsfr,#1
        btsts    dsfr,#9
        btsts    CSFR,#1
        btsts    CSFR,#9

        btsts.w  xsfr,#1
        btsts.w  xsfr,#9
        btsts.w  dsfr,#1
        btsts.w  dsfr,#9
        btsts.w  CSFR,#1
        btsts.w  CSFR,#9

        .equ    CSFR,4

