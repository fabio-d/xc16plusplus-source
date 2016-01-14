        ;; misc07: PSV memory test
        ;;
        ;; t1.s - this file
        ;; t2.s - output routines
        ;; t3.s - data initialization
        
        ; dsPIC registers
        .equ _CORCONL, 0x0044

        ; control bit in CORCONL
        .equiv PSV,    0x0002
        
      	.text
        .global __reset
__reset:
        bset.b  _CORCONL,#PSV    ;  enable PSV
        call    _init           ; sets up w0,w1,PSVPAG
        mov     w0,w4
        mov     w1,w5           ;  save start, end addrs
1:
        cp      w0,w1           ; do while (w0 < w1)
        bra     lt,9f

        cp      w0,[w0]
        bra     nz,2f           ; br if (w0 != [w0])

        inc2    w0,w0           ; w0+=2
        bra     1b              ; loop to continue

2:
        push    w0              ; save error addr
        call    _print_range    ; print header
        ;call    _print_const_range 
        mov     #psvpage(err),w0
        mov     w0,PSVPAG       ; set PSV to error message
        
        mov     #psvoffset(err),w0         ; complain on error
        call    _print_string
        pop     w0              ; report bad address
        call    print_w0
        call    print_CR
        call    print_CR
        call    print_done
        .pword  0xda6000        ; stop

9:
        call    _print_range    ; print header        
        ;call    _print_const_range 
        mov     #psvpage(pass),w0
        mov     w0,PSVPAG       ; set PSV to pass message
        
        mov     #psvoffset(pass),w0        ; print nice message
        call    _print_string
        .pword  0xda6000        ; stop

_print_range:
        mov     #psvpage(range),w0
        mov     w0,PSVPAG
        mov     #psvoffset(range),w0
        call    _print_string
        mov     w4,w0
        call    print_w0
        mov     #' ',w0
        call    print_char
        mov     w5,w0
        call    print_w0
        call    print_CR
        return

        .if 0
_print_const_range:
        mov     #psvpage(const_range),w0
        mov     w0,PSVPAG
        mov     #psvoffset(const_range),w0
        call    _print_string
        mov     #__const,w0
        call    print_w0
        mov     #' ',w0
        call    print_char
        mov     #__econst,w0
        call    print_w0
        call    print_CR
        return
        .endif
        
range:
        .ascii  "\nmisc07: PSV Memory Test, Range \0"

const_range:
        .ascii  "Section Range: \0"
        
pass:
        .ascii  "All Tests Pass\n\n\0"

err:    .ascii  "Error at: \0"
