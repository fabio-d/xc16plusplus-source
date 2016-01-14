
               .text
               nop
text0:         nop

               LNK #dat0
               LNK #nx0
               LNK #dat1
               LNK #nx1
               LNK #nx2
               LNK #nx3

text1:         nop
               nop

               .section foo,code
               nop
foo0:          nop

               LNK #nx0
               LNK #dat0
               LNK #nx1
               LNK #nx2
               LNK #nx3               
               LNK #dat1

foo1:          nop
               nop
               
               .text
text2:         nop
               nop
               
               LNK #dat0
               LNK #dat1

text3:         nop
               nop
               
               .section en,noload,data
               .byte 1
               .align 2
nx0:           .word 2
nx1:           .byte 3
	       .align 2
               .word 4
               
               .section ex,code

               LNK #dat0
               LNK #dat1
               LNK #nx0
               LNK #nx1
               LNK #nx2
               LNK #nx3
               
               .data
               .align 2
dat0:          .byte 1
               .align 2
dat1:          .int 1
                 
               .section foo
               nop
foo2:          nop
foo3:          nop
               nop
               
               .section en
               .align 2
               .byte 5
               .align 2
nx2:           .word 6
nx3:           .byte 7
               .word 8

               .end

