; This test file switches between .data and .text sections several times.
; This test is intended to verify that the location counter updates correctly.

        /****************************************************
                     Start of assembly code               
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

.NOLIST

;==============================================================================
;
; 1. Core Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 1a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv WREG0L, _WREG0
         .equiv WREG0H, _WREG0+1
         .equiv WREG1L, _WREG1
         .equiv WREG1H, _WREG1+1
         .equiv WREG2L, _WREG2
         .equiv WREG2H, _WREG2+1
         .equiv WREG3L, _WREG3
         .equiv WREG3H, _WREG3+1
         .equiv WREG4L, _WREG4
         .equiv WREG4H, _WREG4+1
         .equiv WREG5L, _WREG5
         .equiv WREG5H, _WREG5+1
         .equiv WREG6L, _WREG6
         .equiv WREG6H, _WREG6+1
         .equiv WREG7L, _WREG7
         .equiv WREG7H, _WREG7+1
         .equiv WREG8L, _WREG8
         .equiv WREG8H, _WREG8+1
         .equiv WREG9L, _WREG9
         .equiv WREG9H, _WREG9+1
         .equiv WREG10L, _WREG10
         .equiv WREG10H, _WREG10+1
         .equiv WREG11L, _WREG11
         .equiv WREG11H, _WREG11+1
         .equiv WREG12L, _WREG12
         .equiv WREG12H, _WREG12+1
         .equiv WREG13L, _WREG13
         .equiv WREG13H, _WREG13+1
         .equiv WREG14L, _WREG14
         .equiv WREG14H, _WREG14+1
         .equiv WREG15L, _WREG15
         .equiv WREG15H, _WREG15+1
         .equiv SPLIML, _SPLIM
         .equiv SPLIMH, _SPLIM+1
         .equiv ACCALL, _ACCAL
         .equiv ACCALH, _ACCAL+1
         .equiv ACCAHL, _ACCAH
         .equiv ACCAHH, _ACCAH+1
         .equiv ACCAUL, _ACCAU
         .equiv ACCBLL, _ACCBL
         .equiv ACCBLH, _ACCBL+1
         .equiv ACCBHL, _ACCBH
         .equiv ACCBHH, _ACCBH+1
         .equiv ACCBUL, _ACCBU
         .equiv PCLL, _PCL
         .equiv PCLH, _PCL+1
         .equiv PCHL, _PCH
         .equiv PCHH, _PCH+1
         .equiv TBLPAGL, _TBLPAG
         .equiv TBLPAGH, _TBLPAG+1
         .equiv PSVPAGL, _PSVPAG
         .equiv PSVPAGH, _PSVPAG+1
         .equiv RCOUNTL, _RCOUNT
         .equiv RCOUNTH, _RCOUNT+1
         .equiv DCOUNTL, _DCOUNT
         .equiv DCOUNTH, _DCOUNT+1
         .equiv DOSTARTLL, _DOSTARTL
         .equiv DOSTARTLH, _DOSTARTL+1
         .equiv DOSTARTHL, _DOSTARTH
         .equiv DOSTARTHH, _DOSTARTH+1
         .equiv DOENDLL, _DOENDL
         .equiv DOENDLH, _DOENDL+1
         .equiv DOENDHL, _DOENDH
         .equiv DOENDHH, _DOENDH+1
         .equiv SRL, _SR                        ; See Description in section 1b
         .equiv SRH, _SR+1                      ; See Description in section 1b
         .equiv CORCONL, _CORCON                ; See Description in section 1b
         .equiv MODCONL, _MODCON                ; See Description in section 1b
         .equiv MODCONH, _MODCON+1              ; See Description in section 1b
         .equiv XMODSRTL, _XMODSRT
         .equiv XMODSRTH, _XMODSRT+1
         .equiv XMODENDL, _XMODEND
         .equiv XMODENDH, _XMODEND+1
         .equiv YMODSRTL, _YMODSRT
         .equiv YMODSRTH, _YMODSRT+1
         .equiv YMODENDL, _YMODEND
         .equiv YMODENDH, _YMODEND+1
         .equiv XBREVL, _XBREV                  ; See Description in section 1b
         .equiv XBREVH, _XBREV+1
         .equiv DISICNTL, _DISICNT
         .equiv DISICNTH, _DISICNT+1

;------------------------------------------------------------------------------
; 1b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     SR - Status Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv OA, 0x000F
         .equiv OB, 0x000E
         .equiv SA, 0x000D
         .equiv SB, 0x000C
         .equiv OAB, 0x000B
         .equiv SAB, 0x000A
         .equiv DA, 0x0009
         .equiv DC, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IPL2, 0x0007
         .equiv IPL1, 0x0006
         .equiv IPL0, 0x0005
         .equiv RA, 0x0004
         .equiv N, 0x0003
         .equiv OV, 0x0002
         .equiv Z, 0x0001
         .equiv C, 0x0000

;------------------------------------------------------------------------------
;     CORCON - Core Configuration Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv EDT, 0x000B
         .equiv DL2, 0x000A
         .equiv DL1, 0x0009
         .equiv DL0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SATA, 0x0007
         .equiv SATB, 0x0006
         .equiv SATDW, 0x0005
         .equiv ACCSAT, 0x0004
         .equiv IPL3, 0x0003
         .equiv PSV, 0x0002
         .equiv RND, 0x0001
         .equiv IF, 0x0000

;------------------------------------------------------------------------------
;     MODCON - Modulo Addressing Mode Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv XMODEN, 0x000F
         .equiv YMODEN, 0x000E

;------------------------------------------------------------------------------
;     XBREV - Bit Reversed Addressing Mode Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv BREN, 0x000F


;==============================================================================
;
; 2.  Interrupt Controller Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 2a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv INTCON1H, _INTCON1+1           ; See description for all
         .equiv INTCON1L, _INTCON1       ;  registers in sub-section below
         .equiv INTCON2H, _INTCON2+1
         .equiv INTCON2L, _INTCON2
         .equiv IFS0H, _IFS0+1
         .equiv IFS0L, _IFS0
         .equiv IFS1H, _IFS1+1
         .equiv IFS1L, _IFS1
         .equiv IFS2H, _IFS2+1
         .equiv IFS2L, _IFS2
         .equiv IEC0H, _IEC0+1
         .equiv IEC0L, _IEC0
         .equiv IEC1H, _IEC1+1
         .equiv IEC1L, _IEC1
         .equiv IEC2H, _IEC2+1
         .equiv IEC2L, _IEC2
         .equiv IPC0H, _IPC0+1
         .equiv IPC0L, _IPC0
         .equiv IPC1H, _IPC1+1
         .equiv IPC1L, _IPC1
         .equiv IPC2H, _IPC2+1
         .equiv IPC2L, _IPC2
         .equiv IPC3H, _IPC3+1
         .equiv IPC3L, _IPC3
         .equiv IPC4H, _IPC4+1
         .equiv IPC4L, _IPC4
         .equiv IPC5H, _IPC5+1
         .equiv IPC5L, _IPC5
         .equiv IPC6H, _IPC6+1
         .equiv IPC6L, _IPC6
         .equiv IPC7H, _IPC7+1
         .equiv IPC7L, _IPC7
         .equiv IPC8H, _IPC8+1
         .equiv IPC8L, _IPC8
         .equiv IPC9H, _IPC9+1
         .equiv IPC9L, _IPC9
         .equiv IPC10H, _IPC10+1
         .equiv IPC10L, _IPC10

;------------------------------------------------------------------------------
; 2b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     INTCON1 : Interrupt Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv NSTDIS, 0x000F
         .equiv OVATE, 0x000A
         .equiv OVBTE, 0x0009
         .equiv COVTE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SECUREFLT, 0x0005
         .equiv MATHERR, 0x0004
         .equiv ADDRERR, 0x0003
         .equiv STKERR, 0x0002
         .equiv OSCFAIL, 0x0001

;------------------------------------------------------------------------------
;     INTCON2 : Interrupt Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ALTIVT, 0x000F
         .equiv DISI, 0x000E


; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv INT4EP, 0x0004
         .equiv INT3EP, 0x0003
         .equiv INT2EP, 0x0002
         .equiv INT1EP, 0x0001
         .equiv INT0EP, 0x0000

;------------------------------------------------------------------------------
;     IFS0 : Interrupt Flag Status Register 0
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CNIF, 0x000F
         .equiv MI2CIF, 0x000E
         .equiv SI2CIF, 0x000D
         .equiv NVMIF, 0x000C
         .equiv ADIF, 0x000B
         .equiv U1TXIF, 0x000A
         .equiv U1RXIF, 0x0009
         .equiv SPI1IF, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv T3IF, 0x0007
         .equiv T2IF, 0x0006
         .equiv OC2IF, 0x0005
         .equiv IC2IF, 0x0004
         .equiv T1IF, 0x0003
         .equiv OC1IF, 0x0002
         .equiv IC1IF, 0x0001
         .equiv INT0IF, 0x0000

;------------------------------------------------------------------------------
;     IFS1 : Interrupt Flag Status Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv IC6IF, 0x000F
         .equiv IC5IF, 0x000E
         .equiv IC4IF, 0x000D
         .equiv IC3IF, 0x000C
         .equiv C1IF, 0x000B
         .equiv SPI2IF, 0x000A
         .equiv U2TXIF, 0x0009
         .equiv U2RXIF, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv INT2IF, 0x0007
         .equiv T5IF, 0x0006
         .equiv T4IF, 0x0005
         .equiv OC4IF, 0x0004
         .equiv OC3IF, 0x0003
         .equiv IC8IF, 0x0002
         .equiv IC7IF, 0x0001
         .equiv INT1IF, 0x0000

;------------------------------------------------------------------------------
;     IFS2 : Interrupt Flag Status Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LVDIF, 0x000A
         .equiv DCIIF, 0x0009

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv C2IF, 0x0006
         .equiv INT4IF, 0x0005
         .equiv INT3IF, 0x0004
         .equiv OC8IF, 0x0003
         .equiv OC7IF, 0x0002
         .equiv OC6IF, 0x0001
         .equiv OC5IF, 0x0000

;------------------------------------------------------------------------------
;     IEC0 : Interrupt Enable Control Register 0
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CNIE, 0x000F
         .equiv MI2CIE, 0x000E
         .equiv SI2CIE, 0x000D
         .equiv NVMIE, 0x000C
         .equiv ADIE, 0x000B
         .equiv U1TXIE, 0x000A
         .equiv U1RXIE, 0x0009
         .equiv SPI1IE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv T3IE, 0x0007
         .equiv T2IE, 0x0006
         .equiv OC2IE, 0x0005
         .equiv IC2IE, 0x0004
         .equiv T1IE, 0x0003
         .equiv OC1IE, 0x0002
         .equiv IC1IE, 0x0001
         .equiv INT0IE, 0x0000

;------------------------------------------------------------------------------
;     IEC1 : Interrupt Enable Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv IC6IE, 0x000F
         .equiv IC5IE, 0x000E
         .equiv IC4IE, 0x000D
         .equiv IC3IE, 0x000C
         .equiv C1IE, 0x000B
         .equiv SPI2IE, 0x000A
         .equiv U2TXIE, 0x0009
         .equiv U2RXIE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv INT2IE, 0x0007
         .equiv T5IE, 0x0006
         .equiv T4IE, 0x0005
         .equiv OC4IE, 0x0004
         .equiv OC3IE, 0x0003
         .equiv IC8IE, 0x0002
         .equiv IC7IE, 0x0001
         .equiv INT1IE, 0x0000

;------------------------------------------------------------------------------
;     IEC2 : Interrupt Enable Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LVDIE, 0x000A
         .equiv DCIIE, 0x0009

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv C2IE, 0x0006
         .equiv INT4IE, 0x0005
         .equiv INT3IE, 0x0004
         .equiv OC8IE, 0x0003
         .equiv OC7IE, 0x0002
         .equiv OC6IE, 0x0001
         .equiv OC5IE, 0x0000

;------------------------------------------------------------------------------
;     IPC0 : Interrupt Priority Control Register 0
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv T1IP2, 0x000E
         .equiv T1IP1, 0x000D
         .equiv T1IP0, 0x000C
         .equiv OC1IP2, 0x000A
         .equiv OC1IP1, 0x0009
         .equiv OC1IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IC1IP2, 0x0006
         .equiv IC1IP1, 0x0005
         .equiv IC1IP0, 0x0004
         .equiv INT0IP2, 0x0002
         .equiv INT0IP1, 0x0001
         .equiv INT0IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC1 : Interrupt Priority Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv T3IP2, 0x000E
         .equiv T3IP1, 0x000D
         .equiv T3IP0, 0x000C
         .equiv T2IP2, 0x000A
         .equiv T2IP1, 0x0009
         .equiv T2IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OC2IP2, 0x0006
         .equiv OC2IP1, 0x0005
         .equiv OC2IP0, 0x0004
         .equiv IC2IP2, 0x0002
         .equiv IC2IP1, 0x0001
         .equiv IC2IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC2 : Interrupt Priority Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ADIP2, 0x000E
         .equiv ADIP1, 0x000D
         .equiv ADIP0, 0x000C
         .equiv U1TXIP2, 0x000A
         .equiv U1TXIP1, 0x0009
         .equiv U1TXIP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv U1RXIP2, 0x0006
         .equiv U1RXIP1, 0x0005
         .equiv U1RXIP0, 0x0004
         .equiv SPI1IP2, 0x0002
         .equiv SPI1IP1, 0x0001
         .equiv SPI1IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC3 : Interrupt Priority Control Register 3
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CNIP2, 0x000E
         .equiv CNIP1, 0x000D
         .equiv CNIP0, 0x000C
         .equiv MI2CIP2, 0x000A
         .equiv MI2CIP1, 0x0009
         .equiv MI2CIP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SI2CIP2, 0x0006
         .equiv SI2CIP1, 0x0005
         .equiv SI2CIP0, 0x0004
         .equiv NVMIP2, 0x0002
         .equiv NVMIP1, 0x0001
         .equiv NVMIP0, 0x0000

;------------------------------------------------------------------------------
;     IPC4 : Interrupt Priority Control Register 4
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv OC3IP2, 0x000E
         .equiv OC3IP1, 0x000D
         .equiv OC3IP0, 0x000C
         .equiv IC8IP2, 0x000A
         .equiv IC8IP1, 0x0009
         .equiv IC8IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IC7IP2, 0x0006
         .equiv IC7IP1, 0x0005
         .equiv IC7IP0, 0x0004
         .equiv INT1IP2, 0x0002
         .equiv INT1IP1, 0x0001
         .equiv INT1IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC5 : Interrupt Priority Control Register 5
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv INT2IP2, 0x000E
         .equiv INT2IP1, 0x000D
         .equiv INT2IP0, 0x000C
         .equiv T5IP2, 0x000A
         .equiv T5IP1, 0x0009
         .equiv T5IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv T4IP2, 0x0006
         .equiv T4IP1, 0x0005
         .equiv T4IP0, 0x0004
         .equiv OC4IP2, 0x0002
         .equiv OC4IP1, 0x0001
         .equiv OC4IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC6 : Interrupt Priority Control Register 6
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv C1IP2, 0x000E
         .equiv C1IP1, 0x000D
         .equiv C1IP0, 0x000C
         .equiv SPI2IP2, 0x000A
         .equiv SPI2IP1, 0x0009
         .equiv SPI2IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv U2TXIP2, 0x0006
         .equiv U2TXIP1, 0x0005
         .equiv U2TXIP0, 0x0004
         .equiv U2RXIP2, 0x0002
         .equiv U2RXIP1, 0x0001
         .equiv U2RXIP0, 0x0000

;------------------------------------------------------------------------------
;     IPC7 : Interrupt Priority Control Register 7
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv IC6IP2, 0x000E
         .equiv IC6IP1, 0x000D
         .equiv IC6IP0, 0x000C
         .equiv IC5IP2, 0x000A
         .equiv IC5IP1, 0x0009
         .equiv IC5IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IC4IP2, 0x0006
         .equiv IC4IP1, 0x0005
         .equiv IC4IP0, 0x0004
         .equiv IC3IP2, 0x0002
         .equiv IC3IP1, 0x0001
         .equiv IC3IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC8 : Interrupt Priority Control Register 8
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv OC8IP2, 0x000E
         .equiv OC8IP1, 0x000D
         .equiv OC8IP0, 0x000C
         .equiv OC7IP2, 0x000A
         .equiv OC7IP1, 0x0009
         .equiv OC7IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OC6IP2, 0x0006
         .equiv OC6IP1, 0x0005
         .equiv OC6IP0, 0x0004
         .equiv OC5IP2, 0x0002
         .equiv OC5IP1, 0x0001
         .equiv OC5IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC9 : Interrupt Priority Control Register 9
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv C2IP2, 0x000A
         .equiv C2IP1, 0x0009
         .equiv C2IP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv INT4IP2, 0x0006
         .equiv INT4IP1, 0x0005
         .equiv INT4IP0, 0x0004
         .equiv INT3IP2, 0x0002
         .equiv INT3IP1, 0x0001
         .equiv INT3IP0, 0x0000

;------------------------------------------------------------------------------
;     IPC10 : Interrupt Priority Control Register 10
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LVDIP2, 0x000A
         .equiv LVDIP1, 0x0009
         .equiv LVDIP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv DCIIP2, 0x0006
         .equiv DCIIP1, 0x0005
         .equiv DCIIP0, 0x0004

;==============================================================================
;
; 3.  Input Change Notification Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 3a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv CNEN1L, _CNEN1                  ; See description for all
         .equiv CNEN1H, _CNEN1+1                ;  registers in sub-section below
         .equiv CNEN2L, _CNEN2
         .equiv CNEN2H, _CNEN2+1
         .equiv CNPU1L, _CNPU1
         .equiv CNPU1H, _CNPU1+1
         .equiv CNPU2L, _CNPU2
         .equiv CNPU2H, _CNPU2+1

;------------------------------------------------------------------------------
; 3b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     CNEN1 : Input Change Notification Interrupt Enable Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CN15IE, 0x000F
         .equiv CN14IE, 0x000E
         .equiv CN13IE, 0x000D
         .equiv CN12IE, 0x000C
         .equiv CN11IE, 0x000B
         .equiv CN10IE, 0x000A
         .equiv CN9IE, 0x0009
         .equiv CN8IE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CN7IE, 0x0007
         .equiv CN6IE, 0x0006
         .equiv CN5IE, 0x0005
         .equiv CN4IE, 0x0004
         .equiv CN3IE, 0x0003
         .equiv CN2IE, 0x0002
         .equiv CN1IE, 0x0001
         .equiv CN0IE, 0x0000

;------------------------------------------------------------------------------
;     CNEN2 : Input Change Notification Interrupt Enable Register 2
;------------------------------------------------------------------------------
; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CN23IE, 0x0007
         .equiv CN22IE, 0x0006
         .equiv CN21IE, 0x0005
         .equiv CN20IE, 0x0004
         .equiv CN19IE, 0x0003
         .equiv CN18IE, 0x0002
         .equiv CN17IE, 0x0001
         .equiv CN16IE, 0x0000

;------------------------------------------------------------------------------
;     CNPU1 : Input Change Notification Pullup Enable Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CN15PUE, 0x000F
         .equiv CN14PUE, 0x000E
         .equiv CN13PUE, 0x000D
         .equiv CN12PUE, 0x000C
         .equiv CN11PUE, 0x000B
         .equiv CN10PUE, 0x000A
         .equiv CN9PUE, 0x0009
         .equiv CN8PUE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CN7PUE, 0x0007
         .equiv CN6PUE, 0x0006
         .equiv CN5PUE, 0x0005
         .equiv CN4PUE, 0x0004
         .equiv CN3PUE, 0x0003
         .equiv CN2PUE, 0x0002
         .equiv CN1PUE, 0x0001
         .equiv CN0PUE, 0x0000

;------------------------------------------------------------------------------
;     CNPU2 : Input Change Notification Pullup Enable Register 2
;------------------------------------------------------------------------------
; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CN23PUE, 0x0007
         .equiv CN22PUE, 0x0006
         .equiv CN21PUE, 0x0005
         .equiv CN20PUE, 0x0004
         .equiv CN19PUE, 0x0003
         .equiv CN18PUE, 0x0002
         .equiv CN17PUE, 0x0001
         .equiv CN16PUE, 0x0000


;==============================================================================
;
; 4.  Timer Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 4a. SFR Definitions
;------------------------------------------------------------------------------

;---------------Timer 1 Module-------------------------------------------------
         .equiv TMR1L, _TMR1
         .equiv TMR1H, _TMR1+1
         .equiv PR1L, _PR1
         .equiv PR1H, _PR1+1
         .equiv T1CONL, _T1CON                  ; See TxCON description in
         .equiv T1CONH, _T1CON+1                ;  sub-section below

;---------------Timer2/3 Module------------------------------------------------
         .equiv TMR2L, _TMR2
         .equiv TMR2H, _TMR2+1
         .equiv TMR3HLDL, _TMR3HLD
         .equiv TMR3HLDH, _TMR3HLD+1
         .equiv TMR3L, _TMR3
         .equiv TMR3H, _TMR3+1
         .equiv PR2L, _PR2
         .equiv PR2H, _PR2+1
         .equiv PR3L, _PR3
         .equiv PR3H, _PR3+1
         .equiv T2CONL, _T2CON                  ; See TxCON description in
         .equiv T2CONH, _T2CON+1                ;  sub-section below
         .equiv T3CONL, _T3CON                  ; - do -
         .equiv T3CONH, _T3CON+1

;-------------- Timer4/5 Module------------------------------------------------
         .equiv TMR4L, _TMR4
         .equiv TMR4H, _TMR4+1
         .equiv TMR5HLDL, _TMR5HLD
         .equiv TMR5HLDH, _TMR5HLD+1
         .equiv TMR5L, _TMR5
         .equiv TMR5H, _TMR5+1
         .equiv PR4L, _PR4
         .equiv PR4H, _PR4+1
         .equiv PR5L, _PR5
         .equiv PR5H, _PR5+1
         .equiv T4CONL, _T4CON                  ; See TxCON description in
         .equiv T4CONH, _T4CON+1                ;  sub-section below
         .equiv T5CONL, _T5CON                  ; - do -
         .equiv T5CONH, _T5CON+1

;-------------------------------------------------------------------------------
; 4b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TxCON : Timer x Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TON, 0x000F
         .equiv TSIDL, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TGATE, 0x0006
         .equiv TCKPS1, 0x0005
         .equiv TCKPS0, 0x0004
         .equiv T32, 0x0003        ;T32 present only in T2CON and T4CON
         .equiv TSYNC, 0x0002
         .equiv TCS, 0x0001

;==============================================================================
;
; 5.  Input Capture Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 5a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv IC1BUFL, _IC1BUF
         .equiv IC1BUFH, _IC1BUF+1
         .equiv IC1CONL, _IC1CON                ; See ICxCON description in
         .equiv IC1CONH, _IC1CON+1              ;  sub-section below
         .equiv IC2BUFL, _IC2BUF
         .equiv IC2BUFH, _IC2BUF+1
         .equiv IC2CONL, _IC2CON                ; See ICxCON description in
         .equiv IC2CONH, _IC2CON+1              ;  sub-section below
         .equiv IC3BUFL, _IC3BUF
         .equiv IC3BUFH, _IC3BUF+1
         .equiv IC3CONL, _IC3CON                ; See ICxCON description in
         .equiv IC3CONH, _IC3CON+1              ;  sub-section below
         .equiv IC4BUFL, _IC4BUF
         .equiv IC4BUFH, _IC4BUF+1
         .equiv IC4CONL, _IC4CON                ; See ICxCON description in
         .equiv IC4CONH, _IC4CON+1              ;  sub-section below
         .equiv IC5BUFL, _IC5BUF
         .equiv IC5BUFH, _IC5BUF+1
         .equiv IC5CONL, _IC5CON                ; See ICxCON description in
         .equiv IC5CONH, _IC5CON+1              ;  sub-section below
         .equiv IC6BUFL, _IC6BUF
         .equiv IC6BUFH, _IC6BUF+1
         .equiv IC6CONL, _IC6CON                ; See ICxCON description in
         .equiv IC6CONH, _IC6CON+1              ;  sub-section below
         .equiv IC7BUFL, _IC7BUF
         .equiv IC7BUFH, _IC7BUF+1
         .equiv IC7CONL, _IC7CON                ; See ICxCON description in
         .equiv IC7CONH, _IC7CON+1              ;  sub-section below
         .equiv IC8BUFL, _IC8BUF
         .equiv IC8BUFH, _IC8BUF+1
         .equiv IC8CONL, _IC8CON                ; See ICxCON description in
         .equiv IC8CONH, _IC8CON+1              ;  sub-section below
;------------------------------------------------------------------------------
; 5b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     ICxCON : Input Capture x Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ICSIDL, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv ICTMR, 0x0007
         .equiv ICI1, 0x0006
         .equiv ICI0, 0x0005
         .equiv ICOV, 0x0004
         .equiv ICBNE, 0x0003
         .equiv ICM2, 0x0002
         .equiv ICM1, 0x0001
         .equiv ICM0, 0x0000


;==============================================================================
;
; 6.  Output Compare Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 6a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv OC1RSL, _OC1RS
         .equiv OC1RSH, _OC1RS+1
         .equiv OC1RL, _OC1R
         .equiv OC1RH, _OC1R+1
         .equiv OC1CONL, _OC1CON                ; See OCxCON description in
         .equiv OC1CONH, _OC1CON+1              ;  sub-section below
         .equiv OC2RSL, _OC2RS
         .equiv OC2RSH, _OC2RS+1
         .equiv OC2RL, _OC2R
         .equiv OC2RH, _OC2R+1
         .equiv OC2CONL, _OC2CON                ; See OCxCON description in
         .equiv OC2CONH, _OC2CON+1              ;  sub-section below
         .equiv OC3RSL, _OC3RS
         .equiv OC3RSH, _OC3RS+1
         .equiv OC3RL, _OC3R
         .equiv OC3RH, _OC3R+1
         .equiv OC3CONL, _OC3CON                ; See OCxCON description in
         .equiv OC3CONH, _OC3CON+1              ;  sub-section below
         .equiv OC4RSL, _OC4RS
         .equiv OC4RSH, _OC4RS+1
         .equiv OC4RL, _OC4R
         .equiv OC4RH, _OC4R+1
         .equiv OC4CONL, _OC4CON                ; See OCxCON description in
         .equiv OC4CONH, _OC4CON+1              ;  sub-section below
         .equiv OC5RSL, _OC5RS
         .equiv OC5RSH, _OC5RS+1
         .equiv OC5RL, _OC5R
         .equiv OC5RH, _OC5R+1
         .equiv OC5CONL, _OC5CON                ; See OCxCON description in
         .equiv OC5CONH, _OC5CON+1              ;  sub-section below
         .equiv OC6RSL, _OC6RS
         .equiv OC6RSH, _OC6RS+1
         .equiv OC6RL, _OC6R
         .equiv OC6RH, _OC6R+1
         .equiv OC6CONL, _OC6CON                ; See OCxCON description in
         .equiv OC6CONH, _OC6CON+1              ;  sub-section below
         .equiv OC7RSL, _OC7RS
         .equiv OC7RSH, _OC7RS+1
         .equiv OC7RL, _OC7R
         .equiv OC7RH, _OC7R+1
         .equiv OC7CONL, _OC7CON                ; See OCxCON description in
         .equiv OC7CONH, _OC7CON+1              ;  sub-section below
         .equiv OC8RSL, _OC8RS
         .equiv OC8RSH, _OC8RS+1
         .equiv OC8RL, _OC8R
         .equiv OC8RH, _OC8R+1
         .equiv OC8CONL, _OC8CON                ; See OCxCON description in
         .equiv OC8CONH, _OC8CON+1              ;  sub-section below

;------------------------------------------------------------------------------
; 6b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     OCxCON : Output Compare x Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv OCSIDL, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OCFLT, 0x0004
         .equiv OCTSEL, 0x0003
         .equiv OCM2, 0x0002
         .equiv OCM1, 0x0001
         .equiv OCM0, 0x0000

;==============================================================================
;
; 7. Inter-Integrated Circuit(I2C) Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 7a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv I2CRCVL, _I2CRCV
         .equiv I2CRCVH, _I2CRCV+1
         .equiv I2CTRNL, _I2CTRN
         .equiv I2CTRNH, _I2CTRN+1
         .equiv I2CBRGL, _I2CBRG
         .equiv I2CBRGH, _I2CBRG+1
         .equiv I2CCONL, _I2CCON                ; See I2CCON description in
         .equiv I2CCONH, _I2CCON+1              ;  section 9b
         .equiv I2CSTATL, _I2CSTAT              ; See I2CSTAT description in
         .equiv I2CSTATH, _I2CSTAT+1            ;  section 9b
         .equiv I2CADDL, _I2CADD
         .equiv I2CADDH, _I2CADD+1

;------------------------------------------------------------------------------
; 7b. Bit Position Definitions for some SFRs

;------------------------------------------------------------------------------
;     I2CCON : I2C Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv I2CEN, 0x000F
         .equiv I2CSIDL, 0x000D
         .equiv SCLREL, 0x000C
         .equiv IPMIEN, 0x000B
         .equiv A10M, 0x000A
         .equiv DISSLW, 0x0009
         .equiv SMEN, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv GCEN, 0x0007
         .equiv STREN, 0x0006
         .equiv ACKDT, 0x0005
         .equiv ACKEN, 0x0004
         .equiv RCEN, 0x0003
         .equiv PEN, 0x0002
         .equiv RSEN, 0x0001
         .equiv SEN, 0x0000

;------------------------------------------------------------------------------
;     I2CSTAT : I2C Status Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ACKSTAT, 0x000F
         .equiv TRSTAT, 0x000E
         .equiv BCL, 0x000A
         .equiv GCSTAT, 0x0009
         .equiv ADD10, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IWCOL, 0x0007
         .equiv I2COV, 0x0006
         .equiv D_A, 0x0005
         .equiv P, 0x0004
         .equiv S, 0x0003
         .equiv R_W, 0x0002
         .equiv RBF, 0x0001
         .equiv TBF, 0x0000


;==============================================================================
;
; 8. UARTx Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 8a. SFR Definitions
;------------------------------------------------------------------------------
;------------------UART 1 Module-----------------------------------------------
         .equiv U1MODEL, _U1MODE                ; See UxMODE description in
         .equiv U1MODEH, _U1MODE+1              ;  sub-section below
         .equiv U1STAL, _U1STA                  ; See UxSTA description in
         .equiv U1STAH, _U1STA+1                ;  sub-section below
         .equiv U1TXREGL, _U1TXREG
         .equiv U1TXREGH, _U1TXREG+1
         .equiv U1RXREGL, _U1RXREG
         .equiv U1RXREGH, _U1RXREG+1
         .equiv U1BRGL, _U1BRG
         .equiv U1BRGH, _U1BRG+1

;-------------------UART 2 Module----------------------------------------------
         .equiv U2MODEL, _U2MODE                ; See UxMODE description in
         .equiv U2MODEH, _U2MODE+1              ;  sub-section below
         .equiv U2STAL, _U2STA                  ; See UxSTA description in
         .equiv U2STAH, _U2STA+1                ;  sub-section below
         .equiv U2TXREGL, _U2TXREG
         .equiv U2TXREGH, _U2TXREG+1
         .equiv U2RXREGL, _U2RXREG
         .equiv U2RXREGH, _U2RXREG+1
         .equiv U2BRGL, _U2BRG
         .equiv U2BRGH, _U2BRG+1

;------------------------------------------------------------------------------
; 8b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     UxMODE : UART x Mode Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv UARTEN, 0x000F
         .equiv USIDL, 0x000D
         .equiv ALTIO, 0x000A


; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv WAKE, 0x0007
         .equiv LPBACK, 0x0006
         .equiv ABAUD, 0x0005
         .equiv PDSEL1, 0x0002
         .equiv PDSEL0, 0x0001
         .equiv STSEL, 0x0000

;------------------------------------------------------------------------------
;     UxSTA : UART x Status and Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv UTXISEL, 0x000F
         .equiv UTXBRK, 0x000B
         .equiv UTXEN, 0x000A
         .equiv UTXBF, 0x0009
         .equiv TRMT, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv URXISEL1, 0x0007
         .equiv URXISEL0, 0x0006
         .equiv ADDEN, 0x0005
         .equiv RIDLE, 0x0004
         .equiv PERR, 0x0003
         .equiv FERR, 0x0002
         .equiv OERR, 0x0001
         .equiv URXDA, 0x0000


;==============================================================================
;
; 9. Serial Peripheral Interface Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.      (SPIx)
;==============================================================================
; 9a. SFR Definitions
;------------------------------------------------------------------------------
;------------------SPI 1 Module------------------------------------------------
         .equiv SPI1STATL, _SPI1STAT    ; See SPIxSTAT description in
         .equiv SPI1STATH, _SPI1STAT+1  ;  sub-section below
         .equiv SPI1CONL, _SPI1CON      ; See SPIxCON description in
         .equiv SPI1CONH, _SPI1CON+1    ;  sub-section below
         .equiv SPI1BUFL, _SPI1BUF
         .equiv SPI1BUFH, _SPI1BUF+1

;------------------SPI 2 Module------------------------------------------------
         .equiv SPI2STATL, _SPI2STAT    ; See SPIxSTAT description in
         .equiv SPI2STATH, _SPI2STAT+1  ;  sub-section below
         .equiv SPI2CONL, _SPI2CON      ; See SPIxCON description in
         .equiv SPI2CONH, _SPI2CON+1    ;  sub-section below
         .equiv SPI2BUFL, _SPI2BUF
         .equiv SPI2BUFH, _SPI2BUF+1

;------------------------------------------------------------------------------
; 9b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     SPIxSTAT : SPI x Status register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv SPIEN, 0x000F
         .equiv SPISIDL, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SPIROV, 0x0006
         .equiv SPITBF, 0x0001
         .equiv SPIRBF, 0x0000


;------------------------------------------------------------------------------
;     SPIxCON : SPI x Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv FRMEN, 0x000E
         .equiv SPIFSD, 0x000D
         .equiv DISSDO, 0x000B
         .equiv MODE16, 0x000A
         .equiv SMP, 0x0009
         .equiv CKE, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SSEN, 0x0007
         .equiv CKP, 0x0006
         .equiv MSTEN, 0x0005
         .equiv SPRE2, 0x0004
         .equiv SPRE1, 0x0003
         .equiv SPRE0, 0x0002
         .equiv PPRE1, 0x0001
         .equiv PPRE0, 0x0000


;==============================================================================
;
; 10. Codec/Data Converter Interface Module SFRs and Associated Bits Definition
;      (DCI)
;==============================================================================
;------------------------------------------------------------------------------
;     DCICON1 : Data Converter/Codec Interface Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv DCIEN, 0x000F
         .equiv DCISIDL, 0x000D
         .equiv DLOOP, 0x000B
         .equiv CSCKD, 0x000A
         .equiv CSCKE, 0x0009
         .equiv COFSD, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv UNFM, 0x0007
         .equiv CSDOM, 0x0006
         .equiv DJST, 0x0005
         .equiv COFSM1, 0x0001
         .equiv COFSM0, 0x0000

;------------------------------------------------------------------------------
;     DCICON2 : Data Converter/Codec Interface Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv BLEN1, 0x000B
         .equiv BLEN0, 0x000A
         .equiv COFSG3, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv COFSG2, 0x0007
         .equiv COFSG1, 0x0006
         .equiv COFSG0, 0x0005
         .equiv WS3, 0x0003
         .equiv WS2, 0x0002
         .equiv WS1, 0x0001
         .equiv WS0, 0x0000

;------------------------------------------------------------------------------
;     DCICON3 : Data Converter/Codec Interface Control Register 3
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv BCG11, 0x000B
         .equiv BCG10, 0x000A
         .equiv BCG9, 0x0009
         .equiv BCG8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv BCG7, 0x0007
         .equiv BCG6, 0x0006
         .equiv BCG5, 0x0005
         .equiv BCG4, 0x0004
         .equiv BCG3, 0x0003
         .equiv BCG2, 0x0002
         .equiv BCG1, 0x0001
         .equiv BCG0, 0x0000

;------------------------------------------------------------------------------
;     DCISTAT : Data Converter/Codec Interface Status Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv SLOT3, 0x000B
         .equiv SLOT2, 0x000A
         .equiv SLOT1, 0x0009
         .equiv SLOT0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv ROV, 0x0003
         .equiv RFUL, 0x0002
         .equiv TUNF, 0x0001
         .equiv TMPTY, 0x0000

;------------------------------------------------------------------------------
;     TSCON : Transmit Slot Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TSE15, 0x000F
         .equiv TSE14, 0x000E
         .equiv TSE13, 0x000D
         .equiv TSE12, 0x000C
         .equiv TSE11, 0x000B
         .equiv TSE10, 0x000A
         .equiv TSE9, 0x0009
         .equiv TSE8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TSE7, 0x0007
         .equiv TSE6, 0x0006
         .equiv TSE5, 0x0005
         .equiv TSE4, 0x0004
         .equiv TSE3, 0x0003
         .equiv TSE2, 0x0002
         .equiv TSE1, 0x0001
         .equiv TSE0, 0x0000

;------------------------------------------------------------------------------
;     RSCON : Receive Slot Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RSE15, 0x000F
         .equiv RSE14, 0x000E
         .equiv RSE13, 0x000D
         .equiv RSE12, 0x000C
         .equiv RSE11, 0x000B
         .equiv RSE10, 0x000A
         .equiv RSE9, 0x0009
         .equiv RSE8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RSE7, 0x0007
         .equiv RSE6, 0x0006
         .equiv RSE5, 0x0005
         .equiv RSE4, 0x0004
         .equiv RSE3, 0x0003
         .equiv RSE2, 0x0002
         .equiv RSE1, 0x0001
         .equiv RSE0, 0x0000


;==============================================================================
;
; 11.  A/D Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 11a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv ADCBUF0L, _ADCBUF0
         .equiv ADCBUF0H, _ADCBUF0+1
         .equiv ADCBUF1L, _ADCBUF1
         .equiv ADCBUF1H, _ADCBUF1+1
         .equiv ADCBUF2L, _ADCBUF2
         .equiv ADCBUF2H, _ADCBUF2+1
         .equiv ADCBUF3L, _ADCBUF3
         .equiv ADCBUF3H, _ADCBUF3+1
         .equiv ADCBUF4L, _ADCBUF4
         .equiv ADCBUF4H, _ADCBUF4+1
         .equiv ADCBUF5L, _ADCBUF5
         .equiv ADCBUF5H, _ADCBUF5+1
         .equiv ADCBUF6L, _ADCBUF6
         .equiv ADCBUF6H, _ADCBUF6+1
         .equiv ADCBUF7L, _ADCBUF7
         .equiv ADCBUF7H, _ADCBUF7+1
         .equiv ADCBUF8L, _ADCBUF8
         .equiv ADCBUF8H, _ADCBUF8+1
         .equiv ADCBUF9L, _ADCBUF9
         .equiv ADCBUF9H, _ADCBUF9+1
         .equiv ADCBUFAL, _ADCBUFA
         .equiv ADCBUFAH, _ADCBUFA+1
         .equiv ADCBUFBL, _ADCBUFB
         .equiv ADCBUFBH, _ADCBUFB+1
         .equiv ADCBUFCL, _ADCBUFC
         .equiv ADCBUFCH, _ADCBUFC+1
         .equiv ADCBUFDL, _ADCBUFD
         .equiv ADCBUFDH, _ADCBUFD+1
         .equiv ADCBUFEL, _ADCBUFE
         .equiv ADCBUFEH, _ADCBUFE+1
         .equiv ADCBUFFL, _ADCBUFF
         .equiv ADCBUFFH, _ADCBUFF+1
         .equiv ADCON1L, _ADCON1                ; See ADCON1L through ADPCFGH
         .equiv ADCON1H, _ADCON1+1              ;  description in sub-section below
         .equiv ADCON2L, _ADCON2
         .equiv ADCON2H, _ADCON2+1
         .equiv ADCON3L, _ADCON3
         .equiv ADCON3H, _ADCON3+1
         .equiv ADCHSL, _ADCHS
         .equiv ADCHSH, _ADCHS+1
         .equiv ADPCFGL, _ADPCFG
         .equiv ADPCFGH, _ADPCFG+1
         .equiv ADCSSLL, _ADCSSL
         .equiv ADCSSLH, _ADCSSL+1

;------------------------------------------------------------------------------
; 11b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     ADCON1 : A/D Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ADON, 0x000F
         .equiv ADSIDL, 0x000D
         .equiv FORM1, 0x0009
         .equiv FORM0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SSRC2, 0x0007
         .equiv SSRC1, 0x0006
         .equiv SSRC0, 0x0005
         .equiv ASAM, 0x0002
         .equiv SAMP, 0x0001
         .equiv CONV, 0x0000

;------------------------------------------------------------------------------
;     ADCON2 : A/D Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv VCFG2, 0x000F
         .equiv VCFG1, 0x000E
         .equiv VCFG0, 0x000D
         .equiv CSCNA, 0x000A

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv BUFS, 0x0007
         .equiv SMPI3, 0x0005
         .equiv SMPI2, 0x0004
         .equiv SMPI1, 0x0003
         .equiv SMPI0, 0x0002
         .equiv BUFM, 0x0001
         .equiv ALTS, 0x0000

;------------------------------------------------------------------------------
;     ADCON3 : A/D Control Register 3
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv SAMC4, 0x000C
         .equiv SAMC3, 0x000B
         .equiv SAMC2, 0x000A
         .equiv SAMC1, 0x0009
         .equiv SAMC0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv ADRC, 0x0007
         .equiv ADCS5, 0x0005
         .equiv ADCS4, 0x0004
         .equiv ADCS3, 0x0003
         .equiv ADCS2, 0x0002
         .equiv ADCS1, 0x0001
         .equiv ADCS0, 0x0000

;------------------------------------------------------------------------------
;     ADCHS : A/D Input Channel Select Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CH0NB, 0x000C
         .equiv CH0SB3, 0x000B
         .equiv CH0SB2, 0x000A
         .equiv CH0SB1, 0x0009
         .equiv CH0SB0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CH0NA, 0x0004
         .equiv CH0SA3, 0x0003
         .equiv CH0SA2, 0x0002
         .equiv CH0SA1, 0x0001
         .equiv CH0SA0, 0x0000

;------------------------------------------------------------------------------
;     ADCSSL : A/D Input Scan Select Register ;SFR present only in 12-bit ADC
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CSSL15, 0x000F
         .equiv CSSL14, 0x000E
         .equiv CSSL13, 0x000D
         .equiv CSSL12, 0x000C
         .equiv CSSL11, 0x000B
         .equiv CSSL10, 0x000A
         .equiv CSSL9, 0x0009
         .equiv CSSL8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv CSSL7, 0x0007
         .equiv CSSL6, 0x0006
         .equiv CSSL5, 0x0005
         .equiv CSSL4, 0x0004
         .equiv CSSL3, 0x0003
         .equiv CSSL2, 0x0002
         .equiv CSSL1, 0x0001
         .equiv CSSL0, 0x0000

;------------------------------------------------------------------------------
;     ADPCFG : A/D Port Configuration Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv PCFG15, 0x000F
         .equiv PCFG14, 0x000E
         .equiv PCFG13, 0x000D
         .equiv PCFG12, 0x000C
         .equiv PCFG11, 0x000B
         .equiv PCFG10, 0x000A
         .equiv PCFG9, 0x0009
         .equiv PCFG8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv PCFG7, 0x0007
         .equiv PCFG6, 0x0006
         .equiv PCFG5, 0x0005
         .equiv PCFG4, 0x0004
         .equiv PCFG3, 0x0003
         .equiv PCFG2, 0x0002
         .equiv PCFG1, 0x0001
         .equiv PCFG0, 0x0000



;==============================================================================
;
; 12.  Port A: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 12a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISAL, _TRISA                  ; See all SFR descriptions in
         .equiv TRISAH, _TRISA+1                ;  sub-section below
         .equiv PORTAL, _PORTA
         .equiv PORTAH, _PORTA+1
         .equiv LATAL, _LATA
         .equiv LATAH, _LATA+1

;------------------------------------------------------------------------------
; 12b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISA : Port A Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISA15, 0x000F
         .equiv TRISA14, 0x000E
         .equiv TRISA13, 0x000D
         .equiv TRISA12, 0x000C
         .equiv TRISA10, 0x000A
         .equiv TRISA9, 0x0009

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISA7, 0x0007
         .equiv TRISA6, 0x0006


;------------------------------------------------------------------------------
;     PORTA : Read Port A Pin / Write Port A Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RA15, 0x000F
         .equiv RA14, 0x000E
         .equiv RA13, 0x000D
         .equiv RA12, 0x000C
         .equiv RA10, 0x000A
         .equiv RA9, 0x0009

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RA7, 0x0007
         .equiv RA6, 0x0006

;------------------------------------------------------------------------------
;     LATA : Read / Write Port A Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATA15, 0x000F
         .equiv LATA14, 0x000E
         .equiv LATA13, 0x000D
         .equiv LATA12, 0x000C
         .equiv LATA10, 0x000A
         .equiv LATA9, 0x0009

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATA7, 0x0007
         .equiv LATA6, 0x0006

;==============================================================================
;
; 13.  Port B: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 13a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISBL, _TRISB                  ; See all SFR descriptions in
         .equiv TRISBH, _TRISB+1                ;  sub-section below
         .equiv PORTBL, _PORTB
         .equiv PORTBH, _PORTB+1
         .equiv LATBL, _LATB
         .equiv LATBH, _LATB+1

;------------------------------------------------------------------------------
; 13b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISB : Port B Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISB15, 0x000F
         .equiv TRISB14, 0x000E
         .equiv TRISB13, 0x000D
         .equiv TRISB12, 0x000C
         .equiv TRISB11, 0x000B
         .equiv TRISB10, 0x000A
         .equiv TRISB9, 0x0009
         .equiv TRISB8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISB7, 0x0007
         .equiv TRISB6, 0x0006
         .equiv TRISB5, 0x0005
         .equiv TRISB4, 0x0004
         .equiv TRISB3, 0x0003
         .equiv TRISB2, 0x0002
         .equiv TRISB1, 0x0001
         .equiv TRISB0, 0x0000

;------------------------------------------------------------------------------
;     PORTB : Read Port B Pin / Write Port B Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RB15, 0x000F
         .equiv RB14, 0x000E
         .equiv RB13, 0x000D
         .equiv RB12, 0x000C
         .equiv RB11, 0x000B
         .equiv RB10, 0x000A
         .equiv RB9, 0x0009
         .equiv RB8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RB7, 0x0007
         .equiv RB6, 0x0006
         .equiv RB5, 0x0005
         .equiv RB4, 0x0004
         .equiv RB3, 0x0003
         .equiv RB2, 0x0002
         .equiv RB1, 0x0001
         .equiv RB0, 0x0000

;------------------------------------------------------------------------------
;     LATB : Read / Write Port B Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATB15, 0x000F
         .equiv LATB14, 0x000E
         .equiv LATB13, 0x000D
         .equiv LATB12, 0x000C
         .equiv LATB11, 0x000B
         .equiv LATB10, 0x000A
         .equiv LATB9, 0x0009
         .equiv LATB8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATB7, 0x0007
         .equiv LATB6, 0x0006
         .equiv LATB5, 0x0005
         .equiv LATB4, 0x0004
         .equiv LATB3, 0x0003
         .equiv LATB2, 0x0002
         .equiv LATB1, 0x0001
         .equiv LATB0, 0x0000

;==============================================================================
;
; 14.  Port C: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 14a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISCL, _TRISC                  ; See all SFR descriptions in
         .equiv TRISCH, _TRISC+1                ;  sub-section below
         .equiv PORTCL, _PORTC
         .equiv PORTCH, _PORTC+1
         .equiv LATCL, _LATC
         .equiv LATCH, _LATC+1

;------------------------------------------------------------------------------
; 14b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISC : Port C Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISC15, 0x000F
         .equiv TRISC14, 0x000E
         .equiv TRISC13, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISC4, 0x0004
         .equiv TRISC3, 0x0003
         .equiv TRISC2, 0x0002
         .equiv TRISC1, 0x0001

;------------------------------------------------------------------------------
;     PORTC : Read Port C Pin / Write Port C Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RC15, 0x000F
         .equiv RC14, 0x000E
         .equiv RC13, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RC4, 0x0004
         .equiv RC3, 0x0003
         .equiv RC2, 0x0002
         .equiv RC1, 0x0001

;------------------------------------------------------------------------------
;     LATC : Read / Write Port C Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATC15, 0x000F
         .equiv LATC14, 0x000E
         .equiv LATC13, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATC4, 0x0004
         .equiv LATC3, 0x0003
         .equiv LATC2, 0x0002
         .equiv LATC1, 0x0001

;==============================================================================
;
; 15.  Port D: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 15a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISDL, _TRISD                  ; See all SFR descriptions in
         .equiv TRISDH, _TRISD+1                ;  sub-section below
         .equiv PORTDL, _PORTD
         .equiv PORTDH, _PORTD+1
         .equiv LATDL, _LATD
         .equiv LATDH, _LATD+1

;------------------------------------------------------------------------------
; 15b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISD : Port D Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISD15, 0x000F
         .equiv TRISD14, 0x000E
         .equiv TRISD13, 0x000D
         .equiv TRISD12, 0x000C
         .equiv TRISD11, 0x000B
         .equiv TRISD10, 0x000A
         .equiv TRISD9, 0x0009
         .equiv TRISD8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISD7, 0x0007
         .equiv TRISD6, 0x0006
         .equiv TRISD5, 0x0005
         .equiv TRISD4, 0x0004
         .equiv TRISD3, 0x0003
         .equiv TRISD2, 0x0002
         .equiv TRISD1, 0x0001
         .equiv TRISD0, 0x0000

;------------------------------------------------------------------------------
;     PORTD : Read Port D Pin / Write Port D Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RD15, 0x000F
         .equiv RD14, 0x000E
         .equiv RD13, 0x000D
         .equiv RD12, 0x000C
         .equiv RD11, 0x000B
         .equiv RD10, 0x000A
         .equiv RD9, 0x0009
         .equiv RD8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RD7, 0x0007
         .equiv RD6, 0x0006
         .equiv RD5, 0x0005
         .equiv RD4, 0x0004
         .equiv RD3, 0x0003
         .equiv RD2, 0x0002
         .equiv RD1, 0x0001
         .equiv RD0, 0x0000

;------------------------------------------------------------------------------
;     LATD : Read / Write Port D Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATD15, 0x000F
         .equiv LATD14, 0x000E
         .equiv LATD13, 0x000D
         .equiv LATD12, 0x000C
         .equiv LATD11, 0x000B
         .equiv LATD10, 0x000A
         .equiv LATD9, 0x0009
         .equiv LATD8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATD7, 0x0007
         .equiv LATD6, 0x0006
         .equiv LATD5, 0x0005
         .equiv LATD4, 0x0004
         .equiv LATD3, 0x0003
         .equiv LATD2, 0x0002
         .equiv LATD1, 0x0001
         .equiv LATD0, 0x0000

;==============================================================================
;
; 16.  Port F: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 16a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISFL, _TRISF                  ; See all SFR descriptions in
         .equiv TRISFH, _TRISF+1                ;  sub-section below
         .equiv PORTFL, _PORTF
         .equiv PORTFH, _PORTF+1
         .equiv LATFL, _LATF
         .equiv LATFH, _LATF+1

;------------------------------------------------------------------------------
; 16b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISF : Port F Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISF8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISF7, 0x0007
         .equiv TRISF6, 0x0006
         .equiv TRISF5, 0x0005
         .equiv TRISF4, 0x0004
         .equiv TRISF3, 0x0003
         .equiv TRISF2, 0x0002
         .equiv TRISF1, 0x0001
         .equiv TRISF0, 0x0000

;------------------------------------------------------------------------------
;     PORTF : Read Port F Pin / Write Port F Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RF8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RF7, 0x0007
         .equiv RF6, 0x0006
         .equiv RF5, 0x0005
         .equiv RF4, 0x0004
         .equiv RF3, 0x0003
         .equiv RF2, 0x0002
         .equiv RF1, 0x0001
         .equiv RF0, 0x0000

;------------------------------------------------------------------------------
;     LATF : Read / Write Port F Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATF8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATF7, 0x0007
         .equiv LATF6, 0x0006
         .equiv LATF5, 0x0005
         .equiv LATF4, 0x0004
         .equiv LATF3, 0x0003
         .equiv LATF2, 0x0002
         .equiv LATF1, 0x0001
         .equiv LATF0, 0x0000

;==============================================================================
;
; 17.  Port G: General Purpose I/O Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 17a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv TRISGL, _TRISG                  ; See all SFR descriptions in
         .equiv TRISGH, _TRISG+1                ;  sub-section below
         .equiv PORTGL, _PORTG
         .equiv PORTGH, _PORTG+1
         .equiv LATGL, _LATG
         .equiv LATGH, _LATG+1


;------------------------------------------------------------------------------
; 17b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     TRISG : Port G Data Direction Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRISG15, 0x000F
         .equiv TRISG14, 0x000E
         .equiv TRISG13, 0x000D
         .equiv TRISG12, 0x000C
         .equiv TRISG9, 0x0009
         .equiv TRISG8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TRISG7, 0x0007
         .equiv TRISG6, 0x0006
         .equiv TRISG3, 0x0003
         .equiv TRISG2, 0x0002
         .equiv TRISG1, 0x0001
         .equiv TRISG0, 0x0000

;------------------------------------------------------------------------------
;     PORTG : Read Port G Pin / Write Port G Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RG15, 0x000F
         .equiv RG14, 0x000E
         .equiv RG13, 0x000D
         .equiv RG12, 0x000C
         .equiv RG9, 0x0009
         .equiv RG8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RG7, 0x0007
         .equiv RG6, 0x0006
         .equiv RG3, 0x0003
         .equiv RG2, 0x0002
         .equiv RG1, 0x0001
         .equiv RG0, 0x0000

;------------------------------------------------------------------------------
;     LATG : Read / Write Port G Latch Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv LATG15, 0x000F
         .equiv LATG14, 0x000E
         .equiv LATG13, 0x000D
         .equiv LATG12, 0x000C
         .equiv LATG9, 0x0009
         .equiv LATG8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv LATG7, 0x0007
         .equiv LATG6, 0x0006
         .equiv LATG3, 0x0003
         .equiv LATG2, 0x0002
         .equiv LATG1, 0x0001
         .equiv LATG0, 0x0000


;==============================================================================
;
; 18. Controller Area Network (CAN) Module Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.      for CAN Modules 1 and 2
;
;==============================================================================
; 18a. SFR Definitions
;------------------------------------------------------------------------------
;-------------CAN1 Module------------------------------------------------------
         .equiv C1RXF0SIDL, _C1RXF0SID          ; See all SFR descriptions in
         .equiv C1RXF0SIDH, _C1RXF0SID+1        ;  sub-section below
         .equiv C1RXF0EIDL, _C1RXF0EID
         .equiv C1RXF0EIDH, _C1RXF0EID+1
         .equiv C1RXF1SIDL, _C1RXF1SID
         .equiv C1RXF1SIDH, _C1RXF1SID+1
         .equiv C1RXF1EIDL, _C1RXF1EID
         .equiv C1RXF1EIDH, _C1RXF1EID+1
         .equiv C1RXF2SIDL, _C1RXF2SID
         .equiv C1RXF2SIDH, _C1RXF2SID+1
         .equiv C1RXF2EIDL, _C1RXF2EID
         .equiv C1RXF2EIDH, _C1RXF2EID+1
         .equiv C1RXF3SIDL, _C1RXF3SID
         .equiv C1RXF3SIDH, _C1RXF3SID+1
         .equiv C1RXF3EIDL, _C1RXF3EID
         .equiv C1RXF3EIDH, _C1RXF3EID+1
         .equiv C1RXF4SIDL, _C1RXF4SID
         .equiv C1RXF4SIDH, _C1RXF4SID+1
         .equiv C1RXF4EIDL, _C1RXF4EID
         .equiv C1RXF4EIDH, _C1RXF4EID+1
         .equiv C1RXF5SIDL, _C1RXF5SID
         .equiv C1RXF5SIDH, _C1RXF5SID+1
         .equiv C1RXF5EIDL, _C1RXF5EID
         .equiv C1RXF5EIDH, _C1RXF5EID+1
         .equiv C1RXM0SIDL, _C1RXM0SID
         .equiv C1RXM0SIDH, _C1RXM0SID+1
         .equiv C1RXM0EIDL, _C1RXM0EID
         .equiv C1RXM0EIDH, _C1RXM0EID+1
         .equiv C1RXM1SIDL, _C1RXM1SID
         .equiv C1RXM1SIDH, _C1RXM1SID+1
         .equiv C1RXM1EIDL, _C1RXM1EID
         .equiv C1RXM1EIDH, _C1RXM1EID+1
         .equiv C1TX2CONL, _C1TX2CON
         .equiv C1TX2CONH, _C1TX2CON+1
         .equiv C1TX2SIDL, _C1TX2SID
         .equiv C1TX2SIDH, _C1TX2SID+1
         .equiv C1TX2EIDL, _C1TX2EID
         .equiv C1TX2EIDH, _C1TX2EID+1
         .equiv C1TX2B1L, _C1TX2B1
         .equiv C1TX2B1H, _C1TX2B1+1
         .equiv C1TX2B2L, _C1TX2B2
         .equiv C1TX2B2H, _C1TX2B2+1
         .equiv C1TX2B3L, _C1TX2B3
         .equiv C1TX2B3H, _C1TX2B3+1
         .equiv C1TX2B4L, _C1TX2B4
         .equiv C1TX2B4H, _C1TX2B4+1
         .equiv C1TX1CONL, _C1TX1CON
         .equiv C1TX1CONH, _C1TX1CON+1
         .equiv C1TX1SIDL, _C1TX1SID
         .equiv C1TX1SIDH, _C1TX1SID+1
         .equiv C1TX1EIDL, _C1TX1EID
         .equiv C1TX1EIDH, _C1TX1EID+1
         .equiv C1TX1B1L, _C1TX1B1
         .equiv C1TX1B1H, _C1TX1B1+1
         .equiv C1TX1B2L, _C1TX1B2
         .equiv C1TX1B2H, _C1TX1B2+1
         .equiv C1TX1B3L, _C1TX1B3
         .equiv C1TX1B3H, _C1TX1B3+1
         .equiv C1TX1B4L, _C1TX1B4
         .equiv C1TX1B4H, _C1TX1B4+1
         .equiv C1TX0CONL, _C1TX0CON
         .equiv C1TX0CONH, _C1TX0CON+1
         .equiv C1TX0SIDL, _C1TX0SID
         .equiv C1TX0SIDH, _C1TX0SID+1
         .equiv C1TX0EIDL, _C1TX0EID
         .equiv C1TX0EIDH, _C1TX0EID+1
         .equiv C1TX0B1L, _C1TX0B1
         .equiv C1TX0B1H, _C1TX0B1+1
         .equiv C1TX0B2L, _C1TX0B2
         .equiv C1TX0B2H, _C1TX0B2+1
         .equiv C1TX0B3L, _C1TX0B3
         .equiv C1TX0B3H, _C1TX0B3+1
         .equiv C1TX0B4L, _C1TX0B4
         .equiv C1TX0B4H, _C1TX0B4+1
         .equiv C1RX1CONL, _C1RX1CON
         .equiv C1RX1CONH, _C1RX1CON+1
         .equiv C1RX1SIDL, _C1RX1SID
         .equiv C1RX1SIDH, _C1RX1SID+1
         .equiv C1RX1EIDL, _C1RX1EID
         .equiv C1RX1EIDH, _C1RX1EID+1
         .equiv C1RX1B1L, _C1RX1B1
         .equiv C1RX1B1H, _C1RX1B1+1
         .equiv C1RX1B2L, _C1RX1B2
         .equiv C1RX1B2H, _C1RX1B2+1
         .equiv C1RX1B3L, _C1RX1B3
         .equiv C1RX1B3H, _C1RX1B3+1
         .equiv C1RX1B4L, _C1RX1B4
         .equiv C1RX1B4H, _C1RX1B4+1
         .equiv C1RX0CONL, _C1RX0CON
         .equiv C1RX0CONH, _C1RX0CON+1
         .equiv C1RX0SIDL, _C1RX0SID
         .equiv C1RX0SIDH, _C1RX0SID+1
         .equiv C1RX0EIDL, _C1RX0EID
         .equiv C1RX0EIDH, _C1RX0EID+1
         .equiv C1RX0B1L, _C1RX0B1
         .equiv C1RX0B1H, _C1RX0B1+1
         .equiv C1RX0B2L, _C1RX0B2
         .equiv C1RX0B2H, _C1RX0B2+1
         .equiv C1RX0B3L, _C1RX0B3
         .equiv C1RX0B3H, _C1RX0B3+1
         .equiv C1RX0B4L, _C1RX0B4
         .equiv C1RX0B4H, _C1RX0B4+1
         .equiv C1CTRLL, _C1CTRL
         .equiv C1CTRLH, _C1CTRL+1
         .equiv C1CFG1L, _C1CFG1
         .equiv C1CFG1H, _C1CFG1+1
         .equiv C1CFG2L, _C1CFG2
         .equiv C1CFG2H, _C1CFG2+1
         .equiv C1INTFL, _C1INTF
         .equiv C1INTFH, _C1INTF+1
         .equiv C1INTEL, _C1INTE
         .equiv C1INTEH, _C1INTE+1
         .equiv C1ECL, _C1EC
         .equiv C1ECH, _C1EC+1

;----------------CAN2 Module---------------------------------------------------
         .equiv C2RXF0SIDL, _C2RXF0SID          ; See all SFR descriptions in
         .equiv C2RXF0SIDH, _C2RXF0SID+1        ;  sub-section below
         .equiv C2RXF0EIDL, _C2RXF0EID
         .equiv C2RXF0EIDH, _C2RXF0EID+1
         .equiv C2RXF1SIDL, _C2RXF1SID
         .equiv C2RXF1SIDH, _C2RXF1SID+1
         .equiv C2RXF1EIDL, _C2RXF1EID
         .equiv C2RXF1EIDH, _C2RXF1EID+1
         .equiv C2RXF2SIDL, _C2RXF2SID
         .equiv C2RXF2SIDH, _C2RXF2SID+1
         .equiv C2RXF2EIDL, _C2RXF2EID
         .equiv C2RXF2EIDH, _C2RXF2EID+1
         .equiv C2RXF3SIDL, _C2RXF3SID
         .equiv C2RXF3SIDH, _C2RXF3SID+1
         .equiv C2RXF3EIDL, _C2RXF3EID
         .equiv C2RXF3EIDH, _C2RXF3EID+1
         .equiv C2RXF4SIDL, _C2RXF4SID
         .equiv C2RXF4SIDH, _C2RXF4SID+1
         .equiv C2RXF4EIDL, _C2RXF4EID
         .equiv C2RXF4EIDH, _C2RXF4EID+1
         .equiv C2RXF5SIDL, _C2RXF5SID
         .equiv C2RXF5SIDH, _C2RXF5SID+1
         .equiv C2RXF5EIDL, _C2RXF5EID
         .equiv C2RXF5EIDH, _C2RXF5EID+1
         .equiv C2RXM0SIDL, _C2RXM0SID
         .equiv C2RXM0SIDH, _C2RXM0SID+1
         .equiv C2RXM0EIDL, _C2RXM0EID
         .equiv C2RXM0EIDH, _C2RXM0EID+1
         .equiv C2RXM1SIDL, _C2RXM1SID
         .equiv C2RXM1SIDH, _C2RXM1SID+1
         .equiv C2RXM1EIDL, _C2RXM1EID
         .equiv C2RXM1EIDH, _C2RXM1EID+1
         .equiv C2TX2CONL, _C2TX2CON
         .equiv C2TX2CONH, _C2TX2CON+1
         .equiv C2TX2SIDL, _C2TX2SID
         .equiv C2TX2SIDH, _C2TX2SID+1
         .equiv C2TX2EIDL, _C2TX2EID
         .equiv C2TX2EIDH, _C2TX2EID+1
         .equiv C2TX2B1L, _C2TX2B1
         .equiv C2TX2B1H, _C2TX2B1+1
         .equiv C2TX2B2L, _C2TX2B2
         .equiv C2TX2B2H, _C2TX2B2+1
         .equiv C2TX2B3L, _C2TX2B3
         .equiv C2TX2B3H, _C2TX2B3+1
         .equiv C2TX2B4L, _C2TX2B4
         .equiv C2TX2B4H, _C2TX2B4+1
         .equiv C2TX1CONL, _C2TX1CON
         .equiv C2TX1CONH, _C2TX1CON+1
         .equiv C2TX1SIDL, _C2TX1SID
         .equiv C2TX1SIDH, _C2TX1SID+1
         .equiv C2TX1EIDL, _C2TX1EID
         .equiv C2TX1EIDH, _C2TX1EID+1
         .equiv C2TX1B1L, _C2TX1B1
         .equiv C2TX1B1H, _C2TX1B1+1
         .equiv C2TX1B2L, _C2TX1B2
         .equiv C2TX1B2H, _C2TX1B2+1
         .equiv C2TX1B3L, _C2TX1B3
         .equiv C2TX1B3H, _C2TX1B3+1
         .equiv C2TX1B4L, _C2TX1B4
         .equiv C2TX1B4H, _C2TX1B4+1
         .equiv C2TX0CONL, _C2TX0CON
         .equiv C2TX0CONH, _C2TX0CON+1
         .equiv C2TX0SIDL, _C2TX0SID
         .equiv C2TX0SIDH, _C2TX0SID+1
         .equiv C2TX0EIDL, _C2TX0EID
         .equiv C2TX0EIDH, _C2TX0EID+1
         .equiv C2TX0B1L, _C2TX0B1
         .equiv C2TX0B1H, _C2TX0B1+1
         .equiv C2TX0B2L, _C2TX0B2
         .equiv C2TX0B2H, _C2TX0B2+1
         .equiv C2TX0B3L, _C2TX0B3
         .equiv C2TX0B3H, _C2TX0B3+1
         .equiv C2TX0B4L, _C2TX0B4
         .equiv C2TX0B4H, _C2TX0B4+1
         .equiv C2RX1CONL, _C2RX1CON
         .equiv C2RX1CONH, _C2RX1CON+1
         .equiv C2RX1SIDL, _C2RX1SID
         .equiv C2RX1SIDH, _C2RX1SID+1
         .equiv C2RX1EIDL, _C2RX1EID
         .equiv C2RX1EIDH, _C2RX1EID+1
         .equiv C2RX1B1L, _C2RX1B1
         .equiv C2RX1B1H, _C2RX1B1+1
         .equiv C2RX1B2L, _C2RX1B2
         .equiv C2RX1B2H, _C2RX1B2+1
         .equiv C2RX1B3L, _C2RX1B3
         .equiv C2RX1B3H, _C2RX1B3+1
         .equiv C2RX1B4L, _C2RX1B4
         .equiv C2RX1B4H, _C2RX1B4+1
         .equiv C2RX0CONL, _C2RX0CON
         .equiv C2RX0CONH, _C2RX0CON+1
         .equiv C2RX0SIDL, _C2RX0SID
         .equiv C2RX0SIDH, _C2RX0SID+1
         .equiv C2RX0EIDL, _C2RX0EID
         .equiv C2RX0EIDH, _C2RX0EID+1
         .equiv C2RX0B1L, _C2RX0B1
         .equiv C2RX0B1H, _C2RX0B1+1
         .equiv C2RX0B2L, _C2RX0B2
         .equiv C2RX0B2H, _C2RX0B2+1
         .equiv C2RX0B3L, _C2RX0B3
         .equiv C2RX0B3H, _C2RX0B3+1
         .equiv C2RX0B4L, _C2RX0B4
         .equiv C2RX0B4H, _C2RX0B4+1
         .equiv C2CTRLL, _C2CTRL
         .equiv C2CTRLH, _C2CTRL+1
         .equiv C2CFG1L, _C2CFG1
         .equiv C2CFG1H, _C2CFG1+1
         .equiv C2CFG2L, _C2CFG2
         .equiv C2CFG2H, _C2CFG2+1
         .equiv C2INTFL, _C2INTF
         .equiv C2INTFH, _C2INTF+1
         .equiv C2INTEL, _C2INTE
         .equiv C2INTEH, _C2INTE+1
         .equiv C2ECL, _C2EC
         .equiv C2ECH, _C2EC+1

;------------------------------------------------------------------------------
; 18b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     CAN i Module Standard Identifier Bits
;
;     Found in the following registers
;                CiRXFnSID
;                CiTXnSID
;                CiRXMnSID
;                CiRXnSID
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv SID10, 0x000F
         .equiv SID9, 0x000E
         .equiv SID8, 0x000D
         .equiv SID7, 0x000C
         .equiv SID6, 0x000B
         .equiv SID5, 0x000A
         .equiv SID4, 0x0009
         .equiv SID3, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SID2, 0x0007
         .equiv SID1, 0x0006
         .equiv SID0, 0x0005
         .equiv SRR, 0x0004
         .equiv EXIDEN, 0x0003
         .equiv EXIDE, 0x0003
         .equiv EXID, 0x0003
         .equiv EID17, 0x0001
         .equiv EID16, 0x0000

;------------------------------------------------------------------------------
;     CAN i Module Extended Identifier Bits
;
;     Found in the following registers
;                CiRXFnEID
;                CiTXnEID
;                CiRXMnEID
;                CiRXnEID
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv EID15, 0x000F
         .equiv EID14, 0x000E
         .equiv EID13, 0x000D
         .equiv EID12, 0x000C
         .equiv EID11, 0x000B
         .equiv EID10, 0x000A
         .equiv EID9, 0x0009
         .equiv EID8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv EID7, 0x0007
         .equiv EID6, 0x0006
         .equiv EID5, 0x0005
         .equiv EID4, 0x0004
         .equiv EID3, 0x0003
         .equiv EID2, 0x0002
         .equiv EID1, 0x0001
         .equiv EID0, 0x0000

;------------------------------------------------------------------------------
;     CiTXnCON : CAN i module Transmit Buffer Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TXRTR, 0x000E
         .equiv DLC3, 0x000B
         .equiv DLC2, 0x000A
         .equiv DLC1, 0x0009
         .equiv DLC0, 0x0008
         ;** Use same bit names for DLCx bits in CiRXnCON **

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv TXABT, 0x0006
         .equiv TXLARB, 0x0005
         .equiv TXERR, 0x0004
         .equiv TXREQ, 0x0003
         .equiv TXPRI1, 0x0001
         .equiv TXPRI0, 0x0000

;------------------------------------------------------------------------------
;     CiRXnCON : CAN i module Receive Buffer Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
       .equiv RXRTR, 0x000E
; ** DLCx bits already identified in CmTXnCON bit definition **
;      .equiv DLC3, 0x000B
;      .equiv DLC2, 0x000A
;      .equiv DLC1, 0x0009
;      .equiv DLC0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RXFUL, 0x0007
         .equiv RXM1, 0x0006
         .equiv RXM0, 0x0005
         .equiv RXRTRRO, 0x0003
         .equiv FILHIT2, 0x0002
         .equiv DBEN, 0x0002
         .equiv FILHIT1, 0x0001
         .equiv JTOFF, 0x0001
         .equiv FILHIT0, 0x0000

;------------------------------------------------------------------------------
;     CiCTRL : CAN i module Control and Status Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CSIDL, 0x000D
         .equiv ABAT, 0x000C
         .equiv CANCKS, 0x000B
         .equiv REQOP2, 0x000A
         .equiv REQOP1, 0x0009
         .equiv REQOP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OPMODE2, 0x0007
         .equiv OPMODE1, 0x0006
         .equiv OPMODE0, 0x0005
         .equiv ICODE2, 0x0003
         .equiv ICODE1, 0x0002
         .equiv ICODE0, 0x0001

;------------------------------------------------------------------------------
;     CiCFG1 : CAN i module baud rate configuration register 1
;------------------------------------------------------------------------------
; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SJW1, 0x0007
         .equiv SJW0, 0x0006
         .equiv BRP5, 0x0005
         .equiv BRP4, 0x0004
         .equiv BRP3, 0x0003
         .equiv BRP2, 0x0002
         .equiv BRP1, 0x0001
         .equiv BRP0, 0x0000

;------------------------------------------------------------------------------
;     CiCFG2 : CAN i module baud rate configuration register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv CANCAP, 0x000F
         .equiv WAKFIL, 0x000E
         .equiv SEG2PH2, 0x000A
         .equiv SEG2PH1, 0x0009
         .equiv SEG2PH0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv SEG2PHTS, 0x0007
         .equiv SAM, 0x0006
         .equiv SEG1PH2, 0x0005
         .equiv SEG1PH1, 0x0004
         .equiv SEG1PH0, 0x0003
         .equiv PRSEG2, 0x0002
         .equiv PRSEG1, 0x0001
         .equiv PRSEG0, 0x0000

;------------------------------------------------------------------------------
;     CiINTF : CAN i module Interrupt Flag Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv RX0OVR, 0x000F
         .equiv RX1OVR, 0x000E
         .equiv TXB0, 0x000D
         .equiv TXEP, 0x000C
         .equiv RXEP, 0x000B
         .equiv TXWAR, 0x000A
         .equiv RXWAR, 0x0009
         .equiv EWARN, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IVRIF, 0x0007
         .equiv WAKIF, 0x0006
         .equiv ERRIF, 0x0005
         .equiv TX2IF, 0x0004
         .equiv TX1IF, 0x0003
         .equiv TX0IF, 0x0002
         .equiv RX1IF, 0x0001
         .equiv RX0IF, 0x0000

;------------------------------------------------------------------------------
;     CmINTE : CAN m module Interrupt Enable Register
;------------------------------------------------------------------------------
; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv IVRIE, 0x0007
         .equiv WAKIE, 0x0006
         .equiv ERRIE, 0x0005
         .equiv TX2IE, 0x0004
         .equiv TX1IE, 0x0003
         .equiv TX0IE, 0x0002
         .equiv RX1IE, 0x0001
         .equiv RX0IE, 0x0000


;==============================================================================
;
; 19.  System Integration Block Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 19a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv RCONL, _RCON                    ; See all SFR descriptions in
         .equiv RCONH, _RCON+1                  ;  section 22b
         .equiv OSCCONL, _OSCCON
         .equiv OSCCONH, _OSCCON+1

;------------------------------------------------------------------------------
; 19b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     RCON : Reset and System Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TRAPR, 0x000F
         .equiv IOPUWR, 0x000E
         .equiv BGST, 0x000D
         .equiv LVDEN, 0x000C
         .equiv LVDL3, 0x000B
         .equiv LVDL2, 0x000A
         .equiv LVDL1, 0x0009
         .equiv LVDL0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv EXTR, 0x0007
         .equiv SWR, 0x0006
         .equiv SWDTEN, 0x0005
         .equiv WDTO, 0x0004
         .equiv SLEEP, 0x0003
         .equiv IDLE, 0x0002
         .equiv BOR, 0x0001
         .equiv POR, 0x0000

;------------------------------------------------------------------------------
;     OSCCON : Oscillator Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv COSC1, 0x000D
         .equiv COSC0, 0x000C
         .equiv NOSC1, 0x0009
         .equiv NOSC0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv POST1, 0x0007
         .equiv POST0, 0x0006
         .equiv LOCK, 0x0005
         .equiv CF, 0x0003
         .equiv LPOSCEN, 0x0001
         .equiv OSWEN, 0x0000


;==============================================================================
;
; 20.  Non Volatile Memory Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 20a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv NVMCONL, _NVMCON                ; See NVMCON description in
         .equiv NVMCONH, _NVMCON+1              ;  sub-section below
         .equiv NVMADRL, _NVMADR
         .equiv NVMADRH, _NVMADR+1
         .equiv NVMKEYL, _NVMKEY
         .equiv NVMKEYH, _NVMKEY+1

;------------------------------------------------------------------------------
; 20b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;     NVMCON : Non Volatile Memory Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv WR, 0x000F
         .equiv WREN, 0x000E
         .equiv WRERR, 0x000D
         .equiv TWRI, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv PROGOP6, 0x0006
         .equiv PROGOP5, 0x0005
         .equiv PROGOP4, 0x0004
         .equiv PROGOP3, 0x0003
         .equiv PROGOP2, 0x0002
         .equiv PROGOP1, 0x0001
         .equiv PROGOP0, 0x0000


;==============================================================================
;
; 21. Peripheral Module Disable Bit Position Definitions for SFRs
;     & SFR High/Low byte definitions.
;==============================================================================
; 21a. SFR Definitions
;------------------------------------------------------------------------------
         .equiv PMD1L, _PMD1                    ; See bit descrpitions below
         .equiv PMD1H, _PMD1+1                  ;  for all files
         .equiv PMD2L, _PMD2
         .equiv PMD2H, _PMD2+1

;------------------------------------------------------------------------------
; 21b. Bit Position Definitions for some SFRs
;------------------------------------------------------------------------------
;  PMD1: Peripheral Module Disable 1 Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv T5MD, 0x000F
         .equiv T4MD, 0x000E
         .equiv T3MD, 0x000D
         .equiv T2MD, 0x000C
         .equiv T1MD, 0x000B
         .equiv DCIMD, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv I2CMD, 0x0007
         .equiv U2MD, 0x0006
         .equiv U1MD, 0x0005
         .equiv SPI2MD, 0x0004
         .equiv SPI1MD, 0x0003
         .equiv C2MD, 0x0002
         .equiv C1MD, 0x0001
         .equiv ADCMD, 0x0000

;------------------------------------------------------------------------------
;  PMD2: Peripheral Module Disable 2 Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv IC8MD, 0x000F
         .equiv IC7MD, 0x000E
         .equiv IC6MD, 0x000D
         .equiv IC5MD, 0x000C
         .equiv IC4MD, 0x000B
         .equiv IC3MD, 0x000A
         .equiv IC2MD, 0x0009
         .equiv IC1MD, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OC8MD, 0x0007
         .equiv OC7MD, 0x0006
         .equiv OC6MD, 0x0005
         .equiv OC5MD, 0x0004
         .equiv OC4MD, 0x0003
         .equiv OC3MD, 0x0002
         .equiv OC2MD, 0x0001
         .equiv OC1MD, 0x0000


;==============================================================================
;
; 22. Useful constants that ease assembly-level programming
;
;==============================================================================
         .equiv SLEEP_MODE, 0x0000
         .equiv IDLE_MODE, 0x0001

;==============================================================================
;
; 23. Macros and Fuse Configuration Definitions
;
;==============================================================================
; Notes:
;    1. Use the following fuse configuration settings by calling the "config"
;       macro(defined at the end of this section)or directly in assembly source
;       code.
;    2. Configuration Fuses exist in Program Space and their locations are
;       defined in the device linker script.
;==============================================================================
;------------------------------------------------------------------------------
; FOSC: Oscillator Selection Fuse
;------------------------------------------------------------------------------

         .equiv CSW_FSCM_OFF, 0xFFFF
         .equiv CSW_ON_FSCM_OFF, 0x7FFF
         .equiv CSW_FSCM_ON, 0x3FFF
         .equiv EC, 0xFFFB
         .equiv EC_IO, 0xFFFC
         .equiv EC_PLL4, 0xFFFD
         .equiv EC_PLL8, 0xFFFE
         .equiv EC_PLL16, 0xFFFF
         .equiv ERC, 0xFFF9
         .equiv ERC_IO, 0xFFF8
         .equiv XT, 0xFFF4
         .equiv XT_PLL4, 0xFFF5
         .equiv XT_PLL8, 0xFFF6
         .equiv XT_PLL16, 0xFFF7
         .equiv XTL, 0xFFF0
         .equiv HS, 0xFFF2
         .equiv LP, 0xFCFF
         .equiv FRC, 0xFDFF
         .equiv LPRC, 0xFEFF


;------------------------------------------------------------------------------
; FWDT: Watch Dog Timer Configuration Fuse
;------------------------------------------------------------------------------
         .equiv WDT_ON, 0xFFFF
         .equiv WDT_OFF, 0x7FFF
         .equiv WDTPSA_1, 0xFFCF
         .equiv WDTPSA_8, 0xFFDF
         .equiv WDTPSA_64, 0xFFEF
         .equiv WDTPSA_512, 0xFFFF
         .equiv WDTPSB_1, 0xFFF0
         .equiv WDTPSB_2, 0xFFF1
         .equiv WDTPSB_3, 0xFFF2
         .equiv WDTPSB_4, 0xFFF3
         .equiv WDTPSB_5, 0xFFF4
         .equiv WDTPSB_6, 0xFFF5
         .equiv WDTPSB_7, 0xFFF6
         .equiv WDTPSB_8, 0xFFF7
         .equiv WDTPSB_9, 0xFFF8
         .equiv WDTPSB_10, 0xFFF9
         .equiv WDTPSB_11, 0xFFFA
         .equiv WDTPSB_12, 0xFFFB
         .equiv WDTPSB_13, 0xFFFC
         .equiv WDTPSB_14, 0xFFFD
         .equiv WDTPSB_15, 0xFFFE
         .equiv WDTPSB_16, 0xFFFF

;------------------------------------------------------------------------------
; FBORPOR: Brown-out and Power-on Reset Fuse
;------------------------------------------------------------------------------
         .equiv MCLR_EN, 0xFFFF
         .equiv MCLR_DIS, 0x7FFF
         .equiv PBOR_ON, 0xFFFF
         .equiv PBOR_OFF, 0xFF7F
         .equiv BORV_20, 0xFFFF
         .equiv BORV_27, 0xFFEF
         .equiv BORV_42, 0xFFDF
         .equiv BORV_45, 0xFFCF
         .equiv PWRT_OFF, 0xFFFC
         .equiv PWRT_4, 0xFFFD
         .equiv PWRT_16, 0xFFFE
         .equiv PWRT_64, 0xFFFF


;------------------------------------------------------------------------------
; FGS: Genneral (Code) Segment Fuse
;------------------------------------------------------------------------------
         .equiv CODE_PROT_OFF, 0xFFFF
         .equiv CODE_PROT_ON, 0xFFFD

;------------------------------------------------------------------------------
; Setting configuration fuses
;------------------------------------------------------------------------------
; Setting configuration fuses using macros:
;==========================================
; The following macro named "config" can be used to set configuration fuses:
        .macro config REG, VALUE
        .section \REG.sec, "x"
        .global \REG
\REG:   .pword \VALUE
        .endm

.LIST

        .global _main
        .global __FWDT

        .equiv stacksize, 0

       /***************************************************
          Constant section                                
       ***************************************************/
