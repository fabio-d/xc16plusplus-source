
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .text
         HALT
         .incbin ".\gas\pic30\incbin-1.bin", 257

         HALT
         .end
