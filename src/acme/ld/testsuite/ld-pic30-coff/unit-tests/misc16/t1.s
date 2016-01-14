        ;; SSR 21433
        .data
        .if 0
          .space 0x700          ;  no error
        .else
          .space 0x7a0          ;  error
        .endif
L1:     .asciz "abcdefghijklmno"
L2:     .asciz "abcdefghijklmno"
L3:     .asciz "abcdefghijklmno"
L4:     .asciz "abcdefghijklmno"
L5:     .asciz "abcdefghijklmno"
L6:
