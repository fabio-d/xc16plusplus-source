#as: 
#name: .incbin directive unaligned in .bss
#objdump: -s -j ".eedata"
#source: cert0707.s

.*.o:     file format coff-pic30

Contents of section \.eedata:
 0000 00000000 00000102 03040506 0708090a  \.\.\.\.\.\.\.\.\.\.\.\.\.\.	\.
 0010 0b0c0d0e 0f101112 13141516 1718191a  \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.
 0020 1b1c1d1e 1f202122 23242526 2728292a  \.\.\.\.\. \!\"\#\$%&\'\(\)\*
 0030 2b2c2d2e 2f303132 33343536 3738393a  \+,-\./0123456789:
 0040 3b3c3d3e 3f404142 43444546 4748494a  ;\<=\>\?@ABCDEFGHIJ
 0050 4b4c4d4e 4f505152 53545556 5758595a  KLMNOPQRSTUVWXYZ
 0060 5b5c5d5e 5f606162 63646566 6768696a  \[\\\]\^_\`abcdefghij
 0070 6b6c6d6e 6f707172 73747576 7778797a  klmnopqrstuvwxyz
 0080 7b7c7d7e 7f808182 83848586 8788898a  \{\|\}~\.\.\.������\.��
 0090 8b8c8d8e 8f909192 93949596 9798999a  ��\.�\.\.�������\.\.�
 00a0 9b9c9d9e 9fa0a1a2 a3a4a5a6 a7a8a9aa  ��\.�������������
 00b0 abacadae afb0b1b2 b3b4b5b6 b7b8b9ba  ����������������
 00c0 bbbcbdbe bfc0c1c2 c3c4c5c6 c7c8c9ca  ����������������
 00d0 cbcccdce cfd0d1d2 d3d4d5d6 d7d8d9da  ����������������
 00e0 dbdcddde dfe0e1e2 e3e4e5e6 e7e8e9ea  ����������������
 00f0 ebecedee eff0f1f2 f3f4f5f6 f7f8f9fa  ����������������
 0100 fbfcfdfe ff00                        �����\.          
