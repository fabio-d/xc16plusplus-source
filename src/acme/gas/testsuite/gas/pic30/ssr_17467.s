; p30F6014.inc  Standard Include/Header File, Version 1.4
; (c) Copyright 2001 Microchip Technology, All rights reserved

.NOLIST

;******************************************************************************
;
; Important:
; ==========
; The processor must be selected before this file is included. The processor
; may  be selected in the following ways:
;
;       1. Command line switch:
;               C:\> AS -p30F6014
;       2. Placing a ".equ" directive before the ".include":
;               .equ __30F6014, 1
;               .include "p30F6014.inc"
;       3. Setting the processor in the MPLAB Project Dialog
;
; Notes:
; =========================
; 1. This include file defines useful bits of information for the
;    PIC30Fxxxx Family of Digital Signal Controllers (dsPIC).
; 2. The register and bit names used in this file are taken to match the
;    PIC30Fxxxx data sheets as closely as possible.
; 3. This file does not map special function register (SFR) names used in the
;    datasheet to memory locations in the PIC30Fxxxx device. The address
;    mapping for SFR names is done in the device linker script only.
; 4. This file maps bit names used in the datasheet to bit offsets/positions
;    in a word [0x000F(15) for the MS bit down to 0x0000(0) for the LS bit].
; 5. SFR bit definitions are listed in the ascending order of SFR memory
;    addresses and are grouped based on the module they belong to. For e.g.,the
;    Core SFR  bits are grouped separately from the Interrupt Controller SFR
;    bits or the  General Purpose Timer SFR bits.
;
; File Structure/Organization:
; ============================
; The sections in this file are organized as shown below:
;       1. Core section
;          Bit Position Definitions for some SFRS in the section
;       2. Interrupt section
;          Bit Position Definitions for some SFRS in the section
;       :
;       :
;       13. Peripheral x section
;          Bit Position Definitions for some SFRS in the section
;       :
;       :
;       N. Useful constants that ease assembly-level programming
;       N+1. Configuration Fuses and Macros
;
; Revision History:
; =================
; --------------------------------------------------------------------------
; Rev:   Date:        Details:                                      Who:
; --------------------------------------------------------------------------
; 1.0   27 Nov 2001   Device-specific .inc files from superset   h vasuki
; 1.1   13 Dec 2001   Added PMD, Changed SPI, UART, ADC + changes -do-
; 1.2   14 Dec 2001   Modified CORCON bits to reflect Rev C Core  -do-
; 1.3   20 Feb 2002   PMD, CORCON, A/D, RCON, INTCONx, NVMCON     -do-
; 1.4   18 Mar 2002   Renumbered bits for extended support to
;                     Bit-instructions+changes to configuration   -do-
;                     and QEI sections
; --------------------------------------------------------------------------
;
;******************************************************************************

;==============================================================================
;
; 1. Bit Position Definitions for Core SFRs
;
;==============================================================================
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
         .equiv SZ, 0x0001
         .equiv C, 0x0000

;------------------------------------------------------------------------------
;     CORCON - Core Configuration Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv EDT, 0x000A
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
;
;==============================================================================
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
         .equiv ADRERR, 0x0003
         .equiv STKERR, 0x0002
         .equiv OSCFAIL, 0x0001

