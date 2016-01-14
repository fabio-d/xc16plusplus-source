        .text
        .global __reset
__reset:
        .global L_prog0,L_prog1,L_prog2,L_prog3,L_prog4
        .global L_prog5,L_prog6,L_prog7,L_prog8,L_prog9
        .global L_progA,L_progB,L_progC,L_progD,L_progE
L_progE:  .pword 0xeeeeee
L_progD:  .pword 0xdddddd
L_progC:  .pword 0xcccccc
L_progB:  .pword 0xbbbbbb
L_progA:  .pword 0xaaaaaa
L_prog9:  .pword 0x999999
L_prog8:  .pword 0x888888
L_prog7:  .pword 0x777777
L_prog6:  .pword 0x666666
L_prog5:  .pword 0x555555
L_prog4:  .pword 0x444444
L_prog3:  .pword 0x333333
L_prog2:  .pword 0x222222
L_prog1:  .pword 0x111111
L_prog0:  .pword 0

        .bss
        .global L_data0,L_data1,L_data2,L_data3,L_data4
        .global L_data5,L_data6,L_data7,L_data8,L_data9
        .global L_dataA,L_dataB,L_dataC,L_dataD,L_dataE
L_dataE:  .space 1
L_dataD:  .space 1
L_dataC:  .space 1
L_dataB:  .space 1
L_dataA:  .space 1
L_data9:  .space 1
L_data8:  .space 1
L_data7:  .space 1
L_data6:  .space 1
L_data5:  .space 1
L_data4:  .space 1
L_data3:  .space 1
L_data2:  .space 1
L_data1:  .space 1
L_data0:  .space 1
        
        .section foo,eedata
        .global L_eedata0,L_eedata1,L_eedata2,L_eedata3,L_eedata4,
        .global L_eedata5,L_eedata6,L_eedata7,L_eedata8,L_eedata9,
        .global L_eedataA,L_eedataB,L_eedataC,L_eedataD,L_eedataE,
L_eedataE:  .space 1
L_eedataD:  .space 1
L_eedataC:  .space 1
L_eedataB:  .space 1
L_eedataA:  .space 1
L_eedata9:  .space 1
L_eedata8:  .space 1
L_eedata7:  .space 1
L_eedata6:  .space 1
L_eedata5:  .space 1
L_eedata4:  .space 1
L_eedata3:  .space 1
L_eedata2:  .space 1
L_eedata1:  .space 1
L_eedata0:  .space 1