; Use data allocation directives rather than constants.
              .data
errnum:       .int   0
testnum:      .space 2         ; Holds the test number
ObsrvdVal:    .space 2         ; ObsrvdVal is used in fail routine 
                               ;   to output the observed value of flag 
ExpctdVal:    .space 2         ; ExpctdVal is used in fail routine
                               ;   to output the expected value of flag 
ExpctdAcc:    .space 6
accErr   :    .space 2

        .section __FWDT,code
__FWDT:
        .pword    WDT_OFF & WDTPSA_1 & WDTPSB_1
           .text
       /****************************************************
               Assembly code section                            
       ****************************************************/

; Use _main instead of __reset so that the C startup libraries run
; and initialize the stack, idata, etc.

_main:

         ;*****************************************************;
         ;*     Disable arithmetic warning trap.              *;
         ;*      (Clear OVATE, OVBTE,COVTE bits in INTCON1).  *;
         ;*****************************************************;
         clr INTCON1

         ;*****************************************************; 
         ;*    Disable Saturation for Accumulators.           *;
         ;*             (Clear SATA and SATB in CORCON)       *;
         ;*****************************************************;
          bclr CORCON, #SATA
          bclr CORCON, #SATB
          
          goto test1
          
          .data
failAccA: .asciz "Check on Accumulator A failed, test %d\n"
          .text
          
         ;*****************************************************;
         ;*  TEST 1 (Test for result within allowed range)    *;
         ;*  0x00 7fff ffff - 0x00 00ff ff00 = 0x00 7f00 00ff *;
         ;*****************************************************;