;------------------------------------------------------------------------------
;     INTCON2 : Interrupt Control Register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ALTIVT, 0x000F


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
         .equiv BCLIF, 0x000E
         .equiv I2CIF, 0x000D
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
         .equiv BCLIE, 0x000E
         .equiv I2CIE, 0x000D
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
         .equiv BCLIP2, 0x000A
         .equiv BCLIP1, 0x0009
         .equiv BCLIP0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv I2CIP2, 0x0006
         .equiv I2CIP1, 0x0005
         .equiv I2CIP0, 0x0004
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
;
;==============================================================================
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
;
;==============================================================================
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
;
;==============================================================================
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
;
;==============================================================================
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
;
;==============================================================================

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
;
;==============================================================================
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
;     (SPIx)
;==============================================================================
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
         .equiv SBF, 0x0000

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
; 9. Codec/Data Converter Interface Module SFRs and Associated Bits Definition
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
; 10.  A/D Module Bit Position Definitions for SFRs
;
;==============================================================================
;------------------------------------------------------------------------------
;     ADCON1 : A/D Control Register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv ADON, 0x000F
         .equiv ADSIDL, 0x000D
         .equiv ADSTBY, 0x000C
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
         .equiv OFFCAL, 0x000C
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
; 11.  Port A: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 12.  Port B: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 13.  Port C: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 14.  Port D: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 15.  Port F: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 16.  Port G: General Purpose I/O Bit Position Definitions for SFRs
;
;==============================================================================
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
; 17. Controller Area Network (CAN) Module Bit Position Definitions for SFRs
;     for CAN Modules 1 and 2
;
;==============================================================================
;------------------------------------------------------------------------------
;     CAN m Module Standard Identifier Bits
;
;     Found in the following bytes                In registers
;                CmRXFnSIDH, CmRXFnSIDL                     CmRXFnSID
;                CmTXnSIDH, CmTXnSIDL                       CmTXnSID
;                CmRXMnSIDH, CmRXMnSIDL                     CmRXMnSID
;                CmRXnSIDH, CmRXnSIDL                       CmRXnSID
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
         .equiv RTR, 0x0003
         .equiv EXIDEN, 0x0002
         .equiv EXIDE, 0x0002
         .equiv EXID, 0x0002
         .equiv EID17, 0x0001
         .equiv EID16, 0x0000

;------------------------------------------------------------------------------
;     CAN Module m Extended Identifier Bits
;
;     Found in the following bytes                     In registers
;                CmRXFnEIDH, CmRXFnEIDL                         CmRXFnEID
;                CmTXnEIDH, CmTXnEIDL                           CmTXnEID
;                CmRXMnEIDH, CmRXMnEIDL                         CmRXMnEID
;                CmRXnEIDH, CmRXnEIDL                           CmRXnEID
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
;     CmTXnCON : CAN m module Transmit Buffer Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv DLC3, 0x0003
         .equiv DLC2, 0x0002
         .equiv DLC1, 0x0001
         .equiv DLC0, 0x0000
                          ;** Use same bit names for DLCx bits in CmRXnCON **

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv ABTF, 0x0006
         .equiv MLOA, 0x0005
         .equiv TXERR, 0x0004
         .equiv TXREQ, 0x0003
         .equiv TXPRI1, 0x0001
         .equiv TXPRI0, 0x0000

;------------------------------------------------------------------------------
;     CmRXnCON : CAN m module Receive Buffer Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
; ** DLCx bits already identified in CmTXnCON bit definition **

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv RXM1, 0x0006
         .equiv RXM0, 0x0005
         .equiv RXRTR, 0x0003
         .equiv FILHIT2, 0x0002
         .equiv BUKT1, 0x0002
         .equiv FILHIT1, 0x0001
         .equiv BUKT0, 0x0001
         .equiv FILHIT0, 0x0000

;------------------------------------------------------------------------------
;     CmCTRL : CAN m module Control and Status Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv REQOP2, 0x000F
         .equiv REQOP1, 0x000E
         .equiv REQOP0, 0x000D
         .equiv ABAT, 0x000C

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv OPMODE2, 0x0007
         .equiv OPMODE1, 0x0006
         .equiv OPMODE0, 0x0005
         .equiv ICODE2, 0x0003
         .equiv ICODE1, 0x0002
         .equiv ICODE0, 0x0001

;------------------------------------------------------------------------------
;     CmCFG1 : CAN m module baud rate configuration register 1
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv BRP9, 0x0009
         .equiv BRP8, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv BRP7, 0x0007
         .equiv BRP6, 0x0006
         .equiv BRP5, 0x0005
         .equiv BRP4, 0x0004
         .equiv BRP3, 0x0003
         .equiv BRP2, 0x0002
         .equiv BRP1, 0x0001
         .equiv BRP0, 0x0000

