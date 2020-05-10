
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .text
          GOTO END
         .space 5
         .align 8
         .incbin ".\gas\pic30\incbin-1.bin"
         .align 2
END:      HALT
         .end
