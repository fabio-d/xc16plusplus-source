;;
;; This test is derived from a problem identified by FLUKE Networks
;;      
;; Note that sections are positioned so that .const crosses a PSV
;; page boundary. This forces the memory re-allocation stage in
;; xc16-ld v1.20, which demonstrates the FLUKE problem.
;;
;; The custom linker script for this test is derived from p30f6014.gld
;; 
;; lkr044: NOLOAD sections should not cause address conflicts (SSR#23628)
;; lkr045: NOLOAD sections in program memory (SSR# 23629)
;;
        .global __reset
__reset:
        nop

        .section .const,"r"
        .org 0x2000
        .word 0x3412

        .section .english,"r"
        .if 0
        .word L1    
        .endif     
        .word 0xaaaa
L1:     .word 0xaaaa

        .section .german,"r"
        .if 0
        .word L2
        .endif
        .word 0xbbbb
L2:     .word 0xbbbb

        .section .french,"r"
        .if 0
        .word L3
        .endif
        .word 0xcccc
L3:     .word 0xcccc

        .text
        .org 0x7000
        nop
        