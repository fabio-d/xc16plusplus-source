        ;; 
        ;; uses the config macro defined in p30f6014.inc
        ;;
        .include "p30f6014.inc"
        
        ;;
        ;; bit field equates
        ;; 
        .equiv FE,0x120000
        .equiv FI,0x003400
        .equiv FO,0x000056
        
        ;; 
        ;; set config word using inline assembly code
        ;; 
        .section __FOSC.sec,"x"
        .pword   0x1234

        ;; 
        ;; set config words using a macro
        ;; 
        config __FWDT, 0x1234
        config __FBORPOR, FE | FI | FO

        .text
        .global __reset
__reset:
        return
        
        
