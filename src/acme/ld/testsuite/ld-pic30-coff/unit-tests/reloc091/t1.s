        ;;
        ;; reloc091
        ;; 

        ; dsPIC registers
        .equ CORCONL, 0x0044

        ; control bit in CORCONL
        .equiv PSV,    0x0002
        
        .text
        .global __reset
__reset:
        bset.b  CORCONL,#PSV    ;  enable PSV

T1: 
        mov     #psvpage(const1),w0
        call    print_w0
        mov     w0,PSVPAG
        mov     #' ',w0
        call    print_char
        mov     #psvoffset(const1),w0
        mov     [w0],w0
        call    print_w0
        call    print_CR

T2:     
        mov     #psvpage(const2),w0
        call    print_w0
        mov     w0,PSVPAG
        mov     #' ',w0
        call    print_char
        mov     #psvoffset(const2),w0
        mov     [w0],w0
        call    print_w0
        call    print_CR

T3:     
        mov     #psvpage(const3),w0
        call    print_w0
        mov     w0,PSVPAG
        mov     #' ',w0
        call    print_char
        mov     #psvoffset(const3),w0
        mov     [w0],w0
        call    print_w0
        call    print_CR

T4:     
        mov     #psvpage(const4),w0
        call    print_w0
        mov     w0,PSVPAG
        mov     #' ',w0
        call    print_char
        mov     #psvoffset(const4),w0
        mov     [w0],w0
        call    print_w0
        call    print_CR

        call    print_done
        .pword  0xda6000         ; break

        .global const1
        ;; psv page 0
const1:
        .word   0x100
        .space  0x20
        
        .global const2
const2:
        .word   0x200

        .org 0x8000
        ;; psv page 1
const3:
        .word   0x300
        .space  0x20
        
        .global const2
const4:
        .word   0x400

