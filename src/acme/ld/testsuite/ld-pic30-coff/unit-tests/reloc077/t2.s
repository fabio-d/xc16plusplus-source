        ;; reloc077
        ;;
        ;; symB1,symB2 and symB5 should overflow
        ;;  the trap #sym instruction
        ;; 
                .text 
        
        .equiv  symB1, -2
        .equiv  symB2, -1
        .equiv  symB3, 0
        .equiv  symB4, 65535
        .equiv  symB5, 65536

        .global symB1,symB2,symB3,symB4,symB5
        