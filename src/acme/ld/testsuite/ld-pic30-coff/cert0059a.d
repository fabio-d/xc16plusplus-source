#ld: --sort-common -dp
#objects: /ld-pic30-coff/cert0059a.out /ld-pic30-coff/cert0059b.out
#name: --sort-common, sort symbols by size

Allocating common symbols
Common symbol       size              file

eightsym4           0x10              \./\./ld-pic30-coff/cert0059b\.out
eightsym2           0x10              \./\./ld-pic30-coff/cert0059a\.out
eightsym1           0x10              \./\./ld-pic30-coff/cert0059a\.out
eightsym3           0x10              \./\./ld-pic30-coff/cert0059b\.out
foursym4            0x8               \./\./ld-pic30-coff/cert0059b\.out
foursym2            0x8               \./\./ld-pic30-coff/cert0059a\.out
foursym3            0x8               \./\./ld-pic30-coff/cert0059b\.out
foursym1            0x8               \./\./ld-pic30-coff/cert0059a\.out
twosym2             0x4               \./\./ld-pic30-coff/cert0059a\.out
twosym3             0x4               \./\./ld-pic30-coff/cert0059b\.out
twosym4             0x4               \./\./ld-pic30-coff/cert0059b\.out
twosym1             0x4               \./\./ld-pic30-coff/cert0059a\.out
onesym3             0x2               \./\./ld-pic30-coff/cert0059b\.out
onesym1             0x2               \./\./ld-pic30-coff/cert0059a\.out
onesym2             0x2               \./\./ld-pic30-coff/cert0059a\.out
onesym4             0x2               \./\./ld-pic30-coff/cert0059b\.out

Program Memory Usage

section        address   length \(PC units\)   length \(bytes\) \(dec\)
-------        -------   -----------------   --------------------
\.reset               0                 0x4             0x6  \(6\)
\.ivt               0x4                0x7c            0xba  \(186\)
\.aivt             0x84                0x7c            0xba  \(186\)
\.text            0x100                0x16            0x21  \(33\)
\.dinit           0x116                 0x2             0x3  \(3\)
\.isr             0x118                 0x2             0x3  \(3\)

         Total program memory used \(bytes\):          0x1a1  \(417\)


Data Memory Usage

section        address      alignment gaps    total length  \(dec\)
-------        -------      --------------    -------------------
\.bss             0x800                   0            0x3c  \(60\)

            Total data memory used \(bytes\):           0x3c  \(60\)


Dynamic Memory Usage

region         address                      maximum length  \(dec\)
------         -------                      ---------------------
heap             0x83c                                   0  \(0\)
stack            0x83c                              0xf7bc  \(63420\)

            Maximum dynamic memory \(bytes\):         0xf7bc  \(63420\)


Memory Configuration

Name             Origin             Length             Attributes
data             0x000800           0x00f800           a \!xr
program          0x000100           0x03ff00           xr
reset            0x000000           0x000004  
ivt              0x000004           0x00007c  
aivt             0x000084           0x00007c  
__FOSC           0xf80000           0x000002  
__FWDT           0xf80002           0x000002  
__FBORPOR        0xf80004           0x000002  
__CONFIG4        0xf80006           0x000002  
__CONFIG5        0xf80008           0x000002  
__FGS            0xf8000a           0x000002  
eedata           0x7ff000           0x001000  

Linker script and memory map

LOAD \./\./ld-pic30-coff/cert0059a\.out
LOAD \./\./ld-pic30-coff/cert0059b\.out
                    0x0000                  __RESET_BASE = 0x0
                    0x0004                  __IVT_BASE = 0x4
                    0x0084                  __AIVT_BASE = 0x84
                    0x0100                  __CODE_BASE = 0x100
                    0x0000                  __SFR_BASE = 0x0
                    0x0800                  __DATA_BASE = 0x800
                    0x3000                  __YDATA_BASE = 0x3000

\.reset            0x000000          0x4
                  0x000000          0x2 SHORT 0x100 \<code 336\> \(__reset\)
                  0x000001          0x2 SHORT 0x4
                  0x000002          0x2 SHORT 0x0 \(\(\<code 336\> \(__reset\) \>\> 0x10\) & 0x7f\)
                  0x000003          0x2 SHORT 0x0

\.text             0x000100         0x16
 \*\(\.handle\)
 \*\(\.libc\)
 \*\(\.libm\)
 \*\(\.libdsp\)
 \*\(\.lib\*\)
 \*\(\.text\)
 \.text            0x000100          0xa \./\./ld-pic30-coff/cert0059a\.out
                  0x000100                  _reset
 \.text            0x00010a          0xc \./\./ld-pic30-coff/cert0059b\.out

