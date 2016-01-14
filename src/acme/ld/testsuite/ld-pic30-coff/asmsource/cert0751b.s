                  .nolist
/*
    tblpage(namea)     Get page for table read/write operations
    tbloffset(namea)   Get pointer for table read/write operations
    psvpage(namea)     Get page for PSV data window operations
    psvoffset(namea)   Get pointer for PSV data window operations
    paddr(labela)      Get 24-bit address of label in program memory
    handle(labela)     Get 16-bit reference to label in program memory
    mov #.sizeof.(namea)    Get size of section name in address units
    mov #.startof.(namea)   Get starting address of section name
 */

                  .list

                  .text
text1_b:          .byte 1
                  .org 0x100
text2_b:          .byte 2
text3_b:          .byte 3
text4_b:          .byte 4
text5_b:          .byte 5
text6_b:          .byte 6
text7_b:          .byte 7
text8_b:          .byte 8

                  .global text1_b, text2_b, text3_b, text4_b
                  .global text5_b, text6_b, text7_b, text8_b

                  .pword tbloffset(data0_a)
                  .pword tblpage(data2_a)
                  .pword psvpage(data3_a)
                  .pword psvoffset(data4_a)
                  .pword paddr(data5_a)
                  .pword handle(data6_a)
                  
text9_b:          .byte 9
texta_b:          .byte 10
textb_b:          .byte 11
textc_b:          .byte 12
textd_b:          .byte 13
texte_b:          .byte 14
textf_b:          .byte 15

                  .global text9_b, texta_b, textb_b, textc_b
                  .global textd_b, texte_b, textf_b

                  .data
data0_b:          .byte 0x10
data1_b:          .byte 0x11
data2_b:          .byte 0x12
data3_b:          .byte 0x13
data4_b:          .byte 0x14
                  .org 0x100
data5_b:          .byte 0x15
data6_b:          .byte 0x16
data7_b:          .byte 0x17

                  .global data0_b, data1_b, data2_b, data3_b
                  .global data4_b, data5_b, data6_b, data7_b

                  .long tbloffset(data0_a)
                  .long tblpage(data2_a)
                  .long psvpage(data3_a)
                  .long psvoffset(data4_a)
                  .long paddr(data5_a)
                  .long handle(data6_a)

data8_b:          .byte 0x18
data9_b:          .byte 0x19
dataa_b:          .byte 0x1a

                  .global data8_b, data9_b, dataa_b

                  .section foo_r, "r"
foo_r0_b:         .byte 0x20
foo_r1_b:         .byte 0x21
foo_r2_b:         .byte 0x22
foo_r3_b:         .byte 0x23
foo_r4_b:         .byte 0x24

                  .global foo_r0_b, foo_r1_b, foo_r2_b
                  .global foo_r3_b, foo_r4_b

                  .org 0x100
foo_r5_b:         .byte 0x25
foo_r6_b:         .byte 0x26
foo_r7_b:         .byte 0x27

                  .global foo_r5_b, foo_r6_b, foo_r7_b

                  .long tbloffset(data0_a)
                  .long tblpage(data2_a)
                  .long psvpage(data3_a)
                  .long psvoffset(data4_a)
                  .long paddr(data5_a)
                  .long handle(data6_a)
                  
foo_r8_b:         .byte 0x28
foo_r9_b:         .byte 0x29
foo_ra_b:         .byte 0x2a

                  .global foo_r8_b, foo_r9_b, foo_ra_b

                  .section foo_x, "x"
foo_x0_b:         .byte 0x30
foo_x1_b:         .byte 0x31
foo_x2_b:         .byte 0x32
foo_x3_b:         .byte 0x33
foo_x4_b:         .byte 0x34

                  .global foo_x0_b, foo_x1_b, foo_x2_b
                  .global foo_x3_b, foo_x4_b
                

                  .org 0x100
foo_x5_b:         .byte 0x35
foo_x6_b:         .byte 0x36

                  .global foo_x5_b, foo_x6_b

                  .long tbloffset(data0_a)
                  .long tblpage(data2_a)
                  .long psvpage(data3_a)
                  .long psvoffset(data4_a)
                  .long paddr(data5_a)
                  .long handle(data6_a)
                  
foo_x7_b:         .byte 0x37
foo_x8_b:         .byte 0x38
foo_x9_b:         .byte 0x39
foo_xa_b:         .byte 0x3a

                  .global foo_x7_b, foo_x8_b, foo_x9_b, foo_xa_b

                  .section foo_n, "n"
foo_n0_b:         .byte 0x40
foo_n1_b:         .byte 0x41
foo_n2_b:         .byte 0x42
foo_n3_b:         .byte 0x43
foo_n4_b:         .byte 0x44

                  .global foo_n0_b, foo_n1_b, foo_n2_b
                  .global foo_n3_b, foo_n4_b

                  .org 0x100
foo_n5_b:         .byte 0x45
foo_n6_b:         .byte 0x46
foo_n7_b:         .byte 0x47

                  .global foo_n5_b, foo_n6_b, foo_n7_b

                  .long tbloffset(data0_a)
                  .long tblpage(data2_a)
                  .long psvpage(data3_a)
                  .long psvoffset(data4_a)
                  .long paddr(data5_a)
                  .long handle(data6_a)
                  
foo_n8_b:         .byte 0x48
foo_n9_b:         .byte 0x49
foo_na_b:         .byte 0x4a

                  .global foo_n8_b, foo_n9_b, foo_na_b

                  .section .const, "r"
const0_b:         .byte 0x60
const1_b:         .byte 0x61
const2_b:         .byte 0x62
const3_b:         .byte 0x63
const4_b:         .byte 0x64
const5_b:         .byte 0x65
const6_b:         .byte 0x66
const7_b:         .byte 0x67

                  .global const0_b, const1_b, const2_b, const3_b
                  .global const4_b, const5_b, const6_b, const7_b

                  .word tbloffset(data0_a)
                  .word tblpage(data2_a)
                  .word psvpage(data3_a)
                  .word psvoffset(data4_a)
                  .long paddr(data5_a)
                  .word handle(data6_a)
                  
const8_b:         .byte 0x68
const9_b:         .byte 0x69
consta_b:         .byte 0x6a

                  .global const8_b, const9_b, consta_b

                  .end


