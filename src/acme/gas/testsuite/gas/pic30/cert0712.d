#as:
#objdump: -s -j ".text"
#name: .pincbin directive unaligned in .text
#source: cert0712.s

.+\.o:     file format coff-pic30

Contents of section \.text:
 0000 0040da 000000 000000 000000  \.@Ú\.\.\.\.\.\.\.\.\.
 0008 000102 030405 060708 090a0b  \.\.\.\.\.\.\.\.\.	\.\.
 0010 0c0d0e 0f1011 121314 151617  \.\.\.\.\.\.\.\.\.\.\.\.
 0018 18191a 1b1c1d 1e1f20 212223  \.\.\.\.\.\.\.\. \!\"\#
 0020 242526 272829 2a2b2c 2d2e2f  \$%&\'\(\)\*\+,-\./
 0028 303132 333435 363738 393a3b  0123456789:;
 0030 3c3d3e 3f4041 424344 454647  \<=\>\?@ABCDEFG
 0038 48494a 4b4c4d 4e4f50 515253  HIJKLMNOPQRS
 0040 545556 575859 5a5b5c 5d5e5f  TUVWXYZ\[\\\]\^_
 0048 606162 636465 666768 696a6b  \`abcdefghijk
 0050 6c6d6e 6f7071 727374 757677  lmnopqrstuvw
 0058 78797a 7b7c7d 7e7f80 818283  xyz\{\|\}~\.\.\.‚ƒ
 0060 848586 878889 8a8b8c 8d8e8f  „…†‡\.‰Š‹Œ\.\.
 0068 909192 939495 969798 999a9b  \.‘’“”•–—\.\.š›
 0070 9c9d9e 9fa0a1 a2a3a4 a5a6a7  œ\.Ÿ ¡¢£¤¥¦§
 0078 a8a9aa abacad aeafb0 b1b2b3  ¨©ª«¬­®¯°±²³
 0080 b4b5b6 b7b8b9 babbbc bdbebf  ´µ¶·¸¹º»¼½¾¿
 0088 c0c1c2 c3c4c5 c6c7c8 c9cacb  ÀÁÂÃÄÅÆÇÈÉÊË
 0090 cccdce cfd0d1 d2d3d4 d5d6d7  ÌÍÎÏĞÑÒÓÔÕÖ×
 0098 d8d9da dbdcdd dedfe0 e1e2e3  ØÙÚÛÜİŞßàáâã
 00a0 e4e5e6 e7e8e9 eaebec edeeef  äåæçèéêëìíîï
 00a8 f0f1f2 f3f4f5 f6f7f8 f9fafb  ğñòóôõö÷øùúû
 00b0 fcfdfe ff0000                üışÿ\.\.      
