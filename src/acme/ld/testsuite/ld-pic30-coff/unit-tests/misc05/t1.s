        ; 
        ; Sample Source Code. For illustration only.
        ;
        ; Demonstrates how to access constants through
        ;  the data memory window.

        ; dsPIC registers
        .equ CORCONL, 0x0044
        .equ U1MOD,   0x020C
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
        .global __reset
__reset:
        ; enable Program Space Visibility
        bset.b  CORCONL,#PSV

        ; set PSVPAG to page that contains 'hello'
        mov     #psvpage(hello),w0
        mov     w0,_PSVPAG

        ; make a pointer to 'hello'
        mov     #psvoffset(hello),w0

        ; print it
        rcall   _print_string
        .pword  0xda6000         ; break

        .section .const, "r"
hello:  
        .ascii  "Hello world!\n\0"

        .text 
                     
        ; print the null-terminated string at [w0]
        ;
        ; registers used: w0,w1
        ;
        ; note: the leading underbar permits this
        ;  function to be called from C programs
        ;
        .global _print_string
_print_string:
        mov     w0,w1
1:      
        cp0.b   [w1]
        bra     z,9f
        mov.b   [w1++],w0
        rcall   _print_char
        bra     1b
9:
        rcall   _print_done
        return

        .global _print_char
        ;; print the character in w0
        ;; all registers preserved
_print_char:
        push    w1
        mov     #U1MOD,w1       ; if ((U1MOD & SPEN) == 0)
        btst    [w1],#SPEN
        bra     nz,1f

        clr     BRG1            ;   BRG1 = 0
        bset    [w1],#SPEN      ;   U1MOD |= SPEN

1:      mov     #U1STA,w1       ; if ((U1STA & TXEN) == 0)
        btst    [w1],#TXEN
        bra     nz,2f

        bset    [w1],#TXEN      ;   U1STA |= TXEN

2:      btst    [w1],#TXBF      ; while (U1STA & TXBF) ;
        bra     nz,2b

        mov.b   WREG,TX1REG     ; print it
        pop     w1
        return

        .global _print_done
        ;; wait for the transmit buffer to empty
        ;; all registers preserved
_print_done:
        push    w1
        mov     #U1STA,w1       ; while (U1STA & TRMT) ;
1:      btst    [w1],#TRMT
        bra     z,1b
        pop     w1
        return
        
    
                 