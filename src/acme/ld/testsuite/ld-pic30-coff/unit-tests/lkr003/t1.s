;
; Test cases for interrupt vector tables
;
	.text

	.global __reset
__reset:
	nop

	.global __ReservedTrap0
__ReservedTrap0:
	nop

	.global __OscillatorFail
__OscillatorFail:
	nop

	.global __AddressError
__AddressError:
	nop

	.global __StackError
__StackError:
	nop

	.global __MathError
__MathError:
	nop

	.global __ReservedTrap5
__ReservedTrap5:
	nop

	.global __ReservedTrap6
__ReservedTrap6:
	nop

	.global __ReservedTrap7
__ReservedTrap7:
	nop

	.global __INT0Interrupt
__INT0Interrupt:
	nop

	.global __IC1Interrupt
__IC1Interrupt:
	nop

	.global __OC1Interrupt
__OC1Interrupt:
	nop

	.global __T1Interrupt
__T1Interrupt:
	nop

	.global __IC2Interrupt
__IC2Interrupt:
	nop

	.global __OC2Interrupt
__OC2Interrupt:
	nop

	.global __T2Interrupt
__T2Interrupt:
	nop

	.global __T3Interrupt
__T3Interrupt:
	nop

	.global __SPI1Interrupt
__SPI1Interrupt:
	nop

	.global __U1RXInterrupt
__U1RXInterrupt:
	nop

	.global __U1TXInterrupt
__U1TXInterrupt:
	nop

	.global __ADCInterrupt
__ADCInterrupt:
	nop

	.global __NVMInterrupt
__NVMInterrupt:
	nop

	.global __SI2CInterrupt
__SI2CInterrupt:
	nop

	.global __MI2CInterrupt
__MI2CInterrupt:
	nop

	.global __CNInterrupt
__CNInterrupt:
	nop

	.global __INT1Interrupt
__INT1Interrupt:
	nop

	.global __IC7Interrupt
__IC7Interrupt:
	nop

	.global __IC8Interrupt
__IC8Interrupt:
	nop

	.global __OC3Interrupt
__OC3Interrupt:
	nop

	.global __OC4Interrupt
__OC4Interrupt:
	nop

	.global __T4Interrupt
__T4Interrupt:
	nop

	.global __T5Interrupt
__T5Interrupt:
	nop

	.global __INT2Interrupt
__INT2Interrupt:
	nop

	.global __U2RXInterrupt
__U2RXInterrupt:
	nop

	.global __U2TXInterrupt
__U2TXInterrupt:
	nop

	.global __SPI2Interrupt
__SPI2Interrupt:
	nop

	.global __C1Interrupt
__C1Interrupt:
	nop

	.global __IC3Interrupt
__IC3Interrupt:
	nop

	.global __IC4Interrupt
__IC4Interrupt:
	nop

	.global __IC5Interrupt
__IC5Interrupt:
	nop

	.global __IC6Interrupt
__IC6Interrupt:
	nop

	.global __OC5Interrupt
__OC5Interrupt:
	nop

	.global __OC6Interrupt
__OC6Interrupt:
	nop

	.global __OC7Interrupt
__OC7Interrupt:
	nop

	.global __OC8Interrupt
__OC8Interrupt:
	nop

	.global __INT3Interrupt
__INT3Interrupt:
	nop

	.global __INT4Interrupt
__INT4Interrupt:
	nop

	.global __C2Interrupt
__C2Interrupt:
	nop

	.global __PWMInterrupt
__PWMInterrupt:
	nop

	.global __QEIInterrupt
__QEIInterrupt:
	nop

	.global __DCIInterrupt
__DCIInterrupt:
	nop

	.global __LVDInterrupt
__LVDInterrupt:
	nop

	.global __FLTAInterrupt
__FLTAInterrupt:
	nop

	.global __FLTBInterrupt
__FLTBInterrupt:
	nop

	.global __Interrupt45
__Interrupt45:
	nop

	.global __Interrupt46
__Interrupt46:
	nop

	.global __Interrupt47
__Interrupt47:
	nop

	.global __Interrupt48
__Interrupt48:
	nop

	.global __Interrupt49
__Interrupt49:
	nop

	.global __Interrupt50
__Interrupt50:
	nop

	.global __Interrupt51
__Interrupt51:
	nop

	.global __Interrupt52
__Interrupt52:
	nop

	.global __Interrupt53
__Interrupt53:
	nop
