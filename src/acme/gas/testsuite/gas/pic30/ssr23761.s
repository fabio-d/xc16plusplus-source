
             .macro mymac1
             mov #1, w1
             .endm

             .macro mymac1 parm0, parm1
             mov #2, w1
             .endm

             .macro mymac2
             mov #3, w1
             .endm

             .macro mymac23 parm0, parm1
             mov #4, w1
             .endm


             .text

1:           NOP
             mymac1 1,2
2:           NOP
             mymac2
             NOP
             mymac23

             .end

