                  .nolist
/*

 */

                  .list

                  .text
text1:            .byte 1
                  .org 0x100, 0xa5
text2:            .byte 2
text3:            .byte 3
text4:            .byte 4
text5:            .byte 5
text6:            .byte 6
text7:            .byte 7
text8:            .byte 8

                  mov #.sizeof.(.pbss), w0
                  mov #.startof.(.pbss), w0

text9:            .byte 9
texta:            .byte 10
textb:            .byte 11
textc:            .byte 12
textd:            .byte 13
texte:            .byte 14
textf:            .byte 15

                  .data
data0:            .byte 0x10
data1:            .byte 0x11
data2:            .byte 0x12
data3:            .byte 0x13
data4:            .byte 0x14
                  .org 0x100, 0xa6
data5:            .byte 0x15
data6:            .byte 0x16
data7:            .byte 0x17

                  .int .sizeof.(.pbss)
                  .int .startof.(.pbss)

data8:            .byte 0x18
data9:            .byte 0x19
dataa:            .byte 0x1a

                  .section foo_r, "r"
foo_r0:           .byte 0x20
foo_r1:           .byte 0x21
foo_r2:           .byte 0x22
foo_r3:           .byte 0x23
foo_r4:           .byte 0x24
                  .org 0x100, 0xa7
foo_r5:           .byte 0x25
foo_r6:           .byte 0x26
foo_r7:           .byte 0x27

                  .int .sizeof.(.pbss)
                  .int .startof.(.pbss)

foo_r8:           .byte 0x28
foo_r9:           .byte 0x29
foo_ra:           .byte 0x2a

                  .section foo_x, "x"
foo_x0:           .byte 0x30
foo_x1:           .byte 0x31
foo_x2:           .byte 0x32
foo_x3:           .byte 0x33
foo_x4:           .byte 0x34
                  .org 0x100, 0xa8
foo_x5:           .byte 0x35
foo_x6:           .byte 0x36

                  mov #.sizeof.(.pbss), w0
                  mov #.startof.(.pbss), w0

foo_x7:           .byte 0x37
foo_x8:           .byte 0x38
foo_x9:           .byte 0x39
foo_xa:           .byte 0x3a

                  .section foo_n, "n"
foo_n0:           .byte 0x40
foo_n1:           .byte 0x41
foo_n2:           .byte 0x42
foo_n3:           .byte 0x43
foo_n4:           .byte 0x44
                  .org 0x100, 0xa9
foo_n5:           .byte 0x45
foo_n6:           .byte 0x46
foo_n7:           .byte 0x47

                  .int .sizeof.(.pbss)
                  .int .startof.(.pbss)

foo_n8:           .byte 0x48
foo_n9:           .byte 0x49
foo_na:           .byte 0x4a

                  .section foo_nd, "nd"
foo_nd0:          .byte 0x50
foo_nd1:          .byte 0x51
foo_nd2:          .byte 0x52
foo_nd3:          .byte 0x53
foo_nd4:          .byte 0x54
                  .org 0x100, 0xaa
foo_nd5:          .byte 0x55
foo_nd6:          .byte 0x56
foo_nd7:          .byte 0x57

                  .long .sizeof.(.pbss)
                  .long .startof.(.pbss)

foo_nd8:          .byte 0x58
foo_nd9:          .byte 0x59
foo_nda:          .byte 0x5a

                  .section .const, "r"
const0:           .byte 0x60
const1:           .byte 0x61
const2:           .byte 0x62
const3:           .byte 0x63
const4:           .byte 0x64
const5:           .byte 0x65
const6:           .byte 0x66
const7:           .byte 0x67

                  .int .sizeof.(.pbss)
                  .int .startof.(.pbss)

const8:           .byte 0x68
const9:           .byte 0x69
consta:           .byte 0x6a

                  .section .pbss
pbss0:           .byte 0x70
pbss1:           .byte 0x71
pbss2:           .byte 0x72
pbss3:           .byte 0x73
pbss4:           .byte 0x74
pbss5:           .byte 0x75
pbss6:           .byte 0x76
pbss7:           .byte 0x77

                  .int .sizeof.(.pbss)
                  .int .startof.(.pbss)

pbss8:           .byte 0x78
pbss9:           .byte 0x79
pbssa:           .byte 0x7a

                  .end


