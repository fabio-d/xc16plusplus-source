        .text
        
        .ifdecl foo
          .pword 0xFFFFFF
        .else
          .pword 0x563412
        .endif
