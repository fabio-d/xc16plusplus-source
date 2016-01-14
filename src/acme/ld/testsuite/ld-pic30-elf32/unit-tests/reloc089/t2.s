        ;; reloc089
        ;;
        ;; symB3 and symB5 should overflow
        ;;  the MOV #sym,w0 instruction
        ;; 
                .text 
        
        .equiv  symB1, -32767
        .equiv  symB2, -32768
        .equiv  symB3, -32769
        .equiv  symB4, 65535
        .equiv  symB5, 65536

        .global symB1,symB2,symB3,symB4,symB5
        