test1:    inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0xffff,w0            ; Load A with 0x00 7fff ffff.
          mov w0, ACCAL
          mov #0x7fff, w0
          mov w0, ACCAH
          mov #0x0000, w0
          mov w0, ACCAU

          mov #0xff00,w0            ; Load B with 0x00 00ff ff00.
          mov w0, ACCBL
          mov #0x00ff, w0
          mov w0, ACCBH
          mov #0x0000, w0
          mov w0, ACCBU

          sub A                     ; Perform subtraction

          mov #0x00ff, w0           ; Check result in A = 0x00 7f00 00ff.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCAL               ; If not equal branch to fail.
          btss  SR, #Z
          call  fail_AccAChk
          mov   #0x7f00, w0
          mov   w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCAH
          btss  SR, #Z
          call  fail_AccAChk
          mov   #0x0000, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCAU
          btss  SR, #Z
          call  fail_AccAChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov   #0xff00, w0           ; Verify that there is no change in B value.
          mov   w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCBL
          btss  SR, #Z
          call  fail_AccBChk
          mov   #0x00ff, w0
          mov   w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCBH
          btss  SR, #Z
          call  fail_AccBChk
          mov   #0x0000, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCBU
          btss  SR, #Z
          call  fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          
          goto test2   
          
          .data
