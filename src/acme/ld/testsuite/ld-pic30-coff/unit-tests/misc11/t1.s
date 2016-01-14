        ;;
        ;; misc10
        ;;
        .text
        .global __reset
__reset:
        ;; functions defined in this file
        call    F1              ; weak<global
        call    F2              ; global>weak
        call    F3              ; weak only

        ;; functions defined in other files
        call    F4              ; weak<global
        call    F5              ; global>weak
        call    F6              ; weak only
        
        .weak F1
F1:     nop

        .global F2
F2:     clr w2

        .weak F3
F3:     clr w3
        
        .weak S0
        .global S1
        .global S2

zero:
        .pword   S0
one:    
        .pword   S1
two:    
        .pword   S2
three:
        .pword   S3
        