;------------------------------------------------------------------------------
;     CmCFG2 : CAN m module baud rate configuration register 2
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv TSTAMP, 0x000F
         .equiv WAKFIL, 0x000E
         .equiv SJWS1, 0x000C
         .equiv SJWS0, 0x000B
         .equiv PH2SEG2, 0x000A
         .equiv PH2SEG1, 0x0009
         .equiv PH2SEG0, 0x0008

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv BTLMODE, 0x0007
         .equiv SAM, 0x0006
         .equiv PH1SEG2, 0x0005
         .equiv PH1SEG1, 0x0004
         .equiv PH1SEG0, 0x0003
         .equiv PRSEG2, 0x0002
         .equiv PRSEG1, 0x0001
         .equiv PRSEG0, 0x0000

;------------------------------------------------------------------------------
;     CmINTF : CAN m module Interrupt Flag Register
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
; 18.  System Integration Block Bit Position Definitions for SFRs
;
;==============================================================================
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
; 19.  Non Volatile Memory Bit Position Definitions for SFRs
;
;==============================================================================
;------------------------------------------------------------------------------
;     NVMCON : Non Volatile Memory Control Register
;------------------------------------------------------------------------------
; High Byte (Odd Address)
; Bit Positions defined below:
         .equiv WR, 0x000F
         .equiv WREN, 0x000E
         .equiv WRERR, 0x000D

; Low Byte (Even Address)
; Bit Positions defined below:
         .equiv ERASE, 0x0006
         .equiv SEGSEL1, 0x0005
         .equiv SEGSEL0, 0x0004
         .equiv MEMSEL1, 0x0003
         .equiv MEMSEL0, 0x0002
         .equiv SIZSEL1, 0x0001
         .equiv SIZSEL0, 0x0000


;==============================================================================
;
; 20. Peripheral Module Disable Bit Position Definitions for SFRs
;
;==============================================================================
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
; 21. Useful constants that ease assembly-level programming
;
;==============================================================================
         .equiv SLEEP_MODE, 0x0000
         .equiv IDLE_MODE, 0x0001

;==============================================================================
;
; 22. Macros and Fuse Configuration Definitions
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
         .equiv WDT_OFF, 0xFFFE
         .equiv WDTPSA_1, 0xFF3F
         .equiv WDTPSA_8, 0xFF7F
         .equiv WDTPSA_64, 0xFFBF
         .equiv WDTPSA_512, 0xFFFF
         .equiv WDTPSB_1, 0xFFC3
         .equiv WDTPSB_2, 0xFFC7
         .equiv WDTPSB_3, 0xFFCB
         .equiv WDTPSB_4, 0xFFCF
         .equiv WDTPSB_5, 0xFFD3
         .equiv WDTPSB_6, 0xFFD7
         .equiv WDTPSB_7, 0xFFDB
         .equiv WDTPSB_8, 0xFFDF
         .equiv WDTPSB_9, 0xFFE3
         .equiv WDTPSB_10, 0xFFE7
         .equiv WDTPSB_11, 0xFFEB
         .equiv WDTPSB_12, 0xFFEF
         .equiv WDTPSB_13, 0xFFF3
         .equiv WDTPSB_14, 0xFFF7
         .equiv WDTPSB_15, 0xFFFB
         .equiv WDTPSB_16, 0xFFFF

;------------------------------------------------------------------------------
; FBORPOR: Brown-out and Power-on Reset Fuse
;------------------------------------------------------------------------------
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
        .section \REG, "x"
        .pword \VALUE
        .endm
