        ;; 
        ;; test for implicit alignment
        ;; as defined in MPLAB C30 DOS 2.4.3.4
        ;;
        ;; implicit alignment of program memory occurs: 
        ;;
        ;;   a. when a label follows a data directive
        ;;   b. when an instruction follows a data directive
        ;;   c. upon transition between p-type data directives
        ;;        and normal data directives
        ;;   d. upon transition between sections
        ;; 
        
        .text
        .pbyte 1
        mov w0,w1               ; case (b)
T1:     .pbyte 1,2,3,4,5
T2:     .pbyte 6,7,8,9          ; case (a)
        .asciz "abcdefg"        ; case (c)


        .data                   ; case (d)
        .align 2
D1:     .byte 1,2,3,4,5
D2:     .byte 6,7,8,9
        .asciz "abcdefg"
