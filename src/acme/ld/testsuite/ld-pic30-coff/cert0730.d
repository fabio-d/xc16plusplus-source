#name: Linker warning with shift count of 16 or -16
#ld:
#objects: /ld-pic30-coff/cert0730a.out /ld-pic30-coff/cert0730b.out

.*cert0730a\.out\(\.text\+0xc\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_b
.*cert0730a\.out\(\.text\+0xe\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_b
.*cert0730a\.out\(\.text\+0x1e\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_b
.*cert0730a\.out\(\.text\+0x20\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_b
.*cert0730b\.out\(\.text\+0xc\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_a
.*cert0730b\.out\(\.text\+0xe\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_a
.*cert0730b\.out\(\.text\+0x1e\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_a
.*cert0730b\.out\(\.text\+0x20\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_a
.*cert0730a\.out\(foo\+0xc\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_b
.*cert0730a\.out\(foo\+0xe\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_b
.*cert0730a\.out\(foo\+0x1e\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_b
.*cert0730a\.out\(foo\+0x20\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_b
.*cert0730b\.out\(foo\+0xc\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_a
.*cert0730b\.out\(foo\+0xe\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_a
.*cert0730b\.out\(foo\+0x1e\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 seventeen_a
.*cert0730b\.out\(foo\+0x20\):fake: Link Error: relocation truncated to fit: DSP SIGNED 6 negseventeen_a
