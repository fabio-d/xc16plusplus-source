
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .data
         .incbin ".\gas\pic30\incbin-1.bin", 0, 15
         .text
         HALT
         .end
