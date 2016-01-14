         .nolist
; The majority of the code in this source file is not required for the test.
; The actual certification test begins a the .list directive.  The remainder
; of the code in this file is to make the source file look more like a
; real executable application.         
         
         .macro HALT
            .pword 0xDA4000
         .endm
        .global __FWDT  
        .section  __FWDT,"x"
__FWDT:
        .word   WDT_OFF & WDTPSA_1 & WDTPSB_1
        
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
         .equiv SRL, _SR                        
         .equiv SRH, _SR+1                      
         .equiv CORCONL, _CORCON                
         .equiv MODCONL, _MODCON                
         .equiv MODCONH, _MODCON+1              
         .equiv XMODSRTL, _XMODSRT
         .equiv XMODSRTH, _XMODSRT+1
         .equiv XMODENDL, _XMODEND
         .equiv XMODENDH, _XMODEND+1
         .equiv YMODSRTL, _YMODSRT
         .equiv YMODSRTH, _YMODSRT+1
         .equiv YMODENDL, _YMODEND
         .equiv YMODENDH, _YMODEND+1
         .equiv XBREVL, _XBREV                  
         .equiv XBREVH, _XBREV+1
         .equiv DISICNTL, _DISICNT
         .equiv DISICNTH, _DISICNT+1
         .equiv OA, 0x000F
         .equiv OB, 0x000E
         .equiv SA, 0x000D
         .equiv SB, 0x000C
         .equiv OAB, 0x000B
         .equiv SAB, 0x000A
         .equiv DA, 0x0009
         .equiv DC, 0x0008
         .equiv IPL2, 0x0007
         .equiv IPL1, 0x0006
         .equiv IPL0, 0x0005
         .equiv RA, 0x0004
         .equiv N, 0x0003
         .equiv OV, 0x0002
         .equiv Z, 0x0001
         .equiv C, 0x0000
         .equiv EDT, 0x000B
         .equiv DL2, 0x000A
         .equiv DL1, 0x0009
         .equiv DL0, 0x0008
         .equiv SATA, 0x0007
         .equiv SATB, 0x0006
         .equiv SATDW, 0x0005
         .equiv ACCSAT, 0x0004
         .equiv IPL3, 0x0003
         .equiv PSV, 0x0002
         .equiv RND, 0x0001
         .equiv IF, 0x0000
         .equiv XMODEN, 0x000F
         .equiv YMODEN, 0x000E
         .equiv BREN, 0x000F
         .equiv INTCON1H, _INTCON1+1           
         .equiv INTCON1L, _INTCON1       
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
         .equiv NSTDIS, 0x000F
         .equiv OVATE, 0x000A
         .equiv OVBTE, 0x0009
         .equiv COVTE, 0x0008
         .equiv SECUREFLT, 0x0005
         .equiv MATHERR, 0x0004
         .equiv ADDRERR, 0x0003
         .equiv STKERR, 0x0002
         .equiv OSCFAIL, 0x0001
         .equiv ALTIVT, 0x000F
         .equiv DISI, 0x000E
         .equiv INT4EP, 0x0004
         .equiv INT3EP, 0x0003
         .equiv INT2EP, 0x0002
         .equiv INT1EP, 0x0001
         .equiv INT0EP, 0x0000
         .equiv CNIF, 0x000F
         .equiv MI2CIF, 0x000E
         .equiv SI2CIF, 0x000D
         .equiv NVMIF, 0x000C
         .equiv ADIF, 0x000B
         .equiv U1TXIF, 0x000A
         .equiv U1RXIF, 0x0009
         .equiv SPI1IF, 0x0008
         .equiv T3IF, 0x0007
         .equiv T2IF, 0x0006
         .equiv OC2IF, 0x0005
         .equiv IC2IF, 0x0004
         .equiv T1IF, 0x0003
         .equiv OC1IF, 0x0002
         .equiv IC1IF, 0x0001
         .equiv INT0IF, 0x0000
         .equiv IC6IF, 0x000F
         .equiv IC5IF, 0x000E
         .equiv IC4IF, 0x000D
         .equiv IC3IF, 0x000C
         .equiv C1IF, 0x000B
         .equiv SPI2IF, 0x000A
         .equiv U2TXIF, 0x0009
         .equiv U2RXIF, 0x0008
         .equiv INT2IF, 0x0007
         .equiv T5IF, 0x0006
         .equiv T4IF, 0x0005
         .equiv OC4IF, 0x0004
         .equiv OC3IF, 0x0003
         .equiv IC8IF, 0x0002
         .equiv IC7IF, 0x0001
         .equiv INT1IF, 0x0000
         .equiv LVDIF, 0x000A
         .equiv DCIIF, 0x0009
         .equiv C2IF, 0x0006
         .equiv INT4IF, 0x0005
         .equiv INT3IF, 0x0004
         .equiv OC8IF, 0x0003
         .equiv OC7IF, 0x0002
         .equiv OC6IF, 0x0001
         .equiv OC5IF, 0x0000
         .equiv CNIE, 0x000F
         .equiv MI2CIE, 0x000E
         .equiv SI2CIE, 0x000D
         .equiv NVMIE, 0x000C
         .equiv ADIE, 0x000B
         .equiv U1TXIE, 0x000A
         .equiv U1RXIE, 0x0009
         .equiv SPI1IE, 0x0008
         .equiv T3IE, 0x0007
         .equiv T2IE, 0x0006
         .equiv OC2IE, 0x0005
         .equiv IC2IE, 0x0004
         .equiv T1IE, 0x0003
         .equiv OC1IE, 0x0002
         .equiv IC1IE, 0x0001
         .equiv INT0IE, 0x0000
         .equiv IC6IE, 0x000F
         .equiv IC5IE, 0x000E
         .equiv IC4IE, 0x000D
         .equiv IC3IE, 0x000C
         .equiv C1IE, 0x000B
         .equiv SPI2IE, 0x000A
         .equiv U2TXIE, 0x0009
         .equiv U2RXIE, 0x0008
         .equiv INT2IE, 0x0007
         .equiv T5IE, 0x0006
         .equiv T4IE, 0x0005
         .equiv OC4IE, 0x0004
         .equiv OC3IE, 0x0003
         .equiv IC8IE, 0x0002
         .equiv IC7IE, 0x0001
         .equiv INT1IE, 0x0000
         .equiv LVDIE, 0x000A
         .equiv DCIIE, 0x0009
         .equiv C2IE, 0x0006
         .equiv INT4IE, 0x0005
         .equiv INT3IE, 0x0004
         .equiv OC8IE, 0x0003
         .equiv OC7IE, 0x0002
         .equiv OC6IE, 0x0001
         .equiv OC5IE, 0x0000
         .equiv T1IP2, 0x000E
         .equiv T1IP1, 0x000D
         .equiv T1IP0, 0x000C
         .equiv OC1IP2, 0x000A
         .equiv OC1IP1, 0x0009
         .equiv OC1IP0, 0x0008
         .equiv IC1IP2, 0x0006
         .equiv IC1IP1, 0x0005
         .equiv IC1IP0, 0x0004
         .equiv INT0IP2, 0x0002
         .equiv INT0IP1, 0x0001
         .equiv INT0IP0, 0x0000
         .equiv T3IP2, 0x000E
         .equiv T3IP1, 0x000D
         .equiv T3IP0, 0x000C
         .equiv T2IP2, 0x000A
         .equiv T2IP1, 0x0009
         .equiv T2IP0, 0x0008
         .equiv OC2IP2, 0x0006
         .equiv OC2IP1, 0x0005
         .equiv OC2IP0, 0x0004
         .equiv IC2IP2, 0x0002
         .equiv IC2IP1, 0x0001
         .equiv IC2IP0, 0x0000
         .equiv ADIP2, 0x000E
         .equiv ADIP1, 0x000D
         .equiv ADIP0, 0x000C
         .equiv U1TXIP2, 0x000A
         .equiv U1TXIP1, 0x0009
         .equiv U1TXIP0, 0x0008
         .equiv U1RXIP2, 0x0006
         .equiv U1RXIP1, 0x0005
         .equiv U1RXIP0, 0x0004
         .equiv SPI1IP2, 0x0002
         .equiv SPI1IP1, 0x0001
         .equiv SPI1IP0, 0x0000
         .equiv CNIP2, 0x000E
         .equiv CNIP1, 0x000D
         .equiv CNIP0, 0x000C
         .equiv MI2CIP2, 0x000A
         .equiv MI2CIP1, 0x0009
         .equiv MI2CIP0, 0x0008
         .equiv SI2CIP2, 0x0006
         .equiv SI2CIP1, 0x0005
         .equiv SI2CIP0, 0x0004
         .equiv NVMIP2, 0x0002
         .equiv NVMIP1, 0x0001
         .equiv NVMIP0, 0x0000
         .equiv OC3IP2, 0x000E
         .equiv OC3IP1, 0x000D
         .equiv OC3IP0, 0x000C
         .equiv IC8IP2, 0x000A
         .equiv IC8IP1, 0x0009
         .equiv IC8IP0, 0x0008
         .equiv IC7IP2, 0x0006
         .equiv IC7IP1, 0x0005
         .equiv IC7IP0, 0x0004
         .equiv INT1IP2, 0x0002
         .equiv INT1IP1, 0x0001
         .equiv INT1IP0, 0x0000
         .equiv INT2IP2, 0x000E
         .equiv INT2IP1, 0x000D
         .equiv INT2IP0, 0x000C
         .equiv T5IP2, 0x000A
         .equiv T5IP1, 0x0009
         .equiv T5IP0, 0x0008
         .equiv T4IP2, 0x0006
         .equiv T4IP1, 0x0005
         .equiv T4IP0, 0x0004
         .equiv OC4IP2, 0x0002
         .equiv OC4IP1, 0x0001
         .equiv OC4IP0, 0x0000
         .equiv C1IP2, 0x000E
         .equiv C1IP1, 0x000D
         .equiv C1IP0, 0x000C
         .equiv SPI2IP2, 0x000A
         .equiv SPI2IP1, 0x0009
         .equiv SPI2IP0, 0x0008
         .equiv U2TXIP2, 0x0006
         .equiv U2TXIP1, 0x0005
         .equiv U2TXIP0, 0x0004
         .equiv U2RXIP2, 0x0002
         .equiv U2RXIP1, 0x0001
         .equiv U2RXIP0, 0x0000
         .equiv IC6IP2, 0x000E
         .equiv IC6IP1, 0x000D
         .equiv IC6IP0, 0x000C
         .equiv IC5IP2, 0x000A
         .equiv IC5IP1, 0x0009
         .equiv IC5IP0, 0x0008
         .equiv IC4IP2, 0x0006
         .equiv IC4IP1, 0x0005
         .equiv IC4IP0, 0x0004
         .equiv IC3IP2, 0x0002
         .equiv IC3IP1, 0x0001
         .equiv IC3IP0, 0x0000
         .equiv OC8IP2, 0x000E
         .equiv OC8IP1, 0x000D
         .equiv OC8IP0, 0x000C
         .equiv OC7IP2, 0x000A
         .equiv OC7IP1, 0x0009
         .equiv OC7IP0, 0x0008
         .equiv OC6IP2, 0x0006
         .equiv OC6IP1, 0x0005
         .equiv OC6IP0, 0x0004
         .equiv OC5IP2, 0x0002
         .equiv OC5IP1, 0x0001
         .equiv OC5IP0, 0x0000
         .equiv C2IP2, 0x000A
         .equiv C2IP1, 0x0009
         .equiv C2IP0, 0x0008
         .equiv INT4IP2, 0x0006
         .equiv INT4IP1, 0x0005
         .equiv INT4IP0, 0x0004
         .equiv INT3IP2, 0x0002
         .equiv INT3IP1, 0x0001
         .equiv INT3IP0, 0x0000
         .equiv LVDIP2, 0x000A
         .equiv LVDIP1, 0x0009
         .equiv LVDIP0, 0x0008
         .equiv DCIIP2, 0x0006
         .equiv DCIIP1, 0x0005
         .equiv DCIIP0, 0x0004
         .equiv CNEN1L, _CNEN1                  
         .equiv CNEN1H, _CNEN1+1                
         .equiv CNEN2L, _CNEN2
         .equiv CNEN2H, _CNEN2+1
         .equiv CNPU1L, _CNPU1
         .equiv CNPU1H, _CNPU1+1
         .equiv CNPU2L, _CNPU2
         .equiv CNPU2H, _CNPU2+1
         .equiv CN15IE, 0x000F
         .equiv CN14IE, 0x000E
         .equiv CN13IE, 0x000D
         .equiv CN12IE, 0x000C
         .equiv CN11IE, 0x000B
         .equiv CN10IE, 0x000A
         .equiv CN9IE, 0x0009
         .equiv CN8IE, 0x0008
         .equiv CN7IE, 0x0007
         .equiv CN6IE, 0x0006
         .equiv CN5IE, 0x0005
         .equiv CN4IE, 0x0004
         .equiv CN3IE, 0x0003
         .equiv CN2IE, 0x0002
         .equiv CN1IE, 0x0001
         .equiv CN0IE, 0x0000
         .equiv CN23IE, 0x0007
         .equiv CN22IE, 0x0006
         .equiv CN21IE, 0x0005
         .equiv CN20IE, 0x0004
         .equiv CN19IE, 0x0003
         .equiv CN18IE, 0x0002
         .equiv CN17IE, 0x0001
         .equiv CN16IE, 0x0000
         .equiv CN15PUE, 0x000F
         .equiv CN14PUE, 0x000E
         .equiv CN13PUE, 0x000D
         .equiv CN12PUE, 0x000C
         .equiv CN11PUE, 0x000B
         .equiv CN10PUE, 0x000A
         .equiv CN9PUE, 0x0009
         .equiv CN8PUE, 0x0008
         .equiv CN7PUE, 0x0007
         .equiv CN6PUE, 0x0006
         .equiv CN5PUE, 0x0005
         .equiv CN4PUE, 0x0004
         .equiv CN3PUE, 0x0003
         .equiv CN2PUE, 0x0002
         .equiv CN1PUE, 0x0001
         .equiv CN0PUE, 0x0000
         .equiv CN23PUE, 0x0007
         .equiv CN22PUE, 0x0006
         .equiv CN21PUE, 0x0005
         .equiv CN20PUE, 0x0004
         .equiv CN19PUE, 0x0003
         .equiv CN18PUE, 0x0002
         .equiv CN17PUE, 0x0001
         .equiv CN16PUE, 0x0000
         .equiv TMR1L, _TMR1
         .equiv TMR1H, _TMR1+1
         .equiv PR1L, _PR1
         .equiv PR1H, _PR1+1
         .equiv T1CONL, _T1CON                  
         .equiv T1CONH, _T1CON+1                
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
         .equiv T2CONL, _T2CON                  
         .equiv T2CONH, _T2CON+1                
         .equiv T3CONL, _T3CON                  
         .equiv T3CONH, _T3CON+1
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
         .equiv T4CONL, _T4CON                  
         .equiv T4CONH, _T4CON+1                
         .equiv T5CONL, _T5CON                  
         .equiv T5CONH, _T5CON+1
         .equiv TON, 0x000F
         .equiv TSIDL, 0x000D
         .equiv TGATE, 0x0006
         .equiv TCKPS1, 0x0005
         .equiv TCKPS0, 0x0004
         .equiv T32, 0x0003        
         .equiv TSYNC, 0x0002
         .equiv TCS, 0x0001
         .equiv IC1BUFL, _IC1BUF
         .equiv IC1BUFH, _IC1BUF+1
         .equiv IC1CONL, _IC1CON                
         .equiv IC1CONH, _IC1CON+1              
         .equiv IC2BUFL, _IC2BUF
         .equiv IC2BUFH, _IC2BUF+1
         .equiv IC2CONL, _IC2CON                
         .equiv IC2CONH, _IC2CON+1              
         .equiv IC3BUFL, _IC3BUF
         .equiv IC3BUFH, _IC3BUF+1
         .equiv IC3CONL, _IC3CON                
         .equiv IC3CONH, _IC3CON+1              
         .equiv IC4BUFL, _IC4BUF
         .equiv IC4BUFH, _IC4BUF+1
         .equiv IC4CONL, _IC4CON                
         .equiv IC4CONH, _IC4CON+1              
         .equiv IC5BUFL, _IC5BUF
         .equiv IC5BUFH, _IC5BUF+1
         .equiv IC5CONL, _IC5CON                
         .equiv IC5CONH, _IC5CON+1              
         .equiv IC6BUFL, _IC6BUF
         .equiv IC6BUFH, _IC6BUF+1
         .equiv IC6CONL, _IC6CON                
         .equiv IC6CONH, _IC6CON+1              
         .equiv IC7BUFL, _IC7BUF
         .equiv IC7BUFH, _IC7BUF+1
         .equiv IC7CONL, _IC7CON                
         .equiv IC7CONH, _IC7CON+1              
         .equiv IC8BUFL, _IC8BUF
         .equiv IC8BUFH, _IC8BUF+1
         .equiv IC8CONL, _IC8CON                
         .equiv IC8CONH, _IC8CON+1              
         .equiv ICSIDL, 0x000D
         .equiv ICTMR, 0x0007
         .equiv ICI1, 0x0006
         .equiv ICI0, 0x0005
         .equiv ICOV, 0x0004
         .equiv ICBNE, 0x0003
         .equiv ICM2, 0x0002
         .equiv ICM1, 0x0001
         .equiv ICM0, 0x0000
         .equiv OC1RSL, _OC1RS
         .equiv OC1RSH, _OC1RS+1
         .equiv OC1RL, _OC1R
         .equiv OC1RH, _OC1R+1
         .equiv OC1CONL, _OC1CON                
         .equiv OC1CONH, _OC1CON+1              
         .equiv OC2RSL, _OC2RS
         .equiv OC2RSH, _OC2RS+1
         .equiv OC2RL, _OC2R
         .equiv OC2RH, _OC2R+1
         .equiv OC2CONL, _OC2CON                
         .equiv OC2CONH, _OC2CON+1              
         .equiv OC3RSL, _OC3RS
         .equiv OC3RSH, _OC3RS+1
         .equiv OC3RL, _OC3R
         .equiv OC3RH, _OC3R+1
         .equiv OC3CONL, _OC3CON                
         .equiv OC3CONH, _OC3CON+1              
         .equiv OC4RSL, _OC4RS
         .equiv OC4RSH, _OC4RS+1
         .equiv OC4RL, _OC4R
         .equiv OC4RH, _OC4R+1
         .equiv OC4CONL, _OC4CON                
         .equiv OC4CONH, _OC4CON+1              
         .equiv OC5RSL, _OC5RS
         .equiv OC5RSH, _OC5RS+1
         .equiv OC5RL, _OC5R
         .equiv OC5RH, _OC5R+1
         .equiv OC5CONL, _OC5CON                
         .equiv OC5CONH, _OC5CON+1              
         .equiv OC6RSL, _OC6RS
         .equiv OC6RSH, _OC6RS+1
         .equiv OC6RL, _OC6R
         .equiv OC6RH, _OC6R+1
         .equiv OC6CONL, _OC6CON                
         .equiv OC6CONH, _OC6CON+1              
         .equiv OC7RSL, _OC7RS
         .equiv OC7RSH, _OC7RS+1
         .equiv OC7RL, _OC7R
         .equiv OC7RH, _OC7R+1
         .equiv OC7CONL, _OC7CON                
         .equiv OC7CONH, _OC7CON+1              
         .equiv OC8RSL, _OC8RS
         .equiv OC8RSH, _OC8RS+1
         .equiv OC8RL, _OC8R
         .equiv OC8RH, _OC8R+1
         .equiv OC8CONL, _OC8CON                
         .equiv OC8CONH, _OC8CON+1              
         .equiv OCSIDL, 0x000D
         .equiv OCFLT, 0x0004
         .equiv OCTSEL, 0x0003
         .equiv OCM2, 0x0002
         .equiv OCM1, 0x0001
         .equiv OCM0, 0x0000
         .equiv I2CRCVL, _I2CRCV
         .equiv I2CRCVH, _I2CRCV+1
         .equiv I2CTRNL, _I2CTRN
         .equiv I2CTRNH, _I2CTRN+1
         .equiv I2CBRGL, _I2CBRG
         .equiv I2CBRGH, _I2CBRG+1
         .equiv I2CCONL, _I2CCON                
         .equiv I2CCONH, _I2CCON+1              
         .equiv I2CSTATL, _I2CSTAT              
         .equiv I2CSTATH, _I2CSTAT+1            
         .equiv I2CADDL, _I2CADD
         .equiv I2CADDH, _I2CADD+1
         .equiv I2CEN, 0x000F
         .equiv I2CSIDL, 0x000D
         .equiv SCLREL, 0x000C
         .equiv IPMIEN, 0x000B
         .equiv A10M, 0x000A
         .equiv DISSLW, 0x0009
         .equiv SMEN, 0x0008
         .equiv GCEN, 0x0007
         .equiv STREN, 0x0006
         .equiv ACKDT, 0x0005
         .equiv ACKEN, 0x0004
         .equiv RCEN, 0x0003
         .equiv PEN, 0x0002
         .equiv RSEN, 0x0001
         .equiv SEN, 0x0000
         .equiv ACKSTAT, 0x000F
         .equiv TRSTAT, 0x000E
         .equiv BCL, 0x000A
         .equiv GCSTAT, 0x0009
         .equiv ADD10, 0x0008
         .equiv IWCOL, 0x0007
         .equiv I2COV, 0x0006
         .equiv D_A, 0x0005
         .equiv P, 0x0004
         .equiv S, 0x0003
         .equiv R_W, 0x0002
         .equiv RBF, 0x0001
         .equiv TBF, 0x0000
         .equiv U1MODEL, _U1MODE                
         .equiv U1MODEH, _U1MODE+1              
         .equiv U1STAL, _U1STA                  
         .equiv U1STAH, _U1STA+1                
         .equiv U1TXREGL, _U1TXREG
         .equiv U1TXREGH, _U1TXREG+1
         .equiv U1RXREGL, _U1RXREG
         .equiv U1RXREGH, _U1RXREG+1
         .equiv U1BRGL, _U1BRG
         .equiv U1BRGH, _U1BRG+1
         .equiv U2MODEL, _U2MODE                
         .equiv U2MODEH, _U2MODE+1              
         .equiv U2STAL, _U2STA                  
         .equiv U2STAH, _U2STA+1                
         .equiv U2TXREGL, _U2TXREG
         .equiv U2TXREGH, _U2TXREG+1
         .equiv U2RXREGL, _U2RXREG
         .equiv U2RXREGH, _U2RXREG+1
         .equiv U2BRGL, _U2BRG
         .equiv U2BRGH, _U2BRG+1
         .equiv UARTEN, 0x000F
         .equiv USIDL, 0x000D
         .equiv ALTIO, 0x000A
         .equiv WAKE, 0x0007
         .equiv LPBACK, 0x0006
         .equiv ABAUD, 0x0005
         .equiv PDSEL1, 0x0002
         .equiv PDSEL0, 0x0001
         .equiv STSEL, 0x0000
         .equiv UTXISEL, 0x000F
         .equiv UTXBRK, 0x000B
         .equiv UTXEN, 0x000A
         .equiv UTXBF, 0x0009
         .equiv TRMT, 0x0008
         .equiv URXISEL1, 0x0007
         .equiv URXISEL0, 0x0006
         .equiv ADDEN, 0x0005
         .equiv RIDLE, 0x0004
         .equiv PERR, 0x0003
         .equiv FERR, 0x0002
         .equiv OERR, 0x0001
         .equiv URXDA, 0x0000
         .equiv SPI1STATL, _SPI1STAT    
         .equiv SPI1STATH, _SPI1STAT+1  
         .equiv SPI1CONL, _SPI1CON      
         .equiv SPI1CONH, _SPI1CON+1    
         .equiv SPI1BUFL, _SPI1BUF
         .equiv SPI1BUFH, _SPI1BUF+1
         .equiv SPI2STATL, _SPI2STAT    
         .equiv SPI2STATH, _SPI2STAT+1  
         .equiv SPI2CONL, _SPI2CON      
         .equiv SPI2CONH, _SPI2CON+1    
         .equiv SPI2BUFL, _SPI2BUF
         .equiv SPI2BUFH, _SPI2BUF+1
         .equiv SPIEN, 0x000F
         .equiv SPISIDL, 0x000D
         .equiv SPIROV, 0x0006
         .equiv SPITBF, 0x0001
         .equiv SPIRBF, 0x0000
         .equiv FRMEN, 0x000E
         .equiv SPIFSD, 0x000D
         .equiv DISSDO, 0x000B
         .equiv MODE16, 0x000A
         .equiv SMP, 0x0009
         .equiv CKE, 0x0008
         .equiv SSEN, 0x0007
         .equiv CKP, 0x0006
         .equiv MSTEN, 0x0005
         .equiv SPRE2, 0x0004
         .equiv SPRE1, 0x0003
         .equiv SPRE0, 0x0002
         .equiv PPRE1, 0x0001
         .equiv PPRE0, 0x0000
         .equiv DCIEN, 0x000F
         .equiv DCISIDL, 0x000D
         .equiv DLOOP, 0x000B
         .equiv CSCKD, 0x000A
         .equiv CSCKE, 0x0009
         .equiv COFSD, 0x0008
         .equiv UNFM, 0x0007
         .equiv CSDOM, 0x0006
         .equiv DJST, 0x0005
         .equiv COFSM1, 0x0001
         .equiv COFSM0, 0x0000
         .equiv BLEN1, 0x000B
         .equiv BLEN0, 0x000A
         .equiv COFSG3, 0x0008
         .equiv COFSG2, 0x0007
         .equiv COFSG1, 0x0006
         .equiv COFSG0, 0x0005
         .equiv WS3, 0x0003
         .equiv WS2, 0x0002
         .equiv WS1, 0x0001
         .equiv WS0, 0x0000
         .equiv BCG11, 0x000B
         .equiv BCG10, 0x000A
         .equiv BCG9, 0x0009
         .equiv BCG8, 0x0008
         .equiv BCG7, 0x0007
         .equiv BCG6, 0x0006
         .equiv BCG5, 0x0005
         .equiv BCG4, 0x0004
         .equiv BCG3, 0x0003
         .equiv BCG2, 0x0002
         .equiv BCG1, 0x0001
         .equiv BCG0, 0x0000
         .equiv SLOT3, 0x000B
         .equiv SLOT2, 0x000A
         .equiv SLOT1, 0x0009
         .equiv SLOT0, 0x0008
         .equiv ROV, 0x0003
         .equiv RFUL, 0x0002
         .equiv TUNF, 0x0001
         .equiv TMPTY, 0x0000
         .equiv TSE15, 0x000F
         .equiv TSE14, 0x000E
         .equiv TSE13, 0x000D
         .equiv TSE12, 0x000C
         .equiv TSE11, 0x000B
         .equiv TSE10, 0x000A
         .equiv TSE9, 0x0009
         .equiv TSE8, 0x0008
         .equiv TSE7, 0x0007
         .equiv TSE6, 0x0006
         .equiv TSE5, 0x0005
         .equiv TSE4, 0x0004
         .equiv TSE3, 0x0003
         .equiv TSE2, 0x0002
         .equiv TSE1, 0x0001
         .equiv TSE0, 0x0000
         .equiv RSE15, 0x000F
         .equiv RSE14, 0x000E
         .equiv RSE13, 0x000D
         .equiv RSE12, 0x000C
         .equiv RSE11, 0x000B
         .equiv RSE10, 0x000A
         .equiv RSE9, 0x0009
         .equiv RSE8, 0x0008
         .equiv RSE7, 0x0007
         .equiv RSE6, 0x0006
         .equiv RSE5, 0x0005
         .equiv RSE4, 0x0004
         .equiv RSE3, 0x0003
         .equiv RSE2, 0x0002
         .equiv RSE1, 0x0001
         .equiv RSE0, 0x0000
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
         .equiv ADCON1L, _ADCON1                
         .equiv ADCON1H, _ADCON1+1              
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
         .equiv ADON, 0x000F
         .equiv ADSIDL, 0x000D
         .equiv FORM1, 0x0009
         .equiv FORM0, 0x0008
         .equiv SSRC2, 0x0007
         .equiv SSRC1, 0x0006
         .equiv SSRC0, 0x0005
         .equiv ASAM, 0x0002
         .equiv SAMP, 0x0001
         .equiv CONV, 0x0000
         .equiv VCFG2, 0x000F
         .equiv VCFG1, 0x000E
         .equiv VCFG0, 0x000D
         .equiv CSCNA, 0x000A
         .equiv BUFS, 0x0007
         .equiv SMPI3, 0x0005
         .equiv SMPI2, 0x0004
         .equiv SMPI1, 0x0003
         .equiv SMPI0, 0x0002
         .equiv BUFM, 0x0001
         .equiv ALTS, 0x0000
         .equiv SAMC4, 0x000C
         .equiv SAMC3, 0x000B
         .equiv SAMC2, 0x000A
         .equiv SAMC1, 0x0009
         .equiv SAMC0, 0x0008
         .equiv ADRC, 0x0007
         .equiv ADCS5, 0x0005
         .equiv ADCS4, 0x0004
         .equiv ADCS3, 0x0003
         .equiv ADCS2, 0x0002
         .equiv ADCS1, 0x0001
         .equiv ADCS0, 0x0000
         .equiv CH0NB, 0x000C
         .equiv CH0SB3, 0x000B
         .equiv CH0SB2, 0x000A
         .equiv CH0SB1, 0x0009
         .equiv CH0SB0, 0x0008
         .equiv CH0NA, 0x0004
         .equiv CH0SA3, 0x0003
         .equiv CH0SA2, 0x0002
         .equiv CH0SA1, 0x0001
         .equiv CH0SA0, 0x0000
         .equiv CSSL15, 0x000F
         .equiv CSSL14, 0x000E
         .equiv CSSL13, 0x000D
         .equiv CSSL12, 0x000C
         .equiv CSSL11, 0x000B
         .equiv CSSL10, 0x000A
         .equiv CSSL9, 0x0009
         .equiv CSSL8, 0x0008
         .equiv CSSL7, 0x0007
         .equiv CSSL6, 0x0006
         .equiv CSSL5, 0x0005
         .equiv CSSL4, 0x0004
         .equiv CSSL3, 0x0003
         .equiv CSSL2, 0x0002
         .equiv CSSL1, 0x0001
         .equiv CSSL0, 0x0000
         .equiv PCFG15, 0x000F
         .equiv PCFG14, 0x000E
         .equiv PCFG13, 0x000D
         .equiv PCFG12, 0x000C
         .equiv PCFG11, 0x000B
         .equiv PCFG10, 0x000A
         .equiv PCFG9, 0x0009
         .equiv PCFG8, 0x0008
         .equiv PCFG7, 0x0007
         .equiv PCFG6, 0x0006
         .equiv PCFG5, 0x0005
         .equiv PCFG4, 0x0004
         .equiv PCFG3, 0x0003
         .equiv PCFG2, 0x0002
         .equiv PCFG1, 0x0001
         .equiv PCFG0, 0x0000
         .equiv TRISAL, _TRISA                  
         .equiv TRISAH, _TRISA+1                
         .equiv PORTAL, _PORTA
         .equiv PORTAH, _PORTA+1
         .equiv LATAL, _LATA
         .equiv LATAH, _LATA+1
         .equiv TRISA15, 0x000F
         .equiv TRISA14, 0x000E
         .equiv TRISA13, 0x000D
         .equiv TRISA12, 0x000C
         .equiv TRISA10, 0x000A
         .equiv TRISA9, 0x0009
         .equiv TRISA7, 0x0007
         .equiv TRISA6, 0x0006
         .equiv RA15, 0x000F
         .equiv RA14, 0x000E
         .equiv RA13, 0x000D
         .equiv RA12, 0x000C
         .equiv RA10, 0x000A
         .equiv RA9, 0x0009
         .equiv RA7, 0x0007
         .equiv RA6, 0x0006
         .equiv LATA15, 0x000F
         .equiv LATA14, 0x000E
         .equiv LATA13, 0x000D
         .equiv LATA12, 0x000C
         .equiv LATA10, 0x000A
         .equiv LATA9, 0x0009
         .equiv LATA7, 0x0007
         .equiv LATA6, 0x0006
         .equiv TRISBL, _TRISB                  
         .equiv TRISBH, _TRISB+1                
         .equiv PORTBL, _PORTB
         .equiv PORTBH, _PORTB+1
         .equiv LATBL, _LATB
         .equiv LATBH, _LATB+1
         .equiv TRISB15, 0x000F
         .equiv TRISB14, 0x000E
         .equiv TRISB13, 0x000D
         .equiv TRISB12, 0x000C
         .equiv TRISB11, 0x000B
         .equiv TRISB10, 0x000A
         .equiv TRISB9, 0x0009
         .equiv TRISB8, 0x0008
         .equiv TRISB7, 0x0007
         .equiv TRISB6, 0x0006
         .equiv TRISB5, 0x0005
         .equiv TRISB4, 0x0004
         .equiv TRISB3, 0x0003
         .equiv TRISB2, 0x0002
         .equiv TRISB1, 0x0001
         .equiv TRISB0, 0x0000
         .equiv RB15, 0x000F
         .equiv RB14, 0x000E
         .equiv RB13, 0x000D
         .equiv RB12, 0x000C
         .equiv RB11, 0x000B
         .equiv RB10, 0x000A
         .equiv RB9, 0x0009
         .equiv RB8, 0x0008
         .equiv RB7, 0x0007
         .equiv RB6, 0x0006
         .equiv RB5, 0x0005
         .equiv RB4, 0x0004
         .equiv RB3, 0x0003
         .equiv RB2, 0x0002
         .equiv RB1, 0x0001
         .equiv RB0, 0x0000
         .equiv LATB15, 0x000F
         .equiv LATB14, 0x000E
         .equiv LATB13, 0x000D
         .equiv LATB12, 0x000C
         .equiv LATB11, 0x000B
         .equiv LATB10, 0x000A
         .equiv LATB9, 0x0009
         .equiv LATB8, 0x0008
         .equiv LATB7, 0x0007
         .equiv LATB6, 0x0006
         .equiv LATB5, 0x0005
         .equiv LATB4, 0x0004
         .equiv LATB3, 0x0003
         .equiv LATB2, 0x0002
         .equiv LATB1, 0x0001
         .equiv LATB0, 0x0000
         .equiv TRISCL, _TRISC                  
         .equiv TRISCH, _TRISC+1                
         .equiv PORTCL, _PORTC
         .equiv PORTCH, _PORTC+1
         .equiv LATCL, _LATC
         .equiv LATCH, _LATC+1
         .equiv TRISC15, 0x000F
         .equiv TRISC14, 0x000E
         .equiv TRISC13, 0x000D
         .equiv TRISC4, 0x0004
         .equiv TRISC3, 0x0003
         .equiv TRISC2, 0x0002
         .equiv TRISC1, 0x0001
         .equiv RC15, 0x000F
         .equiv RC14, 0x000E
         .equiv RC13, 0x000D
         .equiv RC4, 0x0004
         .equiv RC3, 0x0003
         .equiv RC2, 0x0002
         .equiv RC1, 0x0001
         .equiv LATC15, 0x000F
         .equiv LATC14, 0x000E
         .equiv LATC13, 0x000D
         .equiv LATC4, 0x0004
         .equiv LATC3, 0x0003
         .equiv LATC2, 0x0002
         .equiv LATC1, 0x0001
         .equiv TRISDL, _TRISD                  
         .equiv TRISDH, _TRISD+1                
         .equiv PORTDL, _PORTD
         .equiv PORTDH, _PORTD+1
         .equiv LATDL, _LATD
         .equiv LATDH, _LATD+1
         .equiv TRISD15, 0x000F
         .equiv TRISD14, 0x000E
         .equiv TRISD13, 0x000D
         .equiv TRISD12, 0x000C
         .equiv TRISD11, 0x000B
         .equiv TRISD10, 0x000A
         .equiv TRISD9, 0x0009
         .equiv TRISD8, 0x0008
         .equiv TRISD7, 0x0007
         .equiv TRISD6, 0x0006
         .equiv TRISD5, 0x0005
         .equiv TRISD4, 0x0004
         .equiv TRISD3, 0x0003
         .equiv TRISD2, 0x0002
         .equiv TRISD1, 0x0001
         .equiv TRISD0, 0x0000
         .equiv RD15, 0x000F
         .equiv RD14, 0x000E
         .equiv RD13, 0x000D
         .equiv RD12, 0x000C
         .equiv RD11, 0x000B
         .equiv RD10, 0x000A
         .equiv RD9, 0x0009
         .equiv RD8, 0x0008
         .equiv RD7, 0x0007
         .equiv RD6, 0x0006
         .equiv RD5, 0x0005
         .equiv RD4, 0x0004
         .equiv RD3, 0x0003
         .equiv RD2, 0x0002
         .equiv RD1, 0x0001
         .equiv RD0, 0x0000
         .equiv LATD15, 0x000F
         .equiv LATD14, 0x000E
         .equiv LATD13, 0x000D
         .equiv LATD12, 0x000C
         .equiv LATD11, 0x000B
         .equiv LATD10, 0x000A
         .equiv LATD9, 0x0009
         .equiv LATD8, 0x0008
         .equiv LATD7, 0x0007
         .equiv LATD6, 0x0006
         .equiv LATD5, 0x0005
         .equiv LATD4, 0x0004
         .equiv LATD3, 0x0003
         .equiv LATD2, 0x0002
         .equiv LATD1, 0x0001
         .equiv LATD0, 0x0000
         .equiv TRISFL, _TRISF                  
         .equiv TRISFH, _TRISF+1                
         .equiv PORTFL, _PORTF
         .equiv PORTFH, _PORTF+1
         .equiv LATFL, _LATF
         .equiv LATFH, _LATF+1
         .equiv TRISF8, 0x0008
         .equiv TRISF7, 0x0007
         .equiv TRISF6, 0x0006
         .equiv TRISF5, 0x0005
         .equiv TRISF4, 0x0004
         .equiv TRISF3, 0x0003
         .equiv TRISF2, 0x0002
         .equiv TRISF1, 0x0001
         .equiv TRISF0, 0x0000
         .equiv RF8, 0x0008
         .equiv RF7, 0x0007
         .equiv RF6, 0x0006
         .equiv RF5, 0x0005
         .equiv RF4, 0x0004
         .equiv RF3, 0x0003
         .equiv RF2, 0x0002
         .equiv RF1, 0x0001
         .equiv RF0, 0x0000
         .equiv LATF8, 0x0008
         .equiv LATF7, 0x0007
         .equiv LATF6, 0x0006
         .equiv LATF5, 0x0005
         .equiv LATF4, 0x0004
         .equiv LATF3, 0x0003
         .equiv LATF2, 0x0002
         .equiv LATF1, 0x0001
         .equiv LATF0, 0x0000
         .equiv TRISGL, _TRISG                  
         .equiv TRISGH, _TRISG+1                
         .equiv PORTGL, _PORTG
         .equiv PORTGH, _PORTG+1
         .equiv LATGL, _LATG
         .equiv LATGH, _LATG+1
         .equiv TRISG15, 0x000F
         .equiv TRISG14, 0x000E
         .equiv TRISG13, 0x000D
         .equiv TRISG12, 0x000C
         .equiv TRISG9, 0x0009
         .equiv TRISG8, 0x0008
         .equiv TRISG7, 0x0007
         .equiv TRISG6, 0x0006
         .equiv TRISG3, 0x0003
         .equiv TRISG2, 0x0002
         .equiv TRISG1, 0x0001
         .equiv TRISG0, 0x0000
         .equiv RG15, 0x000F
         .equiv RG14, 0x000E
         .equiv RG13, 0x000D
         .equiv RG12, 0x000C
         .equiv RG9, 0x0009
         .equiv RG8, 0x0008
         .equiv RG7, 0x0007
         .equiv RG6, 0x0006
         .equiv RG3, 0x0003
         .equiv RG2, 0x0002
         .equiv RG1, 0x0001
         .equiv RG0, 0x0000
         .equiv LATG15, 0x000F
         .equiv LATG14, 0x000E
         .equiv LATG13, 0x000D
         .equiv LATG12, 0x000C
         .equiv LATG9, 0x0009
         .equiv LATG8, 0x0008
         .equiv LATG7, 0x0007
         .equiv LATG6, 0x0006
         .equiv LATG3, 0x0003
         .equiv LATG2, 0x0002
         .equiv LATG1, 0x0001
         .equiv LATG0, 0x0000
         .equiv C1RXF0SIDL, _C1RXF0SID          
         .equiv C1RXF0SIDH, _C1RXF0SID+1        
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
         .equiv C2RXF0SIDL, _C2RXF0SID          
         .equiv C2RXF0SIDH, _C2RXF0SID+1        
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
         .equiv SID10, 0x000F
         .equiv SID9, 0x000E
         .equiv SID8, 0x000D
         .equiv SID7, 0x000C
         .equiv SID6, 0x000B
         .equiv SID5, 0x000A
         .equiv SID4, 0x0009
         .equiv SID3, 0x0008
         .equiv SID2, 0x0007
         .equiv SID1, 0x0006
         .equiv SID0, 0x0005
         .equiv SRR, 0x0004
         .equiv EXIDEN, 0x0003
         .equiv EXIDE, 0x0003
         .equiv EXID, 0x0003
         .equiv EID17, 0x0001
         .equiv EID16, 0x0000
         .equiv EID15, 0x000F
         .equiv EID14, 0x000E
         .equiv EID13, 0x000D
         .equiv EID12, 0x000C
         .equiv EID11, 0x000B
         .equiv EID10, 0x000A
         .equiv EID9, 0x0009
         .equiv EID8, 0x0008
         .equiv EID7, 0x0007
         .equiv EID6, 0x0006
         .equiv EID5, 0x0005
         .equiv EID4, 0x0004
         .equiv EID3, 0x0003
         .equiv EID2, 0x0002
         .equiv EID1, 0x0001
         .equiv EID0, 0x0000
         .equiv TXRTR, 0x000E
         .equiv DLC3, 0x000B
         .equiv DLC2, 0x000A
         .equiv DLC1, 0x0009
         .equiv DLC0, 0x0008
         
         .equiv TXABT, 0x0006
         .equiv TXLARB, 0x0005
         .equiv TXERR, 0x0004
         .equiv TXREQ, 0x0003
         .equiv TXPRI1, 0x0001
         .equiv TXPRI0, 0x0000
       .equiv RXRTR, 0x000E
         .equiv RXFUL, 0x0007
         .equiv RXM1, 0x0006
         .equiv RXM0, 0x0005
         .equiv RXRTRRO, 0x0003
         .equiv FILHIT2, 0x0002
         .equiv DBEN, 0x0002
         .equiv FILHIT1, 0x0001
         .equiv JTOFF, 0x0001
         .equiv FILHIT0, 0x0000
         .equiv CSIDL, 0x000D
         .equiv ABAT, 0x000C
         .equiv CANCKS, 0x000B
         .equiv REQOP2, 0x000A
         .equiv REQOP1, 0x0009
         .equiv REQOP0, 0x0008
         .equiv OPMODE2, 0x0007
         .equiv OPMODE1, 0x0006
         .equiv OPMODE0, 0x0005
         .equiv ICODE2, 0x0003
         .equiv ICODE1, 0x0002
         .equiv ICODE0, 0x0001
         .equiv SJW1, 0x0007
         .equiv SJW0, 0x0006
         .equiv BRP5, 0x0005
         .equiv BRP4, 0x0004
         .equiv BRP3, 0x0003
         .equiv BRP2, 0x0002
         .equiv BRP1, 0x0001
         .equiv BRP0, 0x0000
         .equiv CANCAP, 0x000F
         .equiv WAKFIL, 0x000E
         .equiv SEG2PH2, 0x000A
         .equiv SEG2PH1, 0x0009
         .equiv SEG2PH0, 0x0008
         .equiv SEG2PHTS, 0x0007
         .equiv SAM, 0x0006
         .equiv SEG1PH2, 0x0005
         .equiv SEG1PH1, 0x0004
         .equiv SEG1PH0, 0x0003
         .equiv PRSEG2, 0x0002
         .equiv PRSEG1, 0x0001
         .equiv PRSEG0, 0x0000
         .equiv RX0OVR, 0x000F
         .equiv RX1OVR, 0x000E
         .equiv TXB0, 0x000D
         .equiv TXEP, 0x000C
         .equiv RXEP, 0x000B
         .equiv TXWAR, 0x000A
         .equiv RXWAR, 0x0009
         .equiv EWARN, 0x0008
         .equiv IVRIF, 0x0007
         .equiv WAKIF, 0x0006
         .equiv ERRIF, 0x0005
         .equiv TX2IF, 0x0004
         .equiv TX1IF, 0x0003
         .equiv TX0IF, 0x0002
         .equiv RX1IF, 0x0001
         .equiv RX0IF, 0x0000
         .equiv IVRIE, 0x0007
         .equiv WAKIE, 0x0006
         .equiv ERRIE, 0x0005
         .equiv TX2IE, 0x0004
         .equiv TX1IE, 0x0003
         .equiv TX0IE, 0x0002
         .equiv RX1IE, 0x0001
         .equiv RX0IE, 0x0000
         .equiv RCONL, _RCON                    
         .equiv RCONH, _RCON+1                  
         .equiv OSCCONL, _OSCCON
         .equiv OSCCONH, _OSCCON+1
         .equiv TRAPR, 0x000F
         .equiv IOPUWR, 0x000E
         .equiv BGST, 0x000D
         .equiv LVDEN, 0x000C
         .equiv LVDL3, 0x000B
         .equiv LVDL2, 0x000A
         .equiv LVDL1, 0x0009
         .equiv LVDL0, 0x0008
         .equiv EXTR, 0x0007
         .equiv SWR, 0x0006
         .equiv SWDTEN, 0x0005
         .equiv WDTO, 0x0004
         .equiv SLEEP, 0x0003
         .equiv IDLE, 0x0002
         .equiv BOR, 0x0001
         .equiv POR, 0x0000
         .equiv COSC1, 0x000D
         .equiv COSC0, 0x000C
         .equiv NOSC1, 0x0009
         .equiv NOSC0, 0x0008
         .equiv POST1, 0x0007
         .equiv POST0, 0x0006
         .equiv LOCK, 0x0005
         .equiv CF, 0x0003
         .equiv LPOSCEN, 0x0001
         .equiv OSWEN, 0x0000
         .equiv NVMCONL, _NVMCON                
         .equiv NVMCONH, _NVMCON+1              
         .equiv NVMADRL, _NVMADR
         .equiv NVMADRH, _NVMADR+1
         .equiv NVMKEYL, _NVMKEY
         .equiv NVMKEYH, _NVMKEY+1
         .equiv WR, 0x000F
         .equiv WREN, 0x000E
         .equiv WRERR, 0x000D
         .equiv TWRI, 0x0008
         .equiv PROGOP6, 0x0006
         .equiv PROGOP5, 0x0005
         .equiv PROGOP4, 0x0004
         .equiv PROGOP3, 0x0003
         .equiv PROGOP2, 0x0002
         .equiv PROGOP1, 0x0001
         .equiv PROGOP0, 0x0000
         .equiv PMD1L, _PMD1                    
         .equiv PMD1H, _PMD1+1                  
         .equiv PMD2L, _PMD2
         .equiv PMD2H, _PMD2+1
         .equiv T5MD, 0x000F
         .equiv T4MD, 0x000E
         .equiv T3MD, 0x000D
         .equiv T2MD, 0x000C
         .equiv T1MD, 0x000B
         .equiv DCIMD, 0x0008
         .equiv I2CMD, 0x0007
         .equiv U2MD, 0x0006
         .equiv U1MD, 0x0005
         .equiv SPI2MD, 0x0004
         .equiv SPI1MD, 0x0003
         .equiv C2MD, 0x0002
         .equiv C1MD, 0x0001
         .equiv ADCMD, 0x0000
         .equiv IC8MD, 0x000F
         .equiv IC7MD, 0x000E
         .equiv IC6MD, 0x000D
         .equiv IC5MD, 0x000C
         .equiv IC4MD, 0x000B
         .equiv IC3MD, 0x000A
         .equiv IC2MD, 0x0009
         .equiv IC1MD, 0x0008
         .equiv OC8MD, 0x0007
         .equiv OC7MD, 0x0006
         .equiv OC6MD, 0x0005
         .equiv OC5MD, 0x0004
         .equiv OC4MD, 0x0003
         .equiv OC3MD, 0x0002
         .equiv OC2MD, 0x0001
         .equiv OC1MD, 0x0000
         .equiv SLEEP_MODE, 0x0000
         .equiv IDLE_MODE, 0x0001
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
         .equiv CODE_PROT_OFF, 0xFFFF
         .equiv CODE_PROT_ON, 0xFFFD
         
        .macro config REG, VALUE
        .section \REG.sec, "x"
        .global \REG
