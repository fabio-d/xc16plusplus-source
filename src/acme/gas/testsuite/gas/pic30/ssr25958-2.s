                .section absdata1,data,address(0x900)
                .space 5
                .align 0x1000
                .word 0x3344

                .data
                .space 3
                .align 0x20
                .word 0x3344     

                 .section absdata1
                 .word 0x5566

                .section abscode1,code,address(0x1000)
                .space 1
                .align 8
                clrwdt

                .section abscode2,code,address(0x184)
                .space 1
myclrwdtlbl:     clrwdt
                .space 3
                .align 0x800
                clrwdt           

                .text
                nop
                .space 1
                .align 0x20
                .word 0x1122

                .section abscode2,code ;continued
                .pspace 5
finallabel:      clrwdt

                .end
