#ld: 
#objects: /ld-pic30-coff/ssr_20978a.out /ld-pic30-coff/ssr_20978b.out
#name: R_PIC30_FILE_REG_WORD and R_PIC30_FILE_REG_WORD_WITH_DST on odd address is not prevented

.*ssr_20978a.out\(\.text\+0x0\):fake: Link Error: Cannot access symbol \(foo\) at an odd address\.
.*ssr_20978a.out\(\.text\+0x2\):fake: Link Error: Cannot access symbol \(foo\) at an odd address\.
.*ssr_20978a.out\(\.text\+0x4\):fake: Link Error: Cannot access symbol \(foo\) at an odd address\.
.*ssr_20978a.out\(\.text\+0x6\):fake: Link Error: Cannot access symbol \(foo\) at an odd address\.