\REG:   .pword \VALUE
        .endm
        
        .text
        .global _main
        .global __reset
            .data
errnum:     .int   0
itrnum:    .space 2
Save_stat:  .space 2
          .text
__reset:          
_main:
        clr      itrnum
itr1:  inc     itrnum             
        clr     SR
        mov     #0x0001,w4
        mov     w4,0x1300           
        bset    SR,#N               
        asr     0x1300
        btss    SR,#Z               
        call    Fail_routine
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
itr2:  inc     itrnum             
        clr     SR
        mov     #0x8f00,w4
        mov     w4,0x1300           
        asr     0x1300
        btsc    SR,#Z               
        call    Fail_routine
        btsc    SR,#C               
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
        mov     #0xc780,w0
        cp      0x1300              
        btss    SR, #Z
        call    Fail_routine
itr3:  inc     itrnum             
        clr     SR                  
        mov     #0x8001,w5
        asr     w5,w6               
        btss    SR,#C               
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0xc000,w7
        cp      w6,w7               
        btss    SR,#Z
        call    Fail_routine
itr4:  inc     itrnum             
        clr     SR                  
        mov     #0x0001,w5
        bset    SR,#N
        asr     w5,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr5:  inc     itrnum             
        clr     SR
        mov     #0x8fff,w11
        bset    SR,#N               
        lsr     w11,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x47ff,w5
        cp      w6,w5
        btss    SR,#Z               
        call    Fail_routine
