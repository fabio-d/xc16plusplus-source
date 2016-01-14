        ; dsPIC registers
        .equ CORCONL, 0x0044
        .equ U1MOD,   0x20C
        .equ U1STA,   0x020E
        .equ TX1REG,  0x0210
        .equ RX1REG,  0x0212
        .equ BRG1,    0x0214

        ; control bit values
        .equ PSV,     0x2
        .equ SPEN,    0xF
        .equ TXMIT,   0x5
        .equ TXEN,    0xA
        .equ TRMT,    0x8
        .equ TXBF,    0x9
        .equ RCDA,    0x0
        
        .text              
        ; print the null-terminated string at [w0]
        ;
        ; registers used: w0,w1
        ;
        .global _print_string
_print_string:
        push    w0
        call    print_w0
        mov     #':',w0
        call    print_char
        mov     #' ',w0
        call    print_char
        pop     w1
1:      
        cp0.b   [w1]
        bra     z,9f
        mov.b   [w1++],w0
        rcall   print_char
        bra     1b
9:
        rcall   print_done
        return

        .global print_w0
        ;; print the hex value in w0
        ;; all registers preserved
print_w0:
        swap    w0              ; swap bytes
        swap.b  w0              ; swap nibbles
        rcall    print_hex_digit ; print MSdigit
        swap.b  w0
        rcall    print_hex_digit ; print the next one
        swap    w0
        swap.b  w0
        rcall    print_hex_digit
        swap.b  w0
        rcall    print_hex_digit
        return

        .global print_hex_digit
        ;; print a hex digit to represent the low nibble in w0
        ;; all registers preserved
print_hex_digit:
        push    w0              ; save regs
        push    w1      
        and     #0x0F,w0        ; mask it
        cp      w0,#9           ; compare (w0 - 9)
        bra     gt,2f           ; br if w0 > 9
        ;; numbers
1:      mov     #48,w1
        bra     3f
        ;; letters
2:      mov     #55,w1  

3:      add     w0,w1,w0        ; compute the ascii value
        
        rcall   print_char      ; print it
        
        pop     w1
        pop     w0              ; restore regs
        return

        .global print_CR
        ;; print a CR
        ;; all registers preserved
print_CR:
        push    w0
        mov.b   #0x0A,w0
        
        rcall   print_char
        pop     w0
        return
                
        .global print_char
        ;; print the character in w0
        ;; all registers preserved
print_char:
        push    w1
        mov     #U1MOD,w1       ; if ((U1MOD & SPEN) == 0)
        btst    [w1],#SPEN
        bra     nz,1f

        clr     BRG1            ; BRG1 = 0
        bset    [w1],#SPEN      ; U1MOD |= SPEN

1:      mov     #U1STA,w1       ; if ((U1STA & TXEN) == 0)
        btst    [w1],#TXEN
        bra     nz,2f

        bset    [w1],#TXEN      ; U1STA |= TXEN

2:      btst    [w1],#TXBF      ; while (U1STA & TXBF) ;
        bra     nz,2b

        mov.b   WREG,TX1REG     ;  print it
        pop     w1
        return

        .global print_done
        ;; wait for the transmit buffer to empty
        ;; all registers preserved
print_done:
        push    w1
        mov     #U1STA,w1       ; while (U1STA & TRMT) ;
1:      btst    [w1],#TRMT
        bra     z,1b
        pop     w1
        return
        
       