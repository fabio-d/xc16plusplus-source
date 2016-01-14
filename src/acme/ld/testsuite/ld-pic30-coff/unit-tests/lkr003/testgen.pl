#! /usr/local/bin/perl

# write header
print "\;\n";
print "\; Test cases for interrupt vector tables\n";
print "\;\n";

# write section directive
print "\t.text\n";

# declare the list of entry pointsx
our @data = (
__reset,       
__OscillatorFail,
__StackError,
__AddressError,
__ArithmeticWarning,
__SoftwareTrap,
__ReservedTrap0,
__ReservedTrap1,
__ReservedTrap2,
__INT0Interrupt,
__IC1Interrupt,
__OC1Interrupt,
__T1Interrupt,
__IC2Interrupt,
__OC2Interrupt,
__T2Interrupt,
__T3Interrupt,
__SPI1Interrupt,
__U1RXInterrupt,
__U1TXInterrupt,
__ADCInterrupt,
__NVMInterrupt,
__I2CInterrupt,
__BCLInterrupt,
__CNInterrupt,
__INT1Interrupt,
__IC7Interrupt,
__IC8Interrupt,
__OC3Interrupt,
__OC4Interrupt,
__T4Interrupt,
__T5Interrupt,
__INT2Interrupt,
__U2RXInterrupt,
__U2TXInterrupt,
__SPI2Interrupt,
__C1Interrupt,
__IC3Interrupt,
__IC4Interrupt,
__IC5Interrupt,
__IC6Interrupt,
__OC5Interrupt,
__OC6Interrupt,
__OC7Interrupt,
__OC8Interrupt,
__INT3Interrupt,
__INT4Interrupt,
__C2Interrupt,
__PWMInterrupt,
__QEIInterrupt,
__DCIInterrupt,
__LVDInterrupt,
__FLTAInterrupt,
__FLTBInterrupt,
__Interrupt45,
__Interrupt46,
__Interrupt47,
__Interrupt48,
__Interrupt49,
__Interrupt50,
__Interrupt51,
__Interrupt52,
__Interrupt53
);

# construct test cases
foreach $a (@data) {
    print "\n\t.global $a\n";
    print "$a:\n";
    print "\tnop\n";
}


                