failAccB: .asciz "Check on Accumulator B failed, test %d\n"          
          .text

         ;*****************************************************; 
         ;*  TEST 2 (Overflow on B)                           *;
         ;*  0xff fbff 7fff - 0x00 7bff 8000 = 0xff 7fff ffff *;
         ;*****************************************************; 

test2:    inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x8000,w0            ; Load A with 0x00 7bff 8000.
          mov w0, ACCAL
          mov #0x7bff, w0
          mov w0, ACCAH
          mov #0x0000, w0
          mov w0, ACCAU

          mov #0x7fff,w0            ; Load B with 0xff fbff 7fff.
          mov w0, ACCBL
          mov #0xfbff, w0
          mov w0, ACCBH
          mov #0xffff, w0
          mov w0, ACCBU

          sub B

          mov   #0xffff, w0           ; Check result in B = 0xff 7fff ffff.
          mov   w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCBL
          btss  SR, #Z
          call  fail_AccBChk
          mov   #0x7fff, w0
          mov   w0, ExpctdAcc+2       ; Store Expected Value of ACCBH,
                                    ;   for display routine
          cp    ACCBH
          btss  SR, #Z
          call  fail_AccBChk
          mov   #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp    ACCBU               ; If not equal branch to fail.
          btss  SR, #Z
          call  fail_AccBChk 

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
 
          mov   #0x8000, w0
          mov   w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCAL
          btss  SR, #Z
          call  fail_AccAChk
          mov   #0x7bff, w0
          mov   w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp    ACCAH
          btss  SR, #Z
          call  fail_AccAChk
          mov   #0x0000, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU,
                                    ;   for display routine
          cp    ACCAU
          btss  SR, #Z
          call  fail_AccAChk

          cp0   accErr             ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1
          btss SR, #OB              ; Verify SB = 0; OB = 1; SAB = 0; OAB = 1;
          call fail_OB              ;    SA = 0, OA = 0.
          btss SR, #OAB
          call fail_OAB

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0
          btsc SR, #SB
          call fail_SB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          
          goto test3     
          
          .data
failOA:   .asciz "OA bit check fail: SUBAB, test %d\n"
          .text          

         ;*****************************************************;
         ;*  TEST 3 (Catastrophic Overflow on A)              *;
         ;*  0x80 00ff 8001 - 0x7f 0000 0000 = 0x01 00ff 8001 *;
         ;*****************************************************;

test3:    inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register.
          clr SR                    ; As clr A and Clr B does not clear
                                    ;  saturation flags now.

          mov #0x8001,w0            ; Load A with 0x80 00ff 8001.
          mov w0, ACCAL
          mov #0x00ff, w0
          mov w0, ACCAH
          mov #0xff80, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x7f 0000 0000.
          mov w0, ACCBL
          mov #0x0000, w0
          mov w0, ACCBH
          mov #0x007f, w0
          mov w0, ACCBU

          sub A

          mov #0x8001, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr  SR, #Z
          cp    ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x00ff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0001, w0           ; Check result in A = 0x01 00ff 8001.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU,
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail.
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH,
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x007f, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB
          btss SR, #OA
          call fail_OA
          btss SR, #SA
          call fail_SA

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0

          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
          call fail_OB              ;    SA = 1, OA = 1.
          btsc SR, #SB
          call fail_SB

          .data
failOB:   .asciz "OB bit check fail: SUBAB, test %d\n"
          .text

         ;*****************************************************;
         ;*  TEST 4 (Catastrophic Overflow on B)              *;
         ;*  0x7f 8001 ffff - 0xff 8000 0000 = 0x80 0001 ffff *;
         ;*****************************************************;

