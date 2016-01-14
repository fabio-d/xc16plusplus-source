; Check the interrupt vector table.

                        .global __reset
                        .text
__reset:                nop
                        
                        .org 0x100
__ReservedTrap0:
                        nop               
__AltReservedTrap0:
                        nop
__OscillatorFail:
                        nop
__AltOscillatorFail:
                        nop
__AddressError:
                        nop
__AltAddressError:
                        nop
__StackError:
                        nop
__AltStackError:
                        nop
__MathError:
                        nop
__AltMathError:
                        nop
__ReservedTrap5:
                        nop
__AltReservedTrap5:
                        nop
__ReservedTrap6:
                        nop
__AltReservedTrap6:
                        nop
__ReservedTrap7:
                        nop
__AltReservedTrap7:
                        nop
__INT0Interrupt:
                        nop
__AltINT0Interrupt:
                        nop
__IC1Interrupt:
                        nop
__AltIC1Interrupt:
                        nop
__OC1Interrupt:
                        nop
__AltOC1Interrupt:
                        nop
__T1Interrupt:
                        nop
__AltT1Interrupt:
                        nop
__IC2Interrupt:
                        nop
__AltIC2Interrupt:
                        nop
__OC2Interrupt:
                        nop
__AltOC2Interrupt:
                        nop
__T2Interrupt:
                        nop
__AltT2Interrupt:
                        nop
__T3Interrupt:
                        nop
__AltT3Interrupt:
                        nop
__SPI1Interrupt:
                        nop
__AltSPI1Interrupt:
                        nop
__U1RXInterrupt:
                        nop
__AltU1RXInterrupt:
                        nop
__U1TXInterrupt:
                        nop
__AltU1TXInterrupt:
                        nop
__ADCInterrupt:
                        nop
__AltADCInterrupt:
                        nop
__NVMInterrupt:
                        nop
__AltNVMInterrupt:
                        nop
__SI2CInterrupt:
                        nop
__AltSI2CInterrupt:
                        nop
__MI2CInterrupt:
                        nop
__AltMI2CInterrupt:
                        nop
__CNInterrupt:
                        nop
__AltCNInterrupt:
                        nop
__INT1Interrupt:
                        nop
__AltINT1Interrupt:
                        nop
__IC7Interrupt:
                        nop
__AltIC7Interrupt:
                        nop
__IC8Interrupt:
                        nop
__AltIC8Interrupt:
                        nop
__OC3Interrupt:
                        nop
__AltOC3Interrupt:
                        nop
__OC4Interrupt:
                        nop
__AltOC4Interrupt:
                        nop
__T4Interrupt:
                        nop
__AltT4Interrupt:
                        nop
__T5Interrupt:
                        nop
__AltT5Interrupt:
                        nop
__INT2Interrupt:
                        nop
__AltINT2Interrupt:
                        nop
__U2RXInterrupt:
                        nop
__AltU2RXInterrupt:
                        nop
__U2TXInterrupt:
                        nop
__AltU2TXInterrupt:
                        nop
__SPI2Interrupt:
                        nop
__AltSPI2Interrupt:
                        nop
__C1Interrupt:
                        nop
__AltC1Interrupt:
                        nop
__IC3Interrupt:
                        nop
__AltIC3Interrupt:
                        nop
__IC4Interrupt:
                        nop
__AltIC4Interrupt:
                        nop
__IC5Interrupt:
                        nop
__AltIC5Interrupt:
                        nop
__IC6Interrupt:
                        nop
__AltIC6Interrupt:
                        nop
__OC5Interrupt:
                        nop
__AltOC5Interrupt:
                        nop
__OC6Interrupt:
                        nop
__AltOC6Interrupt:
                        nop
__OC7Interrupt:
                        nop
__AltOC7Interrupt:
                        nop
__OC8Interrupt:
                        nop
__AltOC8Interrupt:
                        nop
__INT3Interrupt:
                        nop
__AltINT3Interrupt:
                        nop
__INT4Interrupt:
                        nop
__AltINT4Interrupt:
                        nop
__C2Interrupt:
                        nop
__AltC2Interrupt:
                        nop
__PWMInterrupt:
                        nop
__AltPWMInterrupt:
                        nop
__QEIInterrupt:
                        nop
__AltQEIInterrupt:
                        nop
__DCIInterrupt:
                        nop
__AltDCIInterrupt:
                        nop
__LVDInterrupt:
                        nop
__AltLVDInterrupt:
                        nop
__FLTAInterrupt:
                        nop
__AltFLTAInterrupt:
                        nop
__FLTBInterrupt:
                        nop
__AltFLTBInterrupt:
                        nop
__Interrupt45:
                        nop
__AltInterrupt45:
                        nop
__Interrupt46:
                        nop
__AltInterrupt46:
                        nop
__Interrupt47:
                        nop
__AltInterrupt47:
                        nop
