        .text
        .global __reset
        .section .libc,"x"
__reset:
        mov   #__SP_init,w15      ; initialize w15
        rcall  _main              ; call main()