test4:    inc testnum
          clr A                     ; Set initial conditions,
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register.

          clr SR                    ; As clr A and Clr B does not clear
                                    ;  saturation flags now.

          mov #0x0000,w0            ; Load A with 0xff 8000 0000.
          mov w0, ACCAL
          mov #0x8000, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0xffff,w0            ; Load B with 0x7f 8001 ffff.
          mov w0, ACCBL
          mov #0x8001, w0
          mov w0, ACCBH
          mov #0x007f, w0
          mov w0, ACCBU

          sub B

          mov #0xffff, w0           ; Check result in B = 0x80 0001 ffff.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss SR, #Z
          call fail_AccBChk
          mov #0x0001, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH,
                                    ;   for display routine
          cp ACCBH
          btss SR, #Z
          call fail_AccBChk
          mov #0xff80, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU,
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail.
          btss SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0           ; Verify that there is no change in A value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr  SR, #Z
          cp ACCAL
          btss SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU,
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1
          btss SR, #OB              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
          call fail_OB              ;    SA = 0, OA = 0.
          btss SR, #SB
          call fail_SB
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA

         ;*****************************************************;
         ;*    Enable 1.31 Saturation for both Accumulators.  *;
         ;*     (Set SATA and SATB; Clear ACCSAT in CORCON)   *;
         ;*****************************************************;

         bset CORCON, #SATA
         bset CORCON, #SATB
         bclr CORCON, #ACCSAT
         
          goto test5   
          .data
