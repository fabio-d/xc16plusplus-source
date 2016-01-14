        .text
        
        .ifndecl foo
          .pword 0x563412
        .else
          .pword 0xFFFFFF
        .endif
