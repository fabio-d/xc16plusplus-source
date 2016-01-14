        ;;
        ;; reloc090
        ;; 
                .text
        .global __reset
__reset:
        bra     T1

        .global func1
        ;; near space, below tests
func1:
        mov     #0x100,w0
        return

T1:     
        mov     #handle(func1),w0
        call    w0
        call    print_w0
        call    print_CR

T2:     
        mov     #handle(func2),w0
        call    w0
        call    print_w0
        call    print_CR

T3:     
        mov     #handle(func3),w0
        call    w0
        call    print_w0
        call    print_CR
        mov     #handle(func3),w0 ; catch multiple symbol definitions

T4:     
        mov     #handle(func4),w0
        call    w0
        call    print_w0
        call    print_CR

        call    print_done
        .pword  0xda6000         ; break

        .global func2
        ;; near space, after tests
func2:
        mov     #0x200,w0
        return

        .org 0x10000            ; move into far program space

        ;; .global func3 
        ;; far space
func3:
        mov     #0x300,w0
        return

        .global func4
        ;; far space
func4:
        mov     #0x400,w0
        return