itr6:  inc     itrnum             
        clr     SR
        mov     #0x0001,w11
        bset    SR,#N               
        lsr     w11,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr7:  inc     itrnum             
        clr     SR
        mov     #0x800f,w11
        mov     w11,0x1100
        bset    SR,#N               
        lsr     0x1100
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x4007,w0
        cp      0x1100
        btss    SR, #Z
        call    Fail_routine 
itr8:  inc     itrnum         
        clr     SR                  
        mov     #0x0001,w11
        mov     w11,0x1100
        bset    SR,#N               
        lsr     0x1100
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr9:  inc     itrnum             
        clr     SR                  
        mov     #0x000f,w11
        mov     w11,0x1200
        rrc     0x1200
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x0007,w0
        cp      0x1200
        btss    SR, #Z
        call    Fail_routine
        rrc     0x1200
        btss    SR,#N               
        call    Fail_routine
itr10: inc     itrnum             
        clr     SR                  
        mov     #0x07,w11
        mov     w11,0x1210
        rrc.b   0x1210
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x0003,w0
        cp.b    0x1210
        btss    SR, #Z
        call    Fail_routine 
        rrc.b   0x1210
        btss    SR,#N               
        call    Fail_routine
itr11: inc     itrnum             
        clr     SR                  
        mov     #0x000f,w11
        rrc     w11,w9
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x0007,w5
        cp      w5,w9
        btss    SR,#Z               
        call    Fail_routine  
