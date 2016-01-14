#as: --no-warn
#objdump: -s
#name: .fill Reserve copies of bytes in text
#source: cert0075a.s


dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 426501 676901 6e2001 666901  Be\.gi\.n \.fi\.
 0008 727301 742001 666901 6c6c01  rs\.t \.fi\.ll\.
 0010 ffff01 ffff01 ffff01 ffff01  ..\...\...\...\.
 0018 ffff01 ffff01 ffff01 ffff01  ..\...\...\...\.
 0020 ffff01 ffff01 ffff01 ffff01  ..\...\...\...\.
 0028 ffff01 ffff01 ffff01 550020  ..\...\...\.U\. 
 0030 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0038 86834a 06acb8 160020 86834a  ..J\...\.\. ..J
 0040 06acb8 160020 86834a 06acb8  \...\.\. ..J\...
 0048 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0050 86834a 06acb8 160020 86834a  ..J\...\.\. ..J
 0058 06acb8 160020 86834a 06acb8  \...\.\. ..J\...
 0060 160020 86834a 06acb8 000004  \.\. ..J\...\.\.\.
 0068 000000                       \.\.\.         
