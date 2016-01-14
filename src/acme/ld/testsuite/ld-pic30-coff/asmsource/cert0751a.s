                  .nolist
/*
    tblpage(name)     Get page for table read/write operations
    tbloffset(name)   Get pointer for table read/write operations
    psvpage(name)     Get page for PSV data window operations
    psvoffset(name)   Get pointer for PSV data window operations
    paddr(label)      Get 24-bit address of label in program memory
    handle(label)     Get 16-bit reference to label in program memory
    mov #.sizeof.(name)    Get size of section name in address units
    mov #.startof.(name)   Get starting address of section name
 */

                  .list

                  .text
text1_a:          .byte 1
                  .org 0x100, 0
text2_a:          .byte 2
text3_a:          .byte 3
text4_a:          .byte 4
text5_a:          .byte 5
text6_a:          .byte 6
text7_a:          .byte 7
text8_a:          .byte 8

                  .global _main, __reset

_main:
__reset:          BRA .

                  .global text1_a, text2_a, text3_a, text4_a
                  .global text5_a, text6_a, text7_a, text8_a
                
                  .pword tbloffset(data0_b)
                  .pword tblpage(data2_b)
                  .pword psvpage(data3_b)
                  .pword psvoffset(data4_b)
                  .pword paddr(data5_b)
                  .pword handle(data6_b)

text9_a:          .byte 9
texta_a:          .byte 10
textb_a:          .byte 11
textc_a:          .byte 12
textd_a:          .byte 13
texte_a:          .byte 14
textf_a:          .byte 15

                  .global text9_a, texta_a, textb_a, textc_a
                  .global textd_a, texte_a, textf_a

                  .data
data0_a:          .byte 0x10
data1_a:          .byte 0x11
data2_a:          .byte 0x12
data3_a:          .byte 0x13
data4_a:          .byte 0x14
                  .org 0x100, 0
data5_a:          .byte 0x15
data6_a:          .byte 0x16
data7_a:          .byte 0x17

                  .global data0_a, data1_a, data2_a, data3_a
                  .global data4_a, data5_a, data6_a, data7_a
                  
                  .long tbloffset(data0_b)
                  .long tblpage(data2_b)
                  .long psvpage(data3_b)
                  .long psvoffset(data4_b)
                  .long paddr(data5_b)
                  .long handle(data6_b)
                  
data8_a:          .byte 0x18
data9_a:          .byte 0x19
dataa_a:          .byte 0x1a

                  .global data8_a, data9_a, dataa_a

                  .section foo_r, "r"
foo_r0_a:         .byte 0x20
foo_r1_a:         .byte 0x21
foo_r2_a:         .byte 0x22
foo_r3_a:         .byte 0x23
foo_r4_a:         .byte 0x24

                  .global foo_r0_a, foo_r1_a, foo_r2_a
                  .global foo_r3_a, foo_r4_a

                  .org 0x100
foo_r5_a:         .byte 0x25
foo_r6_a:         .byte 0x26
foo_r7_a:         .byte 0x27

                  .global foo_r5_a, foo_r6_a, foo_r7_a

                  .long tbloffset(data0_b)
                  .long tblpage(data2_b)
                  .long psvpage(data3_b)
                  .long psvoffset(data4_b)
                  .long paddr(data5_b)
                  .long handle(data6_b)
                  
foo_r8_a:         .byte 0x28
foo_r9_a:         .byte 0x29
foo_ra_a:         .byte 0x2a

                  .global foo_r8_a, foo_r9_a, foo_ra_a

                  .section foo_x, "x"
foo_x0_a:         .byte 0x30
foo_x1_a:         .byte 0x31
foo_x2_a:         .byte 0x32
foo_x3_a:         .byte 0x33
foo_x4_a:         .byte 0x34

                  .global foo_x0_a, foo_x1_a, foo_x2_a
                  .global foo_x3_a, foo_x4_a
                

                  .org 0x100
foo_x5_a:         .byte 0x35
foo_x6_a:         .byte 0x36

                  .global foo_x5_a, foo_x6_a

                  .long tbloffset(data0_b)
                  .long tblpage(data2_b)
                  .long psvpage(data3_b)
                  .long psvoffset(data4_b)
                  .long paddr(data5_b)
                  .long handle(data6_b)

foo_x7_a:         .byte 0x37
foo_x8_a:         .byte 0x38
foo_x9_a:         .byte 0x39
foo_xa_a:         .byte 0x3a

                  .global foo_x7_a, foo_x8_a, foo_x9_a, foo_xa_a

                  .section foo_n, "n"
foo_n0_a:         .byte 0x40
foo_n1_a:         .byte 0x41
foo_n2_a:         .byte 0x42
foo_n3_a:         .byte 0x43
foo_n4_a:         .byte 0x44

                  .global foo_n0_a, foo_n1_a, foo_n2_a
                  .global foo_n3_a, foo_n4_a

                  .org 0x100
foo_n5_a:         .byte 0x45
foo_n6_a:         .byte 0x46
foo_n7_a:         .byte 0x47

                  .global foo_n5_a, foo_n6_a, foo_n7_a

                  .long tbloffset(data0_b)
                  .long tblpage(data2_b)
                  .long psvpage(data3_b)
                  .long psvoffset(data4_b)
                  .long paddr(data5_b)
                  .long handle(data6_b)
                  
foo_n8_a:         .byte 0x48
foo_n9_a:         .byte 0x49
foo_na_a:         .byte 0x4a

                  .global foo_n8_a, foo_n9_a, foo_na_a

                  .section .const, "r"
const0_a:         .byte 0x60
const1_a:         .byte 0x61
const2_a:         .byte 0x62
const3_a:         .byte 0x63
const4_a:         .byte 0x64
const5_a:         .byte 0x65
const6_a:         .byte 0x66
const7_a:         .byte 0x67

                  .global const0_a, const1_a, const2_a, const3_a
                  .global const4_a, const5_a, const6_a, const7_a

                  .word tbloffset(data0_b)
                  .word tblpage(data2_b)
                  .word psvpage(data3_b)
                  .word psvoffset(data4_b)
                  .long paddr(data5_b)
                  .word handle(data6_b)

const8_a:         .byte 0x68
const9_a:         .byte 0x69
consta_a:         .byte 0x6a

                  .global const8_a, const9_a, consta_a

                  .end