itr12: inc     itrnum             
        clr     SR                  
        bset    SR,#N               
        mov     #0x0000,w11
        rrc     w11,w9
        btsc    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr13: inc     itrnum             
        clr     SR                  
        mov     #0x07,w11
        clr     w9
        rrc.b   w11,w9
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x0003,w5
        cp.b    w5,w9
        btss    SR,#Z               
        call    Fail_routine
itr14: inc     itrnum             
        clr     SR                  
        mov     #0x7fff,w11
        bset    SR,#Z               
        rrnc    w11,w9
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0xbfff,w5
        cp      w5,w9
        btss    SR,#Z               
        call    Fail_routine
itr15: inc     itrnum             
        clr     SR                  
        mov     #0x0000,w11
        bset    SR,#N               
        rrnc    w11,w9
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr16: inc     itrnum             
        clr     SR                  
        mov     #0x7fff,w11
        mov     w11,0x1110
        bset    SR,#Z               
        rrnc    0x1110
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0xbfff,w0
        cp      0x1110
        btss    SR, #Z
        call    Fail_routine
itr17: inc     itrnum             
        clr     SR                  
        mov     #0x07,w11
        mov     w11,0x1320
        rrnc.b  0x1320
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x0083,w0
        cp      0x1320
        btss    SR, #Z
        call    Fail_routine
