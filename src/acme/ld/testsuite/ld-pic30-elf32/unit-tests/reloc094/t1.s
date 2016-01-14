        ;;
        ;; reloc094
        ;; 

        .text
        .global __reset
__reset:

T1: 
        mov     #tblpage(const1),w0
        call    print_w0
        mov     w0,TBLPAG
        mov     #' ',w0
        call    print_char
        mov     #tbloffset(const1),w0
        tblrdl  [w0],w0
        call    print_w0
        call    print_CR

T2:     
        mov     #tblpage(const2),w0
        call    print_w0
        mov     w0,TBLPAG
        mov     #' ',w0
        call    print_char
        mov     #tbloffset(const2),w0
        tblrdl  [w0],w0
        call    print_w0
        call    print_CR

T3:     
        mov     #tblpage(const3),w0
        call    print_w0
        mov     w0,TBLPAG
        mov     #' ',w0
        call    print_char
        mov     #tbloffset(const3),w0
        tblrdl  [w0],w0
        call    print_w0
        call    print_CR

T4:     
        mov     #tblpage(const4),w0
        call    print_w0
        mov     w0,TBLPAG
        mov     #' ',w0
        call    print_char
        mov     #tbloffset(const4),w0
        tblrdl  [w0],w0
        call    print_w0
        call    print_CR

        call    print_done
        .pword  0xda6000         ; break

        .global const1
        ;; tbl page 0
const1:
        .word   0x100
        .space  0x20
        
        .global const2
const2:
        .word   0x200

        .org 0x10000
        ;; tbl page 1
const3:
        .word   0x300
        .space  0x20
        
        .global const2
const4:
        .word   0x400

