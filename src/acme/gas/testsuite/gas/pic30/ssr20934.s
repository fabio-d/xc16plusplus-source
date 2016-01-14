          .text
here:     .word 0x1234
          pop here
          mov here, w1
          mov #here,w0
          .byte here
          .word here
          .long here
          
          mov #psvoffset(here), w0
          .word psvoffset(here)
          .long paddr(here)

         .end
 