itr18: inc     itrnum             
        clr     SR
        mov     #0xc000,w4
        bset    SR,#Z               
        rlc     w4,w5
        btss    SR,#C               
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x8000,w7
        cp      w5,w7
        btss    SR,#Z               
        call    Fail_routine
itr19: inc     itrnum             
        clr     SR                  
        mov     #0x3fff,w6
        mov     w6,0x1530
        bset    SR,#C               
        bset    SR,#N               
        rlc     0x1530
        btsc    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
itr20: inc     itrnum             
        clr     SR                  
        mov     #0x0000,w6
        mov     w6,0x1530
        bset    SR,#N               
        rlc.b   0x1530
        btsc    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
       
itr21: inc     itrnum             
        clr     SR                  
        mov     #0x0000,w6
        mov     w6,0x1540
        bset    SR,#N               
        rlnc    0x1540
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr22: inc     itrnum             
        clr     SR                  
        mov     #0x7000,w6
        mov     w6,0x1540
        rlnc    0x1540
        btss    SR,#N               
        call    Fail_routine
        mov     #0xe000,w0
        cp      0x1540
        btss    SR, #Z
        call    Fail_routine
itr23: inc     itrnum             
        clr     SR                  
        mov     #0x8000,w6
        mov     w6,0x1580
        sl      0x1580
        btss    SR,#C               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine 
        btsc    SR,#N               
        call    Fail_routine
        mov     #0x0000,w0
        cp      0x1580              
        btss    SR, #Z
        call    Fail_routine