\.dinit            0x000116          0x2
 \*\(\.dinit\)
 \.dinit           0x000116          0x2 data_init

usercode
 \*\(usercode\)

__FOSC
 \*\(__FOSC\.sec\)

__FWDT
 \*\(__FWDT\.sec\)

__FBORPOR
 \*\(__FBORPOR\.sec\)

__CONFIG4
 \*\(__CONFIG4\.sec\)

__CONFIG5
 \*\(__CONFIG5\.sec\)

__FGS
 \*\(__FGS\.sec\)

\.eedata
 \*\(\.eedata\)

\.icd                0x0800          0x0
                    0x0800                  \. = \(\. \+ DEFINED \(__ICD2RAM\)\?0x50:0x0\)

\.xbss               0x0800          0x0
                    0x0800                  __bxdata = \.
 \*\(\.xbss\)

\.xdata              0x0800          0x0
 \*\(\.xdata\)
                    0x0800                  __exdata = \.

\.pbss
 \*\(\.pbss\)

\.nbss               0x0800          0x0
                    0x0800                  __bndata = \.
 \*\(\.nbss\)

\.ndata              0x0800          0x0
 \*\(\.ndata\)
 \*\(\.ndconst\)
                    0x0800                  __endata = \.

\.bss                0x0800         0x3c
 \*\(\.bss\)
 COMMON             0x0800         0x1e \./\./ld-pic30-coff/cert0059a\.out
                                  0x0 \(size before relaxing\)
                    0x[[:xdigit:]]+                  eightsym2
                    0x[[:xdigit:]]+                  twosym2
                    0x[[:xdigit:]]+                  eightsym1
                    0x[[:xdigit:]]+                  foursym2
                    0x[[:xdigit:]]+                  onesym1
                    0x[[:xdigit:]]+                  twosym1
                    0x[[:xdigit:]]+                  foursym1
                    0x[[:xdigit:]]+                  onesym2
 COMMON             0x[[:xdigit:]]+         0x1e \./\./ld-pic30-coff/cert0059b\.out
                                  0x0 \(size before relaxing\)
                    0x[[:xdigit:]]+                  eightsym4
                    0x[[:xdigit:]]+                  onesym3
                    0x[[:xdigit:]]+                  foursym4
                    0x[[:xdigit:]]+                  twosym3
                    0x[[:xdigit:]]+                  eightsym3
                    0x[[:xdigit:]]+                  twosym4
                    0x[[:xdigit:]]+                  foursym3
                    0x[[:xdigit:]]+                  onesym4

\.data               0x083c          0x0
 \*\(\.data\)
 \*\(\.dconst\)

userdata
 \*\(userdata\)

\.ybss
 \*\(\.ybss\)

\.ydata
 \*\(\.ydata\)

\.const
 \*\(\.const\)
                    0x0000                  __X_OVERFLOW = \(\(__exdata \!= __bxdata\) && \(__exdata \> __YDATA_BASE\)\)\?\(__exdata - __YDATA_BASE\):0x0
                    0x0000                  __NEAR_OVERFLOW = \(\(__endata \!= __bndata\) && \(__endata \> 0x2000\)\)\?\(__endata - 0x2000\):0x0

