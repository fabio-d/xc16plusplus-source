; Test file dependency information with up to 15 levels of nesting.

                  .ifndef cert670c_inc
                  .equ cert670c_inc, 1

                  .text
                  .byte 0
                  .byte 0x41
c670c0:           nop
                  .include "././gas/pic30/cert0670/LEVEL2~1/../cert0670d.inc"

                  .text
c670c1:           nop                  

                  ; The following .file directive will cause the assembler to put
                  ; the relative path (as written) into the symbol table.
                  ; It will not resolve to the absolute path.
                  .file "bogusfile.s"
c670c2:           nop

                  ; The following .file directive will cause the assembler to put
                  ; the relative path (as written) into the symbol table.
                  ; It will not resolve to the absolute path.
                  .file "././gas/pic30/cert0670/LEVEL2~1/../cert0670d.inc"
c670c3:           nop
                  .byte 0xFE

                  .byte 0x42
                  .endif
                  