__Interrupt48:
                        nop
__AltInterrupt48:
                        nop
__Interrupt49:
                        nop
__AltInterrupt49:
                        nop
__Interrupt50:
                        nop
__AltInterrupt50:
                        nop
__Interrupt51:
                        nop
__AltInterrupt51:
                        nop
__Interrupt52:
                        nop
__AltInterrupt52:
                        nop
__Interrupt53:
                        nop
__AltInterrupt53:
                        nop
         
         .global __ReservedTrap0 
         .global __AltReservedTrap0
         .global __OscillatorFail 
         .global __AltOscillatorFail
         .global __AddressError 
         .global __AltAddressError
         .global __StackError 
         .global __AltStackError
         .global __MathError 
         .global __AltMathError
         .global __ReservedTrap5 
         .global __AltReservedTrap5
         .global __ReservedTrap6 
         .global __AltReservedTrap6
         .global __ReservedTrap7 
         .global __AltReservedTrap7
         .global __INT0Interrupt 
         .global __AltINT0Interrupt
         .global __IC1Interrupt 
         .global __AltIC1Interrupt
         .global __OC1Interrupt 
         .global __AltOC1Interrupt
         .global __T1Interrupt 
         .global __AltT1Interrupt
         .global __IC2Interrupt 
         .global __AltIC2Interrupt
         .global __OC2Interrupt 
         .global __AltOC2Interrupt
         .global __T2Interrupt 
         .global __AltT2Interrupt
         .global __T3Interrupt 
         .global __AltT3Interrupt
         .global __SPI1Interrupt 
         .global __AltSPI1Interrupt
         .global __U1RXInterrupt 
         .global __AltU1RXInterrupt
         .global __U1TXInterrupt 
         .global __AltU1TXInterrupt
         .global __ADCInterrupt 
         .global __AltADCInterrupt
         .global __NVMInterrupt 
         .global __AltNVMInterrupt
         .global __SI2CInterrupt
         .global __AltSI2CInterrupt
         .global __MI2CInterrupt
         .global __AltMI2CInterrupt
         .global __CNInterrupt
         .global __AltCNInterrupt
         .global __INT1Interrupt
         .global __AltINT1Interrupt
         .global __IC7Interrupt 
         .global __AltIC7Interrupt
         .global __IC8Interrupt 
         .global __AltIC8Interrupt
         .global __OC3Interrupt 
         .global __AltOC3Interrupt
         .global __OC4Interrupt 
         .global __AltOC4Interrupt
         .global __T4Interrupt 
         .global __AltT4Interrupt
         .global __T5Interrupt 
         .global __AltT5Interrupt
         .global __INT2Interrupt 
         .global __AltINT2Interrupt
         .global __U2RXInterrupt 
         .global __AltU2RXInterrupt
         .global __U2TXInterrupt 
         .global __AltU2TXInterrupt
         .global __SPI2Interrupt 
         .global __AltSPI2Interrupt
         .global __C1Interrupt 
         .global __AltC1Interrupt
         .global __IC3Interrupt 
         .global __AltIC3Interrupt
         .global __IC4Interrupt 
         .global __AltIC4Interrupt
         .global __IC5Interrupt 
         .global __AltIC5Interrupt
         .global __IC6Interrupt 
         .global __AltIC6Interrupt
         .global __OC5Interrupt 
         .global __AltOC5Interrupt
         .global __OC6Interrupt 
         .global __AltOC6Interrupt
         .global __OC7Interrupt 
         .global __AltOC7Interrupt
         .global __OC8Interrupt 
         .global __AltOC8Interrupt
         .global __INT3Interrupt 
         .global __AltINT3Interrupt
         .global __INT4Interrupt 
         .global __AltINT4Interrupt
         .global __C2Interrupt 
         .global __AltC2Interrupt
         .global __PWMInterrupt 
         .global __AltPWMInterrupt
         .global __QEIInterrupt 
         .global __AltQEIInterrupt
         .global __DCIInterrupt 
         .global __AltDCIInterrupt
         .global __LVDInterrupt 
         .global __AltLVDInterrupt
         .global __FLTAInterrupt 
         .global __AltFLTAInterrupt
         .global __FLTBInterrupt 
         .global __AltFLTBInterrupt
         .global __Interrupt45 
         .global __AltInterrupt45
         .global __Interrupt46 
         .global __AltInterrupt46
         .global __Interrupt47 
         .global __AltInterrupt47
         .global __Interrupt48 
         .global __AltInterrupt48
         .global __Interrupt49 
         .global __AltInterrupt49
         .global __Interrupt50 
         .global __AltInterrupt50
         .global __Interrupt51 
         .global __AltInterrupt51
         .global __Interrupt52 
         .global __AltInterrupt52
         .global __Interrupt53 
         .global __AltInterrupt53
         
         
                        .end
                        