itr24: inc     itrnum             
        mov     #0x7000,w6
        mov     w6,0x1510
        sl      0x1510
        btsc    SR,#C               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
itr25: inc     itrnum             
        clr     SR                  
        mov.b   #0x0080,w6
        mov     w6,0x1560
        sl.b    0x1560
        btss    SR,#C               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine 
        btsc    SR,#N               
        call    Fail_routine
        mov.b   #0x00,w0
        cp.b    0x1580
        btss    SR, #Z
        call    Fail_routine 
itr26: inc     itrnum             
        clr     SR                  
        mov     #0x0001,w4
        mov     w4,0x1300           
        bset    SR,#N               
        asr.b   0x1300
        btss    SR,#Z               
        call    Fail_routine
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
itr27: inc     itrnum             
        clr     SR
        mov     #0x80,w4
        mov     w4,0x1300           
        bset    SR,#C               
        asr.b   0x1300
        btsc    SR,#Z               
        call    Fail_routine
        btsc    SR,#C               
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
        mov     #0xc0,w0
        cp.b    0x1300              
        btss    SR, #Z
        call    Fail_routine
itr28: inc     itrnum             
        clr     SR                  
        mov     #0x0081,w5
        asr.b   w5,w6               
        btss    SR,#C
        call    Fail_routine
        btss    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x00c0,w7
        cp.b    w6,w7               
        btss    SR,#Z               
        call    Fail_routine