failSA:   .asciz "SA bit check fail: SUBAB, test %d\n"
          .text          

         ;*****************************************************;
         ;*  TEST 5 (Test for result within allowed range)    *;
         ;*  0xff 8000 0004 - 0xff ff00 0006 = 0xff 80ff fffe *;
         ;*****************************************************;

test5:    inc testnum
          clr A                     ; Set initial conditions,
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register.
          clr SR                    ; As clr A and Clr B does not clear
                                    ;  saturation flags now.

          mov #0x0004,w0            ; Load A with 0xff 8000 0004.
          mov w0, ACCAL
          mov #0x8000, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0x0006,w0            ; Load B with 0xff ff00 0006.
          mov w0, ACCBL
          mov #0xff00, w0
          mov w0, ACCBH
          mov #0xffff, w0
          mov w0, ACCBU

          sub A

          mov #0xfffe, w0           ; Check result in A = 0xff 80ff fffe.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x80ff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU,
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail.
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0006, w0           ; Verify that there is no change in B value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0xff00, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH,
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU,
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA

          .data
failSB:   .asciz "SB bit check fail: SUBAB, test %d\n"
          .text
         ;*****************************************************;
         ;*  TEST 6 (Test for result within allowed range)    *;
         ;*  0x00 3ff8 f004 - 0xff bffa f004 = 0x00 7ffe 0000 *;
         ;*****************************************************;

test6:    inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                         ; As clr A and Clr B does not clear 
                                         ;  saturation flags now.

          mov #0xf004,w0            ; Load A with 0xff bffa f004.
          mov w0, ACCAL
          mov #0xbffa, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0xf004,w0            ; Load B with 0x00 3ff8 f004.
          mov w0, ACCBL
          mov #0x3ff8, w0
          mov w0, ACCBH
          mov #0x0000, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0           ; Check result in B = 0x00 7ffe 0000.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL,
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x7ffe, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH,
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU,
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail.
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0xf004, w0           ; Verify that there is no change in A value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0xbffa, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr             ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          
          .data
failOAB:  .asciz "OAB bit check fail: SUBAB, test %d\n"
          .text
          .data
failSAB:  .asciz "SAB bit check fail: SUBAB, test %d\n"
          .text          

         ;*****************************************************;
         ;*  TEST 7 (Test for Positive saturation on A)       *;
         ;*  0x00 4800 fffe - 0xff c800 fffe = 0x00 7fff ffff *;
         ;*****************************************************;

test7:    inc testnum
          clr A                     ; Set initial conditions,
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register.
          clr SR                    ; As clr A and Clr B does not clear
                                    ;  saturation flags now.
          mov #0xfffe,w0            ; Load A with 0x00 4800 fffe.
          mov w0, ACCAL
          mov #0x4800, w0
          mov w0, ACCAH
          mov #0x00, w0
          mov w0, ACCAU

          mov #0xfffe,w0            ; Load B with 0xff c800 fffe.
          mov w0, ACCBL
          mov #0xc800, w0
          mov w0, ACCBH
          mov #0xff, w0
          mov w0, ACCBU

          sub A

          mov #0xffff, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr  SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x7fff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0           ; Check result in A = 0x00 7fff ffff.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU,
                                    ;   for display routine
          cp    ACCAU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0xfffe, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0xc800, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.


          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
          call fail_OB              ;    SA = 1, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btss SR, #SA
          call fail_SA

          .data
passstr:  .asciz "pass: SUBAB, test %d\n"
          .text

         ;*****************************************************;
         ;*  TEST 8 (Test for Negative saturation on B)       *;
         ;*  0x80 c088 ffff - 0x00 7fff ffff = 0xff 8000 0000 *;
         ;*****************************************************;

test8:    inc testnum

          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.
          mov #0xffff,w0            ; Load A with 0x00 7fff ffff.
          mov w0, ACCAL
          mov #0x7fff, w0
          mov w0, ACCAH
          mov #0x0000, w0
          mov w0, ACCAU

          mov #0xffff,w0            ; Load B with 0x80 c088 ffff.
          mov w0, ACCBL
          mov #0xc088, w0
          mov w0, ACCBH
          mov #0xff80, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss SR, #Z
          call fail_AccBChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0           ; Check result in B = 0xff 8000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0xffff, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x7fff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #SB
          call fail_SB
          btss SR, #SAB
          call fail_SAB

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA

         ;*****************************************************;
         ;*    Enable 9.31 Saturation for both Accumulators.  *;
         ;*     (Set SATA, SATB and ACCSAT in CORCON)         *;
         ;*****************************************************;

         bset CORCON, #SATA
         bset CORCON, #SATB
         bset CORCON, #ACCSAT
         
          .data
passall:  .asciz "PASS: SUBAB, TEST END\n"
          .text   
          .data
failall:  .asciz "FAIL: SUBAB, TEST END\n"
          .text          

         ;*****************************************************;
         ;*  TEST 9 (Test for result within allowed range)    *;
         ;*  0xff 8001 70ff - 0x00 0001 70ff = 0xff 8000 0000 *;
         ;*****************************************************;

test9:    inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.
          mov #0x70ff,w0            ; Load A with 0xff 8001 70ff.
          mov w0, ACCAL
          mov #0x8001, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0x70ff,w0            ; Load B with 0x00 0001 70ff.
          mov w0, ACCBL
          mov #0x0001, w0
          mov w0, ACCBH
          mov #0x0000, w0
          mov w0, ACCBU

          sub A

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0           ; Check result in A = 0xff 8000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x70ff, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0001, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #SB
          call fail_SB 
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          
          goto test10
          .data
displayOA: .asciz "Expected value of OA is %d, Observed value of OA is %d\n"
          .text
          
          ;*****************************************************; 
          ;*  TEST 10 (Test for overflow on B)                 *;
          ;*  0x00 70ff 8002 - 0xff f0ff 8002 = 0x00 8000 0000 *;
          ;*****************************************************; 

test10:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.
          mov #0x8002,w0            ; Load A with 0xff f0ff 8002.
          mov w0, ACCAL
          mov #0xf0ff, w0
          mov w0, ACCAH
          mov #0xff, w0
          mov w0, ACCAU

          mov #0x8002,w0            ; Load B with 0x00 70ff 8002.
          mov w0, ACCBL
          mov #0x70ff, w0
          mov w0, ACCBH
          mov #0x00, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0           ; Check result in B = 0x00 8000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x8002, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0xf0ff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1            
          btss SR, #OB              ; Verify SB = 0; OB = 1; SAB = 0; OAB = 1;
          call fail_OB              ;    SA = 0, OA = 0.
          btss SR, #OAB
          call fail_OAB

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #SB
          call fail_SB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA

          goto test11
          .data
displayOB: .asciz "Expected value of OB is %d, Observed value of OB is %d\n"
          .text          

         ;*****************************************************; 
         ;*  TEST 11 (Test for Negative Saturation on A)      *;
         ;*  0xff 8002 ffff - 0x7f ff03 0000 = 0x80 0000 0000 *;
         ;*****************************************************;

test11:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0xffff,w0            ; Load A with 0xff 8002 ffff.
          mov w0, ACCAL
          mov #0x8002, w0
          mov w0, ACCAH
          mov #0xff, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x7f ff03 0000.
          mov w0, ACCBL
          mov #0xff03, w0
          mov w0, ACCBH
          mov #0x7f, w0
          mov w0, ACCBU 

          sub A

          mov #0x0000, w0           ; Check result in A = 0x80 0000 0000.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xff80, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr             ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0           ; Verify that there is no change in B value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0xff03, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x007F, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
          call fail_OB              ;    SA = 1, OA = 1.
          btsc SR, #SB
          call fail_SB
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB
          btss SR, #OA
          call fail_OA
          btss SR, #SA
          call fail_SA
          
          goto test12

         ;*****************************************************; 
         ;*  TEST 12 (Test for Positive saturation on B)      *;
         ;*  0x7f fffe 8000 - 0xff 8000 0000 = 0x7f ffff ffff *;
         ;*****************************************************; 
          .data
displaySA: .asciz "Expected value of SA is %d, Observed value of SA is %d\n"
          .text
          
test12:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x0000,w0            ; Load A with 0xff 8000 0000.
          mov w0, ACCAL
          mov #0x8000, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0x8000,w0            ; Load B with 0x7f fffe 8000.
          mov w0, ACCBL
          mov #0xfffe, w0
          mov w0, ACCBH
          mov #0x007f, w0
          mov w0, ACCBU 

          sub B

          mov #0xffff, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x007f, w0           ; Check result in B = 0x7f ffff ffff.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0           ; Verify that there is no change in A value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OA              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
          call fail_OA              ;    SA = 0, OA = 0.
          btsc SR, #SA
          call fail_SA
          clr  ObsrvdVal            ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset ExpctdVal, #0        ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB
          btss SR, #OB
          call fail_OB
          btss SR, #SB
          call fail_SB

         ;*****************************************************; 
         ;*    Enable 1.31 Saturation for both Accumulators.  *;
         ;*     (Set SATA and SATB; Clear ACCSAT in CORCON)   *;
         ;*****************************************************;

          bclr CORCON, #ACCSAT
          
          goto test13
          .data
displaySB: .asciz "Expected value of SB is %d, Observed value of SB is %d\n"
          .text          

         ;*****************************************************;
         ;*  TEST 13 (Test for Positive saturation on A)      *;
         ;*  0x00 7fff ffff - 0xff 8000 0000 = 0x00 7fff ffff *;
         ;*****************************************************;

test13:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0xffff,w0            ; Load A with 0x00 7fff ffff.
          mov w0, ACCAL
          mov #0x7fff, w0
          mov w0, ACCAH
          mov #0x00, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0xff 8000 0000.
          mov w0, ACCBL
          mov #0x8000, w0
          mov w0, ACCBH
          mov #0xffff, w0
          mov w0, ACCBU

          sub A

          mov #0xffff, w0           ; Check result in A = 0x00 7fff ffff.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x7fff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
          call fail_OB              ;    SA = 1, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #OA
          call fail_OA

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #SAB
          call fail_SAB
          btss SR, #SA
          call fail_SA
          
          goto test14
          .data
displayOAB:.asciz "Expected value of OAB is %d, Observed value of OAB is %d\n"
          .text
         ;*****************************************************; 
         ;*  TEST 14 (Test for Negative saturation on B)      *;
         ;*  0xff 8000 0000 - 0x00 0000 0001 = 0xff 8000 0000 *;
         ;*****************************************************; 

