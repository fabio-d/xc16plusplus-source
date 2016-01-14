
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .data
         .space 5
         .incbin ".\gas\pic30\incbin-1.bin"
         .text
         HALT
         .end