itr29: inc     itrnum             
        clr     SR                  
        mov     #0x0001,w5
        bset    SR,#N               
        asr.b   w5,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine       
itr30: inc     itrnum             
        clr     SR
        mov     #0x8fff,w11
        bset    SR,#N               
        lsr.b   w11,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x7f,w5
        cp.b    w6,w5               
        btss    SR,#Z               
        call    Fail_routine
itr31: inc     itrnum             
        clr     SR
        mov     #0x01,w11
        bset    SR,#N               
        lsr.b   w11,w6
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
itr32: inc     itrnum             
        clr     SR
        mov     #0x800f,w11
        mov     w11,0x1100
        bset    SR,#N               
        lsr.b   0x1100
        btss    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btsc    SR,#Z               
        call    Fail_routine
        mov     #0x07,w0
        cp.b    0x1100
        btss    SR, #Z
        call    Fail_routine 
itr33: inc     itrnum             
        clr     SR                  
        mov     #0x8000,w11
        mov     w11,0x1100
        bset    SR,#N               
        bset    SR,#C               
        lsr.b   0x1100
        btsc    SR,#C               
        call    Fail_routine
        btsc    SR,#N               
        call    Fail_routine
        btss    SR,#Z               
        call    Fail_routine
        mov.w   errnum
        bra z,  Pass
