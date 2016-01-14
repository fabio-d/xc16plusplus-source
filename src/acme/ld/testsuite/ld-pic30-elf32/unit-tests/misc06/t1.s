        ;; misc06
        ;; 
        ;; Regression test of generic data window access
        ;;  in code and data sections.
        ;;
        ;; Requires custom linker script to locate .dinit
        ;;  section after .const.
        ;; 
        ;; All "bar"  addresses should be 0x8200
        ;; All "bop"  addresses should be 0x8400
        ;; All "beep" addresses should be 0xC400
        ;; 
        .global __reset
__reset:

t1:  
        ;; .text references in code section
        ;mov     _bar,w0   ; not supported as of v1.10
        ;mov     #_bar,w0  ; not supported as of v1.10

        .word   psvoffset(_bar)
        .long   psvoffset(_bar)

        .pword  psvoffset(_bar)
                
        mov     #psvoffset(_bar),w0
        
t2:
        ;;  .const references (low half of PSV page) in code section
        mov     _bop,w0
        mov     #_bop,w0
        
        .word   _bop
        .long   _bop

        .pword  _bop
                
        mov     #psvoffset(_bop),w0
        
t3:
        ;;  .const references (upper half of PSV page) in code section
        mov     _beep,w0
        mov     #_beep,w0
        
        .word   _beep
        .long   _beep
        
        .pword  _beep
                
        mov     #psvoffset(_beep),w0
        
t4:
        ;; .text references in data section
        .data
        .word   psvoffset(_bar)
        .long   paddr(_bar)       

t5:
        ;; .const references (low half of PSV page) in data section
        .data
        .word   _bop
        .long   _bop       

t6:
        ;; .const references (high half of PSV page) in data section
        .data
        .word   _beep
        .long   _beep       

targets:                      
        ;; define target symbol in .text section
        .text
        .org    0x100
        .global _bar
_bar:

        ;; define target symbol in .const section (low half)
        .section .const,"r"
        .org    0x200
        .global _bop
_bop:
        
        ;; define target symbol in .const section (upper half)
        .section .const,"r"
        .org    0x4200
        .global _beep
_beep:  