; For e.g., to set the FOSC fuse using the macro above, the following line of
; code can be pasted at the only at the beginning of the assembly source code,
; immediately below the ".include" directive.
;
;        config __FOSC, CSW_FSCM_ON & EC_PLL16
;
; This would enable the external clock with the PLL set to 16x and further,
; enable clock switching and failsafe clock monitoring.
;
; Similarly, to set the FBORPOR fuse, paste the following :
;
;        config __FBORPOR, PBOR_ON & BORV_27 & PWRT_ON_64
;
; This would enable Brown-out Reset at 2.7 Volts and initialize the Power-up
; timer to 64 milliseconds.
; Given below, is a complete list of settings valid to each of the fuses:
; (Paste the ones relevant to your application at the beginning of the assembly
; source, immediately below the ".include" directive.)
;
;                FOSC:
;               ======
;               config __FOSC, CSW_FSCM_OFF & EC
;               config __FOSC, CSW_FSCM_OFF & EC_IO
;               config __FOSC, CSW_FSCM_OFF & EC_PLL4
;               config __FOSC, CSW_FSCM_OFF & EC_PLL8
;               config __FOSC, CSW_FSCM_OFF & EC_PLL16
;               config __FOSC, CSW_FSCM_OFF & ERC
;               config __FOSC, CSW_FSCM_OFF & ERC_IO
;               config __FOSC, CSW_FSCM_OFF & XT
;               config __FOSC, CSW_FSCM_OFF & XT_PLL4
;               config __FOSC, CSW_FSCM_OFF & XT_PLL8
;               config __FOSC, CSW_FSCM_OFF & XT_PLL16
;               config __FOSC, CSW_FSCM_OFF & XTL
;               config __FOSC, CSW_FSCM_OFF & HS
;               config __FOSC, CSW_FSCM_OFF & LP
;               config __FOSC, CSW_FSCM_OFF & FRC
;               config __FOSC, CSW_FSCM_OFF & LPRC
;               config __FOSC, CSW_ON_FSCM_OFF & EC
;               config __FOSC, CSW_ON_FSCM_OFF & EC_IO
;               config __FOSC, CSW_ON_FSCM_OFF & EC_PLL4
;               config __FOSC, CSW_ON_FSCM_OFF & EC_PLL8
;               config __FOSC, CSW_ON_FSCM_OFF & EC_PLL16
;               config __FOSC, CSW_ON_FSCM_OFF & ERC
;               config __FOSC, CSW_ON_FSCM_OFF & ERC_IO
;               config __FOSC, CSW_ON_FSCM_OFF & XT
;               config __FOSC, CSW_ON_FSCM_OFF & XT_PLL4
;               config __FOSC, CSW_ON_FSCM_OFF & XT_PLL8
;               config __FOSC, CSW_ON_FSCM_OFF & XT_PLL16
;               config __FOSC, CSW_ON_FSCM_OFF & XTL
;               config __FOSC, CSW_ON_FSCM_OFF & HS
;               config __FOSC, CSW_ON_FSCM_OFF & LP
;               config __FOSC, CSW_ON_FSCM_OFF & FRC
;               config __FOSC, CSW_ON_FSCM_OFF & LPRC
;               config __FOSC, CSW_FSCM_ON & EC
;               config __FOSC, CSW_FSCM_ON & EC_IO
;               config __FOSC, CSW_FSCM_ON & EC_PLL4
;               config __FOSC, CSW_FSCM_ON & EC_PLL8
;               config __FOSC, CSW_FSCM_ON & EC_PLL16
;               config __FOSC, CSW_FSCM_ON & ERC
;               config __FOSC, CSW_FSCM_ON & ERC_IO
;               config __FOSC, CSW_FSCM_ON & XT
;               config __FOSC, CSW_FSCM_ON & XT_PLL4
;               config __FOSC, CSW_FSCM_ON & XT_PLL8
;               config __FOSC, CSW_FSCM_ON & XT_PLL16
;               config __FOSC, CSW_FSCM_ON & XTL
;               config __FOSC, CSW_FSCM_ON & HS
;               config __FOSC, CSW_FSCM_ON & LP
;               config __FOSC, CSW_FSCM_ON & FRC
;               config __FOSC, CSW_FSCM_ON & LPRC
;
;               FWDT
;               =====
;               config __FWDT, WDT_OFF
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_1
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_2
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_3
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_4
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_5
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_6
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_7
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_8
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_9
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_10
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_11
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_12
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_13
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_14
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_15
;               config __FWDT, WDT_ON & WDTPSA_1 & WDTPSB_16
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_1
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_2
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_3
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_4
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_5
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_6
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_7
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_8
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_9
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_10
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_11
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_12
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_13
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_14
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_15
;               config __FWDT, WDT_ON & WDTPSA_8 & WDTPSB_16
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_1
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_2
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_3
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_4
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_5
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_6
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_7
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_8
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_9
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_10
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_11
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_12
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_13
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_14
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_15
;               config __FWDT, WDT_ON & WDTPSA_64 & WDTPSB_16
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_1
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_2
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_3
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_4
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_5
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_6
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_7
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_8
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_9
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_10
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_11
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_12
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_13
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_14
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_15
;               config __FWDT, WDT_ON & WDTPSA_512 & WDTPSB_16
;
;               FBORPOR
;               ========
;               config __FBORPOR, PBOR_OFF
;               config __FBORPOR, PBOR_ON & BORV_20 & PWRT_OFF
;               config __FBORPOR, PBOR_ON & BORV_27 & PWRT_OFF
;               config __FBORPOR, PBOR_ON & BORV_42 & PWRT_OFF
;               config __FBORPOR, PBOR_ON & BORV_45 & PWRT_OFF
;               config __FBORPOR, PBOR_ON & BORV_20 & PWRT_4
;               config __FBORPOR, PBOR_ON & BORV_27 & PWRT_4
;               config __FBORPOR, PBOR_ON & BORV_42 & PWRT_4
;               config __FBORPOR, PBOR_ON & BORV_45 & PWRT_4
;               config __FBORPOR, PBOR_ON & BORV_20 & PWRT_16
;               config __FBORPOR, PBOR_ON & BORV_27 & PWRT_16
;               config __FBORPOR, PBOR_ON & BORV_42 & PWRT_16
;               config __FBORPOR, PBOR_ON & BORV_45 & PWRT_16
;               config __FBORPOR, PBOR_ON & BORV_20 & PWRT_64
;               config __FBORPOR, PBOR_ON & BORV_27 & PWRT_64
;               config __FBORPOR, PBOR_ON & BORV_42 & PWRT_64
;               config __FBORPOR, PBOR_ON & BORV_45 & PWRT_64
;
;               FGS
;               ====
;               config __FGS, CODE_PROT_OFF
;               config __FGS, CODE_PROT_ON
;
;Setting configuration fuses without using macros:
;=================================================
; To set configuration fuses without using the "config" macro, use the following
; format:
;        .section __FOSC, "x"
;        .pword CSW_FSCM_ON & EC_PLL16
;
;------------------------------------------------------------------------------
.LIST



	.title Certification tests
	.sbttl subtitle1 test

	.data

	.text