Fail:   goto    Fail_end
        HALT                        
Pass:   goto    Pass_end
        goto    Fail_end
        HALT             
           
             .psize 1000
             .list
        
             .section foo_r, "r"
             .align 2
r_foo0:      .space 3
             .space 7
r_foo0a:     .byte 1
             
             ; .align when the max-skip exactly what is required for
             ; the alignment.  The alignment should take place.             
             
             .align 4, 0x12, 2
r_foo1:      .space 1
             .space 0xFE
             
             ; .align with a fill argument but no max-skip argument.
             .align 0x10, 0x34
r_foo2:      .space 1
             .space 8
             
             ; .align when the max-skip is one less than what would be required for
             ; the alignment.  The alignment should _not_ take place.
             .align 0x20, 0x56, 0xE6
r_foo3:      .space 1
             .byte 0xa5
             
             ; Test .align interaction with prior .fillvalue directive.
             ;.fillvalue 0x78
             .align 0x10
r_foo4:      .space 1
             .byte 0xa6
             
             .align 0x80, 0x9A, 0
r_foo5:      .space 1
             .byte 0xa7
             .byte 1
             
             .section .const, "r"
             .align 2
const_foo0:      .space 3
             .space 6
             
             ; .align when the max-skip exactly what is required for
             ; the alignment.  The alignment should take place.             
             
             .align 4, 0x12, 3
const_foo1:      .space 1
             .space 0xFE
             
             ; .align with a fill argument but no max-skip argument.
             .align 0x10, 0x34
const_foo2:      .space 1
             .space 8
             
             ; .align when the max-skip is one less than what would be required for
             ; the alignment.  The alignment should _not_ take place.
             .align 0x20, 0x56, 0xE6
const_foo3:      .space 1
             .byte 0xa5
             
             ; Test .align interaction with prior .fillvalue directive.
             ;.fillvalue 0x78
             .align 0x10
const_foo4:      .space 1
             .byte 0xa6
             
             .align 0x80, 0x9A, 0
const_foo5:      .space 1
             .byte 0xa7
             .byte 1
                          

             .nolist

          .data
failstr:  .asciz "fail: itr %d\n"
passstr:  .asciz "pass: itr %d\n"
passall:  .asciz "PASS: itr END\n"
failall:  .asciz "FAIL: itr END\n"
          .text
state_preserve:
        mov   SR, w0                 
        xor   Save_stat,wreg         
        btss  SR,#Z                  
        call  Fail_routine
        return
Fail_routine:
          PUSH   SR
          inc     errnum
          push itrnum                     
          mov.w #failstr, w0               
          mov.w w0,[w15++]
          ;call _printf                     
          sub.w w15,#4,w15                 
          POP   SR
          return                           
          goto Fail_end
          HALT                             
Fail_end:
          mov.w #failall, w0               
          mov.w w0,[w15++]
          ;call _printf                     
          dec.w w15,w15                    
          HALT                             
Pass_end:
          mov.w #passall, w0               
          mov.w w0,[w15++]
          ;call _printf                     
          dec.w w15,w15                    
          HALT                             
          .end
 
