        ;;
        ;; misc09
        ;;
        ;; - requires C startup library
        .text
        .global _main
_main:
   
T1:     
        ;; local function pointers in data space
        mov     #table1,w1
        mov     #8,w2
T11:    mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T11
        call    print_CR

T2:     
        ;; duplicate table
        mov     #table2,w1
        mov     #8,w2
T21:    mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T21
        call    print_CR

T3:     
        ;; global function pointers in data space
        mov     #table3,w1
        mov     #8,w2
T31:    mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T31
        call    print_CR

T4:     
        ;; duplicate table
        mov     #table4,w1
        mov     #8,w2
T41:    mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T41
        call    print_CR

T5:     
        ;; local function pointers in program space
        mov     #tblpage(table5),w1
        mov     w1,TBLPAG
        mov     #tbloffset(table5),w1
        mov     #8,w2
T51:    tblrdl  [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T51
        call    print_CR

T6:     
        ;; duplicate table
        mov     #tblpage(table6),w1
        mov     w1,TBLPAG
        mov     #tbloffset(table6),w1
        mov     #8,w2
T61:    tblrdl  [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T61
        call    print_CR

T7:     
        ;; global function pointers in program space
        mov     #tblpage(table7),w1
        mov     w1,TBLPAG
        mov     #tbloffset(table7),w1
        mov     #8,w2
T71:    tblrdl  [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T71
        call    print_CR

T8:     
        ;; duplicate table
        mov     #tblpage(table8),w1
        mov     w1,TBLPAG
        mov     #tbloffset(table8),w1
        mov     #8,w2
T81:    tblrdl  [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T81
        call    print_CR

T9:     
        ;; local function pointers in PSV window
        mov     #table9,w1
        mov     #8,w2
T91:    mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T91
        call    print_CR

T100:     
        ;; duplicate table
        mov     #table10,w1
        mov     #8,w2
T101:   mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T101
        call    print_CR

T110:     
        ;; global function pointers in data space
        mov     #table11,w1
        mov     #8,w2
T111:   mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T111
        call    print_CR

T120:     
        ;; duplicate table
        mov     #table12,w1
        mov     #8,w2
T121:   mov     [w1++],w0
        call    w0
        call    print_w0
        mov     #' ',w0
        call    print_char

        dec     w2,w2
        bra     gt,T121
        call    print_CR

        call    print_done
        .pword  0xda6000        ; break

        ;; local functions
f1:
        mov     #0x1,w0
        return
f2:
        mov     #0x2,w0
        return
f3:
        mov     #0x3,w0
        return
f4:
        mov     #0x4,w0
        return
f5:
        mov     #0x5,w0
        return
f6:
        mov     #0x6,w0
        return
f7:
        mov     #0x7,w0
        return
f8:
        mov     #0x8,w0
        return

        ;; global functions
        .global F1,F2,F3,F4,F5,F6,F7,F8       
F1:
        mov     #0x1,w0
        return
F2:
        mov     #0x2,w0
        return
F3:
        mov     #0x3,w0
        return
F4:
        mov     #0x4,w0
        return
F5:
        mov     #0x5,w0
        return
F6:
        mov     #0x6,w0
        return
F7:
        mov     #0x7,w0
        return
F8:
        mov     #0x8,w0
        return

        ;; tables in data space
        .data
table1:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table2:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table3:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

table4:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

        ;; tables in program space
        
        .text
table5:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table6:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table7:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

table8:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

        ;; tables in PSV window
        
        .section .const,"r"
table9:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table10:
        .word   handle(f1)
        .word   handle(f2)
        .word   handle(f3)
        .word   handle(f4)
        .word   handle(f5)
        .word   handle(f6)
        .word   handle(f7)
        .word   handle(f8)

table11:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

table12:
        .word   handle(F1)
        .word   handle(F2)
        .word   handle(F3)
        .word   handle(F4)
        .word   handle(F5)
        .word   handle(F6)
        .word   handle(F7)
        .word   handle(F8)

