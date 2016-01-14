               .text
               nop
               nop
               .equ text0b, 0
               .global text0b
               
               LNK #0
               
               LNK #text0a
               LNK #text1a
               LNK #foo0a
               LNK #foo1a
               LNK #text2a
               LNK #dat0a
               LNK #dat1a
               LNK #text3a
               LNK #foo2a
               LNK #foo3a

               nop
               ; Max 14-bit literal
               .set text1b, 16382
               .global text1b
               LNK #16382
               nop

               .section foo, "x"
               nop
               nop
               ; Max 14-bit literal               
               .equiv foo0b, 0
               .global foo0b
               LNK #text0a
               LNK #text1a
               LNK #foo0a
               LNK #foo1a
               LNK #text2a
               LNK #dat0a
               LNK #dat1a
               LNK #text3a
               LNK #foo2a
               LNK #foo3a

               nop
               .equiv foo1b, 16382
               .global foo1b
               nop
               
               
               .text
               nop
               .equ text2b, 2
               .global text2b
               nop
               LNK #text0a
               LNK #text1a
               LNK #foo0a
               LNK #foo1a
               LNK #text2a
               LNK #dat0b
               LNK #dat1a
               LNK #text3a
               LNK #foo2a
               LNK #foo3a
       
               nop
               ; Max 14-bit literal               
               .equ text3b, 16382
               .global text3b
               nop

               .data
               .align 2
dat0b:         .byte 1
               .global dat0b
               .align 2
dat1b:         .int 1
               .global dat1b
                 
               .section foo
               nop
               .equ foo2b, 2
               .equ foo3b, 16383-1
               .global foo2b
               .global foo3b
               nop
               LNK #text0a
               LNK #text1a
               LNK #foo0a
               LNK #foo1a
               LNK #text2a
               LNK #text3a
               LNK #foo2a
               LNK #foo3a


               .end