\.ivt              0x000004         0x7c
                  0x000004          0x4 LONG 0x118 DEFINED \(__ReservedTrap0\)\?\<code 336\> \(__ReservedTrap0\):\<code 336\> \(__DefaultInterrupt\)
                  0x000006          0x4 LONG 0x118 DEFINED \(__OscillatorFail\)\?\<code 336\> \(__OscillatorFail\):\<code 336\> \(__DefaultInterrupt\)
                  0x000008          0x4 LONG 0x118 DEFINED \(__AddressError\)\?\<code 336\> \(__AddressError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00000a          0x4 LONG 0x118 DEFINED \(__StackError\)\?\<code 336\> \(__StackError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00000c          0x4 LONG 0x118 DEFINED \(__MathError\)\?\<code 336\> \(__MathError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00000e          0x4 LONG 0x118 DEFINED \(__ReservedTrap5\)\?\<code 336\> \(__ReservedTrap5\):\<code 336\> \(__DefaultInterrupt\)
                  0x000010          0x4 LONG 0x118 DEFINED \(__ReservedTrap6\)\?\<code 336\> \(__ReservedTrap6\):\<code 336\> \(__DefaultInterrupt\)
                  0x000012          0x4 LONG 0x118 DEFINED \(__ReservedTrap7\)\?\<code 336\> \(__ReservedTrap7\):\<code 336\> \(__DefaultInterrupt\)
                  0x000014          0x4 LONG 0x118 DEFINED \(__INT0Interrupt\)\?\<code 336\> \(__INT0Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000016          0x4 LONG 0x118 DEFINED \(__IC1Interrupt\)\?\<code 336\> \(__IC1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000018          0x4 LONG 0x118 DEFINED \(__OC1Interrupt\)\?\<code 336\> \(__OC1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00001a          0x4 LONG 0x118 DEFINED \(__T1Interrupt\)\?\<code 336\> \(__T1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00001c          0x4 LONG 0x118 DEFINED \(__IC2Interrupt\)\?\<code 336\> \(__IC2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00001e          0x4 LONG 0x118 DEFINED \(__OC2Interrupt\)\?\<code 336\> \(__OC2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000020          0x4 LONG 0x118 DEFINED \(__T2Interrupt\)\?\<code 336\> \(__T2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000022          0x4 LONG 0x118 DEFINED \(__T3Interrupt\)\?\<code 336\> \(__T3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000024          0x4 LONG 0x118 DEFINED \(__SPI1Interrupt\)\?\<code 336\> \(__SPI1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000026          0x4 LONG 0x118 DEFINED \(__U1RXInterrupt\)\?\<code 336\> \(__U1RXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000028          0x4 LONG 0x118 DEFINED \(__U1TXInterrupt\)\?\<code 336\> \(__U1TXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00002a          0x4 LONG 0x118 DEFINED \(__ADCInterrupt\)\?\<code 336\> \(__ADCInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00002c          0x4 LONG 0x118 DEFINED \(__NVMInterrupt\)\?\<code 336\> \(__NVMInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00002e          0x4 LONG 0x118 DEFINED \(__SI2CInterrupt\)\?\<code 336\> \(__SI2CInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000030          0x4 LONG 0x118 DEFINED \(__MI2CInterrupt\)\?\<code 336\> \(__MI2CInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000032          0x4 LONG 0x118 DEFINED \(__CNInterrupt\)\?\<code 336\> \(__CNInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000034          0x4 LONG 0x118 DEFINED \(__INT1Interrupt\)\?\<code 336\> \(__INT1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000036          0x4 LONG 0x118 DEFINED \(__IC7Interrupt\)\?\<code 336\> \(__IC7Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000038          0x4 LONG 0x118 DEFINED \(__IC8Interrupt\)\?\<code 336\> \(__IC8Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00003a          0x4 LONG 0x118 DEFINED \(__OC3Interrupt\)\?\<code 336\> \(__OC3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00003c          0x4 LONG 0x118 DEFINED \(__OC4Interrupt\)\?\<code 336\> \(__OC4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00003e          0x4 LONG 0x118 DEFINED \(__T4Interrupt\)\?\<code 336\> \(__T4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000040          0x4 LONG 0x118 DEFINED \(__T5Interrupt\)\?\<code 336\> \(__T5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000042          0x4 LONG 0x118 DEFINED \(__INT2Interrupt\)\?\<code 336\> \(__INT2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000044          0x4 LONG 0x118 DEFINED \(__U2RXInterrupt\)\?\<code 336\> \(__U2RXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000046          0x4 LONG 0x118 DEFINED \(__U2TXInterrupt\)\?\<code 336\> \(__U2TXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000048          0x4 LONG 0x118 DEFINED \(__SPI2Interrupt\)\?\<code 336\> \(__SPI2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00004a          0x4 LONG 0x118 DEFINED \(__C1Interrupt\)\?\<code 336\> \(__C1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00004c          0x4 LONG 0x118 DEFINED \(__IC3Interrupt\)\?\<code 336\> \(__IC3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00004e          0x4 LONG 0x118 DEFINED \(__IC4Interrupt\)\?\<code 336\> \(__IC4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000050          0x4 LONG 0x118 DEFINED \(__IC5Interrupt\)\?\<code 336\> \(__IC5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000052          0x4 LONG 0x118 DEFINED \(__IC6Interrupt\)\?\<code 336\> \(__IC6Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000054          0x4 LONG 0x118 DEFINED \(__OC5Interrupt\)\?\<code 336\> \(__OC5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000056          0x4 LONG 0x118 DEFINED \(__OC6Interrupt\)\?\<code 336\> \(__OC6Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000058          0x4 LONG 0x118 DEFINED \(__OC7Interrupt\)\?\<code 336\> \(__OC7Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00005a          0x4 LONG 0x118 DEFINED \(__OC8Interrupt\)\?\<code 336\> \(__OC8Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00005c          0x4 LONG 0x118 DEFINED \(__INT3Interrupt\)\?\<code 336\> \(__INT3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00005e          0x4 LONG 0x118 DEFINED \(__INT4Interrupt\)\?\<code 336\> \(__INT4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000060          0x4 LONG 0x118 DEFINED \(__C2Interrupt\)\?\<code 336\> \(__C2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000062          0x4 LONG 0x118 DEFINED \(__PWMInterrupt\)\?\<code 336\> \(__PWMInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000064          0x4 LONG 0x118 DEFINED \(__QEIInterrupt\)\?\<code 336\> \(__QEIInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000066          0x4 LONG 0x118 DEFINED \(__DCIInterrupt\)\?\<code 336\> \(__DCIInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000068          0x4 LONG 0x118 DEFINED \(__LVDInterrupt\)\?\<code 336\> \(__LVDInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00006a          0x4 LONG 0x118 DEFINED \(__FLTAInterrupt\)\?\<code 336\> \(__FLTAInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00006c          0x4 LONG 0x118 DEFINED \(__FLTBInterrupt\)\?\<code 336\> \(__FLTBInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00006e          0x4 LONG 0x118 DEFINED \(__Interrupt45\)\?\<code 336\> \(__Interrupt45\):\<code 336\> \(__DefaultInterrupt\)
                  0x000070          0x4 LONG 0x118 DEFINED \(__Interrupt46\)\?\<code 336\> \(__Interrupt46\):\<code 336\> \(__DefaultInterrupt\)
                  0x000072          0x4 LONG 0x118 DEFINED \(__Interrupt47\)\?\<code 336\> \(__Interrupt47\):\<code 336\> \(__DefaultInterrupt\)
                  0x000074          0x4 LONG 0x118 DEFINED \(__Interrupt48\)\?\<code 336\> \(__Interrupt48\):\<code 336\> \(__DefaultInterrupt\)
                  0x000076          0x4 LONG 0x118 DEFINED \(__Interrupt49\)\?\<code 336\> \(__Interrupt49\):\<code 336\> \(__DefaultInterrupt\)
                  0x000078          0x4 LONG 0x118 DEFINED \(__Interrupt50\)\?\<code 336\> \(__Interrupt50\):\<code 336\> \(__DefaultInterrupt\)
                  0x00007a          0x4 LONG 0x118 DEFINED \(__Interrupt51\)\?\<code 336\> \(__Interrupt51\):\<code 336\> \(__DefaultInterrupt\)
                  0x00007c          0x4 LONG 0x118 DEFINED \(__Interrupt52\)\?\<code 336\> \(__Interrupt52\):\<code 336\> \(__DefaultInterrupt\)
                  0x00007e          0x4 LONG 0x118 DEFINED \(__Interrupt53\)\?\<code 336\> \(__Interrupt53\):\<code 336\> \(__DefaultInterrupt\)

\.aivt             0x000084         0x7c
                  0x000084          0x4 LONG 0x118 DEFINED \(__AltReservedTrap0\)\?\<code 336\> \(__AltReservedTrap0\):DEFINED \(__ReservedTrap0\)\?\<code 336\> \(__ReservedTrap0\):\<code 336\> \(__DefaultInterrupt\)
                  0x000086          0x4 LONG 0x118 DEFINED \(__AltOscillatorFail\)\?\<code 336\> \(__AltOscillatorFail\):DEFINED \(__OscillatorFail\)\?\<code 336\> \(__OscillatorFail\):\<code 336\> \(__DefaultInterrupt\)
                  0x000088          0x4 LONG 0x118 DEFINED \(__AltAddressError\)\?\<code 336\> \(__AltAddressError\):DEFINED \(__AddressError\)\?\<code 336\> \(__AddressError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00008a          0x4 LONG 0x118 DEFINED \(__AltStackError\)\?\<code 336\> \(__AltStackError\):DEFINED \(__StackError\)\?\<code 336\> \(__StackError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00008c          0x4 LONG 0x118 DEFINED \(__AltMathError\)\?\<code 336\> \(__AltMathError\):DEFINED \(__MathError\)\?\<code 336\> \(__MathError\):\<code 336\> \(__DefaultInterrupt\)
                  0x00008e          0x4 LONG 0x118 DEFINED \(__AltReservedTrap5\)\?\<code 336\> \(__AltReservedTrap5\):DEFINED \(__ReservedTrap5\)\?\<code 336\> \(__ReservedTrap5\):\<code 336\> \(__DefaultInterrupt\)
                  0x000090          0x4 LONG 0x118 DEFINED \(__AltReservedTrap6\)\?\<code 336\> \(__AltReservedTrap6\):DEFINED \(__ReservedTrap6\)\?\<code 336\> \(__ReservedTrap6\):\<code 336\> \(__DefaultInterrupt\)
                  0x000092          0x4 LONG 0x118 DEFINED \(__AltReservedTrap7\)\?\<code 336\> \(__AltReservedTrap7\):DEFINED \(__ReservedTrap7\)\?\<code 336\> \(__ReservedTrap7\):\<code 336\> \(__DefaultInterrupt\)
                  0x000094          0x4 LONG 0x118 DEFINED \(__AltINT0Interrupt\)\?\<code 336\> \(__AltINT0Interrupt\):DEFINED \(__INT0Interrupt\)\?\<code 336\> \(__INT0Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000096          0x4 LONG 0x118 DEFINED \(__AltIC1Interrupt\)\?\<code 336\> \(__AltIC1Interrupt\):DEFINED \(__IC1Interrupt\)\?\<code 336\> \(__IC1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x000098          0x4 LONG 0x118 DEFINED \(__AltOC1Interrupt\)\?\<code 336\> \(__AltOC1Interrupt\):DEFINED \(__OC1Interrupt\)\?\<code 336\> \(__OC1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00009a          0x4 LONG 0x118 DEFINED \(__AltT1Interrupt\)\?\<code 336\> \(__AltT1Interrupt\):DEFINED \(__T1Interrupt\)\?\<code 336\> \(__T1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00009c          0x4 LONG 0x118 DEFINED \(__AltIC2Interrupt\)\?\<code 336\> \(__AltIC2Interrupt\):DEFINED \(__IC2Interrupt\)\?\<code 336\> \(__IC2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x00009e          0x4 LONG 0x118 DEFINED \(__AltOC2Interrupt\)\?\<code 336\> \(__AltOC2Interrupt\):DEFINED \(__OC2Interrupt\)\?\<code 336\> \(__OC2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000a0          0x4 LONG 0x118 DEFINED \(__AltT2Interrupt\)\?\<code 336\> \(__AltT2Interrupt\):DEFINED \(__T2Interrupt\)\?\<code 336\> \(__T2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000a2          0x4 LONG 0x118 DEFINED \(__AltT3Interrupt\)\?\<code 336\> \(__AltT3Interrupt\):DEFINED \(__T3Interrupt\)\?\<code 336\> \(__T3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000a4          0x4 LONG 0x118 DEFINED \(__AltSPI1Interrupt\)\?\<code 336\> \(__AltSPI1Interrupt\):DEFINED \(__SPI1Interrupt\)\?\<code 336\> \(__SPI1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000a6          0x4 LONG 0x118 DEFINED \(__AltU1RXInterrupt\)\?\<code 336\> \(__AltU1RXInterrupt\):DEFINED \(__U1RXInterrupt\)\?\<code 336\> \(__U1RXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000a8          0x4 LONG 0x118 DEFINED \(__AltU1TXInterrupt\)\?\<code 336\> \(__AltU1TXInterrupt\):DEFINED \(__U1TXInterrupt\)\?\<code 336\> \(__U1TXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000aa          0x4 LONG 0x118 DEFINED \(__AltADCInterrupt\)\?\<code 336\> \(__AltADCInterrupt\):DEFINED \(__ADCInterrupt\)\?\<code 336\> \(__ADCInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ac          0x4 LONG 0x118 DEFINED \(__AltNVMInterrupt\)\?\<code 336\> \(__AltNVMInterrupt\):DEFINED \(__NVMInterrupt\)\?\<code 336\> \(__NVMInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ae          0x4 LONG 0x118 DEFINED \(__AltSI2CInterrupt\)\?\<code 336\> \(__AltSI2CInterrupt\):DEFINED \(__SI2CInterrupt\)\?\<code 336\> \(__SI2CInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000b0          0x4 LONG 0x118 DEFINED \(__AltMI2CInterrupt\)\?\<code 336\> \(__AltMI2CInterrupt\):DEFINED \(__MI2CInterrupt\)\?\<code 336\> \(__MI2CInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000b2          0x4 LONG 0x118 DEFINED \(__AltCNInterrupt\)\?\<code 336\> \(__AltCNInterrupt\):DEFINED \(__CNInterrupt\)\?\<code 336\> \(__CNInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000b4          0x4 LONG 0x118 DEFINED \(__AltINT1Interrupt\)\?\<code 336\> \(__AltINT1Interrupt\):DEFINED \(__INT1Interrupt\)\?\<code 336\> \(__INT1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000b6          0x4 LONG 0x118 DEFINED \(__AltIC7Interrupt\)\?\<code 336\> \(__AltIC7Interrupt\):DEFINED \(__IC7Interrupt\)\?\<code 336\> \(__IC7Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000b8          0x4 LONG 0x118 DEFINED \(__AltIC8Interrupt\)\?\<code 336\> \(__AltIC8Interrupt\):DEFINED \(__IC8Interrupt\)\?\<code 336\> \(__IC8Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ba          0x4 LONG 0x118 DEFINED \(__AltOC3Interrupt\)\?\<code 336\> \(__AltOC3Interrupt\):DEFINED \(__OC3Interrupt\)\?\<code 336\> \(__OC3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000bc          0x4 LONG 0x118 DEFINED \(__AltOC4Interrupt\)\?\<code 336\> \(__AltOC4Interrupt\):DEFINED \(__OC4Interrupt\)\?\<code 336\> \(__OC4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000be          0x4 LONG 0x118 DEFINED \(__AltT4Interrupt\)\?\<code 336\> \(__AltT4Interrupt\):DEFINED \(__T4Interrupt\)\?\<code 336\> \(__T4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000c0          0x4 LONG 0x118 DEFINED \(__AltT5Interrupt\)\?\<code 336\> \(__AltT5Interrupt\):DEFINED \(__T5Interrupt\)\?\<code 336\> \(__T5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000c2          0x4 LONG 0x118 DEFINED \(__AltINT2Interrupt\)\?\<code 336\> \(__AltINT2Interrupt\):DEFINED \(__INT2Interrupt\)\?\<code 336\> \(__INT2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000c4          0x4 LONG 0x118 DEFINED \(__AltU2RXInterrupt\)\?\<code 336\> \(__AltU2RXInterrupt\):DEFINED \(__U2RXInterrupt\)\?\<code 336\> \(__U2RXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000c6          0x4 LONG 0x118 DEFINED \(__AltU2TXInterrupt\)\?\<code 336\> \(__AltU2TXInterrupt\):DEFINED \(__U2TXInterrupt\)\?\<code 336\> \(__U2TXInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000c8          0x4 LONG 0x118 DEFINED \(__AltSPI2Interrupt\)\?\<code 336\> \(__AltSPI2Interrupt\):DEFINED \(__SPI2Interrupt\)\?\<code 336\> \(__SPI2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ca          0x4 LONG 0x118 DEFINED \(__AltC1Interrupt\)\?\<code 336\> \(__AltC1Interrupt\):DEFINED \(__C1Interrupt\)\?\<code 336\> \(__C1Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000cc          0x4 LONG 0x118 DEFINED \(__AltIC3Interrupt\)\?\<code 336\> \(__AltIC3Interrupt\):DEFINED \(__IC3Interrupt\)\?\<code 336\> \(__IC3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ce          0x4 LONG 0x118 DEFINED \(__AltIC4Interrupt\)\?\<code 336\> \(__AltIC4Interrupt\):DEFINED \(__IC4Interrupt\)\?\<code 336\> \(__IC4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000d0          0x4 LONG 0x118 DEFINED \(__AltIC5Interrupt\)\?\<code 336\> \(__AltIC5Interrupt\):DEFINED \(__IC5Interrupt\)\?\<code 336\> \(__IC5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000d2          0x4 LONG 0x118 DEFINED \(__AltIC6Interrupt\)\?\<code 336\> \(__AltIC6Interrupt\):DEFINED \(__IC6Interrupt\)\?\<code 336\> \(__IC6Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000d4          0x4 LONG 0x118 DEFINED \(__AltOC5Interrupt\)\?\<code 336\> \(__AltOC5Interrupt\):DEFINED \(__OC5Interrupt\)\?\<code 336\> \(__OC5Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000d6          0x4 LONG 0x118 DEFINED \(__AltOC6Interrupt\)\?\<code 336\> \(__AltOC6Interrupt\):DEFINED \(__OC6Interrupt\)\?\<code 336\> \(__OC6Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000d8          0x4 LONG 0x118 DEFINED \(__AltOC7Interrupt\)\?\<code 336\> \(__AltOC7Interrupt\):DEFINED \(__OC7Interrupt\)\?\<code 336\> \(__OC7Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000da          0x4 LONG 0x118 DEFINED \(__AltOC8Interrupt\)\?\<code 336\> \(__AltOC8Interrupt\):DEFINED \(__OC8Interrupt\)\?\<code 336\> \(__OC8Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000dc          0x4 LONG 0x118 DEFINED \(__AltINT3Interrupt\)\?\<code 336\> \(__AltINT3Interrupt\):DEFINED \(__INT3Interrupt\)\?\<code 336\> \(__INT3Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000de          0x4 LONG 0x118 DEFINED \(__AltINT4Interrupt\)\?\<code 336\> \(__AltINT4Interrupt\):DEFINED \(__INT4Interrupt\)\?\<code 336\> \(__INT4Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000e0          0x4 LONG 0x118 DEFINED \(__AltC2Interrupt\)\?\<code 336\> \(__AltC2Interrupt\):DEFINED \(__C2Interrupt\)\?\<code 336\> \(__C2Interrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000e2          0x4 LONG 0x118 DEFINED \(__AltPWMInterrupt\)\?\<code 336\> \(__AltPWMInterrupt\):DEFINED \(__PWMInterrupt\)\?\<code 336\> \(__PWMInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000e4          0x4 LONG 0x118 DEFINED \(__AltQEIInterrupt\)\?\<code 336\> \(__AltQEIInterrupt\):DEFINED \(__QEIInterrupt\)\?\<code 336\> \(__QEIInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000e6          0x4 LONG 0x118 DEFINED \(__AltDCIInterrupt\)\?\<code 336\> \(__AltDCIInterrupt\):DEFINED \(__DCIInterrupt\)\?\<code 336\> \(__DCIInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000e8          0x4 LONG 0x118 DEFINED \(__AltLVDInterrupt\)\?\<code 336\> \(__AltLVDInterrupt\):DEFINED \(__LVDInterrupt\)\?\<code 336\> \(__LVDInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ea          0x4 LONG 0x118 DEFINED \(__AltFLTAInterrupt\)\?\<code 336\> \(__AltFLTAInterrupt\):DEFINED \(__FLTAInterrupt\)\?\<code 336\> \(__FLTAInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ec          0x4 LONG 0x118 DEFINED \(__AltFLTBInterrupt\)\?\<code 336\> \(__AltFLTBInterrupt\):DEFINED \(__FLTBInterrupt\)\?\<code 336\> \(__FLTBInterrupt\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000ee          0x4 LONG 0x118 DEFINED \(__AltInterrupt45\)\?\<code 336\> \(__AltInterrupt45\):DEFINED \(__Interrupt45\)\?\<code 336\> \(__Interrupt45\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000f0          0x4 LONG 0x118 DEFINED \(__AltInterrupt46\)\?\<code 336\> \(__AltInterrupt46\):DEFINED \(__Interrupt46\)\?\<code 336\> \(__Interrupt46\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000f2          0x4 LONG 0x118 DEFINED \(__AltInterrupt47\)\?\<code 336\> \(__AltInterrupt47\):DEFINED \(__Interrupt47\)\?\<code 336\> \(__Interrupt47\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000f4          0x4 LONG 0x118 DEFINED \(__AltInterrupt48\)\?\<code 336\> \(__AltInterrupt48\):DEFINED \(__Interrupt48\)\?\<code 336\> \(__Interrupt48\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000f6          0x4 LONG 0x118 DEFINED \(__AltInterrupt49\)\?\<code 336\> \(__AltInterrupt49\):DEFINED \(__Interrupt49\)\?\<code 336\> \(__Interrupt49\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000f8          0x4 LONG 0x118 DEFINED \(__AltInterrupt50\)\?\<code 336\> \(__AltInterrupt50\):DEFINED \(__Interrupt50\)\?\<code 336\> \(__Interrupt50\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000fa          0x4 LONG 0x118 DEFINED \(__AltInterrupt51\)\?\<code 336\> \(__AltInterrupt51\):DEFINED \(__Interrupt51\)\?\<code 336\> \(__Interrupt51\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000fc          0x4 LONG 0x118 DEFINED \(__AltInterrupt52\)\?\<code 336\> \(__AltInterrupt52\):DEFINED \(__Interrupt52\)\?\<code 336\> \(__Interrupt52\):\<code 336\> \(__DefaultInterrupt\)
                  0x0000fe          0x4 LONG 0x118 DEFINED \(__AltInterrupt53\)\?\<code 336\> \(__AltInterrupt53\):DEFINED \(__Interrupt53\)\?\<code 336\> \(__Interrupt53\):\<code 336\> \(__DefaultInterrupt\)
                    0x0000                  WREG0 = 0x0
                    0x0000                  _WREG0 = 0x0
                    0x0002                  WREG1 = 0x2
                    0x0002                  _WREG1 = 0x2
                    0x0004                  WREG2 = 0x4
                    0x0004                  _WREG2 = 0x4
                    0x0006                  WREG3 = 0x6
                    0x0006                  _WREG3 = 0x6
                    0x0008                  WREG4 = 0x8
                    0x0008                  _WREG4 = 0x8
                    0x000a                  WREG5 = 0xa
                    0x000a                  _WREG5 = 0xa
                    0x000c                  WREG6 = 0xc
                    0x000c                  _WREG6 = 0xc
                    0x000e                  WREG7 = 0xe
                    0x000e                  _WREG7 = 0xe
                    0x0010                  WREG8 = 0x10
                    0x0010                  _WREG8 = 0x10
                    0x0012                  WREG9 = 0x12
                    0x0012                  _WREG9 = 0x12
                    0x0014                  WREG10 = 0x14
                    0x0014                  _WREG10 = 0x14
                    0x0016                  WREG11 = 0x16
                    0x0016                  _WREG11 = 0x16
                    0x0018                  WREG12 = 0x18
                    0x0018                  _WREG12 = 0x18
                    0x001a                  WREG13 = 0x1a
                    0x001a                  _WREG13 = 0x1a
                    0x001c                  WREG14 = 0x1c
                    0x001c                  _WREG14 = 0x1c
                    0x001e                  WREG15 = 0x1e
                    0x001e                  _WREG15 = 0x1e
                    0x0020                  SPLIM = 0x20
                    0x0020                  _SPLIM = 0x20
                    0x0022                  ACCAL = 0x22
                    0x0022                  _ACCAL = 0x22
                    0x0024                  ACCAH = 0x24
                    0x0024                  _ACCAH = 0x24
                    0x0026                  ACCAU = 0x26
                    0x0026                  _ACCAU = 0x26
                    0x0028                  ACCBL = 0x28
                    0x0028                  _ACCBL = 0x28
                    0x002a                  ACCBH = 0x2a
                    0x002a                  _ACCBH = 0x2a
                    0x002c                  ACCBU = 0x2c
                    0x002c                  _ACCBU = 0x2c
                    0x002e                  PCL = 0x2e
                    0x002e                  _PCL = 0x2e
                    0x0030                  PCH = 0x30
                    0x0030                  _PCH = 0x30
                    0x0032                  TBLPAG = 0x32
                    0x0032                  _TBLPAG = 0x32
                    0x0034                  PSVPAG = 0x34
                    0x0034                  _PSVPAG = 0x34
                    0x0036                  RCOUNT = 0x36
                    0x0036                  _RCOUNT = 0x36
                    0x0038                  DCOUNT = 0x38
                    0x0038                  _DCOUNT = 0x38
                    0x003a                  DOSTARTL = 0x3a
                    0x003a                  _DOSTARTL = 0x3a
                    0x003c                  DOSTARTH = 0x3c
                    0x003c                  _DOSTARTH = 0x3c
                    0x003e                  DOENDL = 0x3e
                    0x003e                  _DOENDL = 0x3e
                    0x0040                  DOENDH = 0x40
                    0x0040                  _DOENDH = 0x40
                    0x0042                  SR = 0x42
                    0x0042                  _SR = 0x42
                    0x0044                  CORCON = 0x44
                    0x0044                  _CORCON = 0x44
                    0x0046                  MODCON = 0x46
                    0x0046                  _MODCON = 0x46
                    0x0048                  XMODSRT = 0x48
                    0x0048                  _XMODSRT = 0x48
                    0x004a                  XMODEND = 0x4a
                    0x004a                  _XMODEND = 0x4a
                    0x004c                  YMODSRT = 0x4c
                    0x004c                  _YMODSRT = 0x4c
                    0x004e                  YMODEND = 0x4e
                    0x004e                  _YMODEND = 0x4e
                    0x0050                  XBREV = 0x50
                    0x0050                  _XBREV = 0x50
                    0x0052                  DISICNT = 0x52
                    0x0052                  _DISICNT = 0x52
                    0x0022                  ACCA = 0x22
                    0x0022                  _ACCA = 0x22
                    0x0028                  ACCB = 0x28
                    0x0028                  _ACCB = 0x28
                    0x0042                  SRbits = 0x42
                    0x0042                  _SRbits = 0x42
                    0x0044                  CORCONbits = 0x44
                    0x0044                  _CORCONbits = 0x44
                    0x0046                  MODCONbits = 0x46
                    0x0046                  _MODCONbits = 0x46
                    0x0050                  XBREVbits = 0x50
                    0x0050                  _XBREVbits = 0x50
                    0x0052                  DISICNTbits = 0x52
                    0x0052                  _DISICNTbits = 0x52
OUTPUT\(\./\./ld-pic30-coff/tmpdir/cert0059a\.o coff-pic30\)
LOAD data_init
LOAD default_isr

\.isr              0x000118          0x2
 \.isr             0x000118          0x2 default_isr
                  0x000118                  _DefaultInterrupt
