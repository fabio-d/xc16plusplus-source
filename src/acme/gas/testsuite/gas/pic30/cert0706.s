
        /****************************************************
                     Start of assembly code
        ****************************************************/
         ; Define a macro/pseudo-instruction for the undocumented HALT instruction.
         .macro HALT
            .pword 0xDA4000
         .endm

         .text
          GOTO END

         .section .eedata,eedata
			.global _mydata
_mydata:
         .incbin ".\gas\pic30\incbin-1.bin"

         .data
         .word 1

         .text
         .align 2
END:      HALT
         .end
