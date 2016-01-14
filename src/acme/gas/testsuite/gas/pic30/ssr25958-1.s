                .section absdata1,data,address(0x900)
                .space 5
                .align 2
                .word 0x3344

                .data
                .space 3
                .align 4
                .word 0x3344     

                 .section absdata1
                 .word 0x5566

                .section abscode1,code,address(0x1000)
                .space 1
                .align 4
                clrwdt

                .section abscode2,code,address(0x1100)
                .space 1
myclrwdtlbl:     clrwdt
                .space 3
                .align 4
                clrwdt           

                .text
                nop
                .space 1
                .align 4
                .word 0x1122

                .section abscode2,code ;continued
                .pspace 5
finallabel:      clrwdt

                .end
