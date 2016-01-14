               .text
               .global _main, __reset
_main:               
__reset:       nop
               nop
               .equ text0a, 0
               .global text0a
               
               LNK #0
               
               LNK #text0b
               LNK #text1b
               LNK #foo0b
               LNK #foo1b
               LNK #text2b
               LNK #dat0b
               LNK #dat1b
               LNK #text3b
               LNK #foo2b
               LNK #foo3b

               nop
               ; Max 14-bit literal
               .set text1a, 16382
               .global text1a
               LNK #16382
               nop

               .section foo, "x"
               nop
               nop
               ; Max 14-bit literal               
               .equiv foo0a, 0
               .global foo0a
               LNK #text0b
               LNK #text1b
               LNK #foo0b
               LNK #foo1b
               LNK #text2b
               LNK #dat0b
               LNK #dat1b
               LNK #text3b
               LNK #foo2b
               LNK #foo3b

               nop
               .equiv foo1a, 16382
               .global foo1a
               nop
               
               
               .text
               nop
               .equ text2a, 2
               .global text2a
               nop
               LNK #text0b
               LNK #text1b
               LNK #foo0b
               LNK #foo1b
               LNK #text2b
               LNK #dat0b
               LNK #dat1b
               LNK #text3b
               LNK #foo2b
               LNK #foo3b
     
               nop
               ; Max 14-bit literal               
               .equ text3a, 16382
               .global text3a
               nop

               .data
               .align 2
dat0a:         .byte 1
               .global dat0a
               .align 2
dat1a:         .int 1
               .global dat1a
                 
               .section foo
               nop
               .equ foo2a, 2
               .equ foo3a, 16383-1
               .global foo2a
               .global foo3a
               nop
               LNK #text0b
               LNK #text1b
               LNK #foo0b
               LNK #foo1b
               LNK #text2b
               LNK #text3b
               LNK #foo2b
               LNK #foo3b
               
               .end
