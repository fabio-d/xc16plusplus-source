#name: Error when using executable or readonly special operators on data labels
#ld:
#objects: /ld-pic30-coff/cert0751a.out /ld-pic30-coff/cert0751b.out

jump_table\(\.handle\+0x0\): Link Error: Symbol \(data6_b\) is not located in an executable section\.
jump_table\(\.handle\+0x2\): Link Error: Symbol \(data6_b\) is not located in an executable section\.
jump_table\(\.handle\+0x4\): Link Error: Symbol \(data6_a\) is not located in an executable section\.
jump_table\(\.handle\+0x6\): Link Error: Symbol \(data6_a\) is not located in an executable section\.
.*cert0751a\.out\(\.text\+0x110\):fake: Link Error: Cannot use P-TBLOFFSET on a symbol \(data0_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.text\+0x112\):fake: Link Error: Cannot use P-TBLPAGE on a symbol \(data2_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.text\+0x114\):fake: Link Error: Cannot use P-PSVPAGE on a symbol \(data3_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.text\+0x116\):fake: Link Error: Cannot use P-PSVOFFSET on a symbol \(data4_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.text\+0x118\):fake: Link Error: Cannot use P-PADDR on a symbol \(data5_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.text\+0x11a\):fake: Link Error: Cannot use P-HANDLE on a symbol \(data6_b\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x10e\):fake: Link Error: Cannot use P-TBLOFFSET on a symbol \(data0_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x110\):fake: Link Error: Cannot use P-TBLPAGE on a symbol \(data2_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x112\):fake: Link Error: Cannot use P-PSVPAGE on a symbol \(data3_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x114\):fake: Link Error: Cannot use P-PSVOFFSET on a symbol \(data4_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x116\):fake: Link Error: Cannot use P-PADDR on a symbol \(data5_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.text\+0x118\):fake: Link Error: Cannot use P-HANDLE on a symbol \(data6_a\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x103\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x107\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x10b\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x10f\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x113\):fake: Link Error: Cannot use PADDR on a symbol \(data5_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.data\+0x117\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_b\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x103\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x107\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x10b\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x10f\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x113\):fake: Link Error: Cannot use PADDR on a symbol \(data5_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.data\+0x117\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_a\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0x8\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0xa\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0xc\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0xe\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0x10\):fake: Link Error: Cannot use PADDR on a symbol \(data5_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(\.const\+0x14\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_b\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0x8\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0xa\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0xc\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0xe\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0x10\):fake: Link Error: Cannot use PADDR on a symbol \(data5_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(\.const\+0x14\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_a\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x103\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x107\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x10b\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x10f\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x113\):fake: Link Error: Cannot use PADDR on a symbol \(data5_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_r\+0x117\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_b\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x103\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x107\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x10b\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x10f\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x113\):fake: Link Error: Cannot use PADDR on a symbol \(data5_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_r\+0x117\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_a\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x102\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x106\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x10a\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x10e\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x112\):fake: Link Error: Cannot use PADDR on a symbol \(data5_b\) that is not located in an executable or readonly section\.
.*cert0751a\.out\(foo_x\+0x116\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_b\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x102\):fake: Link Error: Cannot use TBLOFFSET on a symbol \(data0_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x106\):fake: Link Error: Cannot use TBLPAGE on a symbol \(data2_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x10a\):fake: Link Error: Cannot use PSVPAGE on a symbol \(data3_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x10e\):fake: Link Error: Cannot use PSVOFFSET on a symbol \(data4_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x112\):fake: Link Error: Cannot use PADDR on a symbol \(data5_a\) that is not located in an executable or readonly section\.
.*cert0751b\.out\(foo_x\+0x116\):fake: Link Error: Cannot use HANDLE \(pointer to function\) on a symbol \(data6_a\) that is not located in an executable or readonly section\.