main:

	BCLR.w 	CORCON, #EDT
	BCLR.w	CORCON+1, #2
	BCLR.w 	CORCON, #DL1
	BCLR.w	CORCON+1, #1
	BCLR.w	CORCON, #DL0
	BCLR.w	CORCON+1, #0

	BCLR.w	CORCON, #SATA
	BCLR.w	CORCON, #SATDW
	BCLR.w	CORCON, #ACCSAT
	BCLR.w	CORCON, #PSV
	BCLR.w	CORCON, #IF


	BSET.w 	CORCON, #EDT
	BSET.w	CORCON+1, #2
	BSET.w 	CORCON, #DL1
	BSET.w	CORCON+1, #1
	BSET.w	CORCON, #DL0
	BSET.w	CORCON+1, #0

	BSET.w	CORCON, #SATA
	BSET.w	CORCON, #SATDW
	BSET.w	CORCON, #ACCSAT
	BSET.w	CORCON, #PSV
	BSET.w	CORCON, #IF

	BTST.w 	CORCON, #EDT
	BTST.w	CORCON+1, #2
	BTST.w 	CORCON, #DL1
	BTST.w	CORCON+1, #1
	BTST.w	CORCON, #DL0
	BTST.w	CORCON+1, #0

	BTST.w	CORCON, #SATA
	BTST.w	CORCON, #SATDW
	BTST.w	CORCON, #ACCSAT
	BTST.w	CORCON, #PSV
	BTST.w	CORCON, #IF

	BTSTS.w	CORCON, #EDT
	BTSTS.w	CORCON+1, #2
	BTSTS.w	CORCON, #DL1
	BTSTS.w	CORCON+1, #1
	BTSTS.w	CORCON, #DL0
	BTSTS.w	CORCON+1, #0

	BTSTS.w	CORCON, #SATA
	BTSTS.w	CORCON, #SATDW
	BTSTS.w	CORCON, #ACCSAT
	BTSTS.w	CORCON, #PSV
	BTSTS.w	CORCON, #IF

	goto	main

	.end