test14:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x0001,w0            ; Load A with 0x00 0000 0001.
          mov w0, ACCAL
          mov #0x0000, w0
          mov w0, ACCAH
          mov #0x0000, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0xff 8000 0000.
          mov w0, ACCBL
          mov #0x8000, w0
          mov w0, ACCBH
          mov #0xffff, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0           ; Check result in B = 0xff 8000 0000.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xffff, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          mov #0x0001, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0           ; Verify that there is no change in A value.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #SB
          call fail_SB
          btss SR, #SAB
          call fail_SAB
          
          goto test15          
          .data
displaySAB:.asciz "Expected value of SAB is %d, Observed value of SAB is %d\n"
          .text
         ;*****************************************************;
         ;*  TEST 15 (Test for zero result on B)              *;
         ;*  0xff 8000 0000 - 0xff 8000 0000 = 0x00 0000 0000 *;
         ;*****************************************************;

test15:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.
          mov #0x0000,w0            ; Load A with 0xff 8000 0000.
          mov w0, ACCAL
          mov #0x8000, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0xff 8000 0000.
          mov w0, ACCBL
          mov #0x8000, w0
          mov w0, ACCBH
          mov #0xffff, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0           ; Check result in B = 0x00 0000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU               ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OB              ;    SA = 0, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OA
          call fail_OA
          btsc SR, #SA
          call fail_SA
          
          goto test16          

         ;*****************************************************;
         ;*  TEST 16 (Test for Negative saturation on A       *;
         ;*            with Adder bit 39 overflow)            *;
         ;*  0xff 8002 ffff - 0x7f ff03 0000 = 0xff 8000 0000 *;
         ;*****************************************************;

test16:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0xffff,w0            ; Load A with 0xff 8002 ffff.
          mov w0, ACCAL
          mov #0x8002, w0
          mov w0, ACCAH
          mov #0xff, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x7f ff03 0000.
          mov w0, ACCBL
          mov #0xff03, w0
          mov w0, ACCBH
          mov #0x7f, w0
          mov w0, ACCBU

          sub A

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0           ; Check result in A = 0xff 8000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0xff03, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x007f, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 0;
          call fail_OB              ;    SA = 1, OA = 0.
          btsc SR, #SB
          call fail_SB
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #OA
          call fail_OA
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #SA
          call fail_SA
          btss SR, #SAB
          call fail_SAB
          
          goto test17          

         ;*****************************************************;
         ;*  TEST 17 (Test for Positive saturation on B       *;
         ;*            with Adder bit 39 overflow)            *;
         ;*  0x7f fffe 8000 - 0xff 8000 0000 = 0x00 7fff ffff *;
         ;*****************************************************;

test17:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 
          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x0000,w0            ; Load A with 0xff 8000 0000.
          mov w0, ACCAL
          mov #0x8000, w0
          mov w0, ACCAH
          mov #0xffff, w0
          mov w0, ACCAU

          mov #0x8000,w0            ; Load B with 0x7f fffe 8000.
          mov w0, ACCBL
          mov #0xfffe, w0
          mov w0, ACCBH
          mov #0x007f, w0
          mov w0, ACCBU

          sub B

          mov #0xffff, w0           ; Check result in B = 0x00 7fff ffff.
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x7fff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0   accErr              ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.
          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x8000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0          
          btsc SR, #OA              ; Verify SB = 1; OB = 0; SAB = 1; OAB = 0;
          call fail_OA              ;    SA = 0, OA = 0.
          btsc SR, #SA
          call fail_SA
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #OB
          call fail_OB

          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1
          btss SR, #SAB
          call fail_SAB
          btss SR, #SB
          call fail_SB

         ;*****************************************************;
         ;*    Enable 9.31 Saturation for both Accumulators.  *;
         ;*     (Set SATA, SATB and ACCSAT in CORCON)         *;
         ;*****************************************************;

         bset CORCON, #SATA
         bset CORCON, #SATB
         bset CORCON, #ACCSAT
         
          goto test18         

         ;*****************************************************;
         ;*  TEST 18 (Test for Positive Saturation on A)      *;
         ;*  0x7f ffff ffff - 0x80 0000 0000 = 0x7f ffff ffff *;
         ;*****************************************************;

test18:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0xffff,w0            ; Load A with 0x7f ffff ffff.
          mov w0, ACCAL
          mov #0xffff, w0
          mov w0, ACCAH
          mov #0x7f, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x80 0000 0000.
          mov w0, ACCBL
          mov #0x0000, w0
          mov w0, ACCBH
          mov #0x80, w0
          mov w0, ACCBU 

          sub A

          mov #0xffff, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL,
                                    ;   for display routine
          bclr SR, #Z
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0xffff, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH,
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x007f, w0           ; Check result in A = 0x7f ffff ffff.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xff80, w0           ; Verify that there is no change in B value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OB              ; Verify SB = 0; OB = 0; SAB = 1; OAB = 1;
          call fail_OB              ;    SA = 1, OA = 1.
          btsc SR, #SB
          call fail_SB
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB
          btss SR, #OA
          call fail_OA
          btss SR, #SA
          call fail_SA
          
          goto test19          

         ;*****************************************************; 
         ;*  TEST 19 (Test for Negative saturation on B)      *;
         ;*  0x80 0000 0000 - 0x00 0000 0001 = 0x80 0000 0000 *;
         ;*****************************************************; 
        
test19:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x0001,w0            ; Load A with 0x00 0000 0001.
          mov w0, ACCAL
          mov #0x0000, w0
          mov w0, ACCAH
          mov #0x0000, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x80 0000 0000.
          mov w0, ACCBL
          mov #0x0000, w0
          mov w0, ACCBH
          mov #0xff80, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0xff80, w0           ; Check result in B = 0x80 0000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0001, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OA              ; Verify SB = 1; OB = 1; SAB = 1; OAB = 1;
          call fail_OA              ;    SA = 0, OA = 0.
          btsc SR, #SA
          call fail_SA
          clr   ObsrvdVal           ; ObsrvdVal = 0, Observed value of flags for
                                    ;   following checks is 0  
          bset  ExpctdVal, #0       ; ExpctdVal = 1, Expected value of flags for
                                    ;   following checks is 1  
          btss SR, #OAB
          call fail_OAB
          btss SR, #SAB
          call fail_SAB
          btss SR, #OB
          call fail_OB
          btss SR, #SB
          call fail_SB
          
          goto test20          

         ;*****************************************************; 
         ;*  TEST 20 (Test for zero result on B)              *;
         ;*  0x80 0000 0000 - 0x80 0000 0000 = 0x00 0000 0000 *;
         ;*****************************************************; 

test20:   inc testnum
          clr A                     ; Set initial conditions, 
          clr B                     ; This will clear all overflow and
                                    ;  saturation flags in SR register. 

          clr SR                    ; As clr A and Clr B does not clear 
                                    ;  saturation flags now.  

          mov #0x0000,w0            ; Load A with 0x80 0000 0000.
          mov w0, ACCAL
          mov #0x0000, w0
          mov w0, ACCAH
          mov #0xff80, w0
          mov w0, ACCAU

          mov #0x0000,w0            ; Load B with 0x80 0000 0000.
          mov w0, ACCBL
          mov #0x0000, w0
          mov w0, ACCBH
          mov #0xff80, w0
          mov w0, ACCBU

          sub B

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCBL, 
                                    ;   for display routine
          bclr SR, #Z
          cp ACCBL
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCBH, 
                                    ;   for display routine
          cp ACCBH
          btss  SR, #Z
          call fail_AccBChk
          mov #0x0000, w0           ; Check result in B = 0x00 0000 0000.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCBU, 
                                    ;   for display routine
          cp ACCBU                  ; If not equal branch to fail. 
          btss  SR, #Z
          call fail_AccBChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accBDisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          mov #0x0000, w0
          mov w0, ExpctdAcc         ; Store Expected Value of ACCAL, 
                                    ;   for display routine
          cp ACCAL
          btss  SR, #Z
          call fail_AccAChk
          mov #0x0000, w0
          mov w0, ExpctdAcc+2       ; Store Expected Value of ACCAH, 
                                    ;   for display routine
          cp ACCAH
          btss  SR, #Z
          call fail_AccAChk
          mov #0xff80, w0           ; Verify that there is no change in A value.
          mov.b WREG, ExpctdAcc+4   ; Store Expected Value of ACCAU, 
                                    ;   for display routine
          cp ACCAU
          btss  SR, #Z
          call fail_AccAChk

          cp0  accErr               ; accErr is incremented in fail routine,
          btss  SR, #Z
          call  accADisplay         ; If accumulator check has failed,
                                    ;   branch and display accumulator.

          bset   ObsrvdVal, #0      ; ObsrvdVal = 1, Observed value of flags for
                                    ;   following checks is 1
          clr    ExpctdVal          ; ExpctdVal = 0, Expected value of flags for
                                    ;   following checks is 0 
          btsc SR, #OA              ; Verify SB = 0; OB = 0; SAB = 0; OAB = 0;
          call fail_OA              ;    SA = 0, OA = 0.
          btsc SR, #SA
          call fail_SA
          btsc SR, #OAB
          call fail_OAB
          btsc SR, #SAB
          call fail_SAB
          btsc SR, #OB
          call fail_OB
          btsc SR, #SB
          call fail_SB 

          mov.w   errnum
          bra z,  Pass
          
          goto Fail          

        /**********************************************************
           Fail Indicator: Indicates that one or more tests   
                           Have failed.                     
        **********************************************************/

Fail:   goto    Fail_end
        HALT                   ;Halt the simulator if we get here.
        goto Fail

        /***********************************************************
          Pass Indicator: Indicates that all tests have      
                          passed.                         
        ***********************************************************/

Pass:   goto    Pass_end

         /***********************************************************
                                Error Messages 
          ***********************************************************/
          .data
displayAccA:.asciz "Expected value of AccA is 0x%0.2x %4.4x %4.4x\nObserved value of AccA is 0x%0.2x %4.4x %4.4x\n"
          .text
          .data
displayAccB:.asciz "Expected value of AccB is 0x%0.2x %4.4x %4.4x\nObserved value of AccB is 0x%0.2x %4.4x %4.4x\n"

          .text

        ;********************************************************;
        ;* Fail routine:                                        *;
        ;*   Output a fail message to stdout with the           *;
        ;*     the number of the failed test in the test files. *;
        ;********************************************************;

accADisplay:
          clr accErr

          push ACCAL                        ; Push observed value of ACCAL
          .set stacksize, 2

          push ACCAH                        ; Push observed value of ACCAH
         .set stacksize, stacksize+2

          mov ACCAU, w0                     ; Clear the upper byte 
          clr.b 0x01                        ;  so that only 40 bits of accumulator is 
                                            ;  displayed.
          push w0                           ; Push observed value of ACCAU
          .set stacksize, stacksize+2

          push ExpctdAcc                    ; Push expected value of ACCAL
         .set stacksize, stacksize+2

          push ExpctdAcc+2                  ; Push expected value of ACCAH
         .set stacksize, stacksize+2

          push ExpctdAcc+4                  ; Push expected value of ACCAU
         .set stacksize, stacksize+2

          mov.w #displayAccA, w0            ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
         .set stacksize, stacksize+2

          call _printf                      ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15          ; Pop parameters off the stack.
         .set stacksize, 0
          return

accBDisplay:

          clr accErr

          push ACCBL                        ; Push observed value of ACCBL
          .set stacksize, 2

          push ACCBH                         ; Push observed value of ACCBH
         .set stacksize, stacksize+2

          mov ACCBU, w0                      ; Clear the upper byte 
          clr.b 0x01                         ;  so that only 40 bits of accumulator is 
                                             ;  displayed.      
          push w0                            ; Push observed value of ACCBU
         .set stacksize, stacksize+2

          push ExpctdAcc                     ; Push expected value of ACCBL
         .set stacksize, stacksize+2

          push ExpctdAcc+2                   ; Push expected value of ACCBH
         .set stacksize, stacksize+2

          push ExpctdAcc+4                   ; Push expected value of ACCBU
         .set stacksize, stacksize+2

          mov.w #displayAccB, w0             ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
         .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
         .set stacksize, 0

          return


fail_AccAChk:
          inc     errnum
          inc     accErr 

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failAccA, w0                ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.
          return
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_AccBChk:
          inc     errnum
          inc     accErr 

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failAccB, w0                ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.
          return
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_OA:
          inc     errnum

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failOA, w0                  ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.
          push  ObsrvdVal 
          .set stacksize, 2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displayOA, w0               ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize, 0

          return                             ; Continue tests

          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_OB:
          inc     errnum
 
          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failOB, w0                  ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.
          
          push   ObsrvdVal
          .set stacksize, 2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displayOB, w0               ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize,0 

          return                             ; Continue tests
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_SA:
          inc     errnum

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failSA, w0                  ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.

          push  ObsrvdVal
          .set stacksize, 2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displaySA, w0               ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize, 0

          return                             ; Continue tests
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_SB:
          inc     errnum

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failSB, w0                  ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.

          push   ObsrvdVal
          .set stacksize, 2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displaySB, w0               ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize, 0

          return                             ; Continue tests
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_OAB:
          inc     errnum

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failOAB, w0                 ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.

          push  ObsrvdVal
          .set stacksize,2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displayOAB, w0              ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize,0

          return                             ; Continue tests
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.

fail_SAB:
          inc     errnum

          push testnum                       ; Push the variable Test_cnt onto the stack.
          mov.w #failSAB, w0                 ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#4,w15                   ; Pop parameters off the stack.

          push  ObsrvdVal
          .set stacksize, 2

          push   ExpctdVal
          .set stacksize, stacksize+2

          mov.w #displaySAB, w0              ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          .set stacksize, stacksize+2

          call _printf                       ; Call the stdio routine printf.
          sub.w w15,#stacksize,w15           ; Pop parameters off the stack.
          .set stacksize,0   

          return                             ; Continue tests
          goto Fail_end
          HALT                               ; Halt the simulator if we get here.


Fail_end:
          mov.w #failall, w0                 ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          dec.w w15,w15                      ; Pop parameters off the stack.
          HALT                               ; Halt the simulator if we get here.

Pass_end:
          mov.w #passall, w0                 ; Push the address of the string onto the stack.
          mov.w w0,[w15++]
          call _printf                       ; Call the stdio routine printf.
          dec.w w15,w15                      ; Pop parameters off the stack.
          HALT                               ; End of test set, Halt the simulator.
          .end
