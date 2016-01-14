
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .text
         .pincbin ".\gas\pic30\incbin-1.bin", 1, 15
         HALT
         .end
