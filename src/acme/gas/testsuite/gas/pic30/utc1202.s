        .equ foo,99
        
        .text
        
        .ifdecl foo
          .pword 0x563412
        .else
          .pword 0xFFFFFF
        .endif
