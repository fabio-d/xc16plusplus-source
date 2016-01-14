#as:
#objdump: -h -s
#name: Assemble data into Section using default no load .section directive


.*\.o:     file format coff-pic30

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 \.text         00000016  00000000  00000000  00000170  2\*\*1
                  CONTENTS, ALLOC, LOAD, RELOC, CODE
  1 \.data         00000004  00000000  00000000  0000019c  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  2 \.bss          00000000  00000000  00000000  00000000  2\*\*1
                  ALLOC
  3 data1         00000004  00000000  00000000  000001a4  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  4 testw         00000008  00000000  00000000  000001ac  2\*\*1
                  CONTENTS, ALLOC, LOAD, DATA
  5 bsstest       00000004  00000000  00000000  00000000  2\*\*1
                  ALLOC
  6 testn         0000000e  00000000  00000000  000001bc  2\*\*1
                  CONTENTS, ALLOC, DATA, NEVER_LOAD
  7 testx         00000024  00000000  00000000  000001d8  2\*\*1
                  CONTENTS, ALLOC, LOAD, CODE
Contents of section \.text:
 0000 550020 160020 86834a 06acb8  U\. \.\. ..J\...
 0008 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0010 86834a 000004 000000         ..J\.\.\.\.\.\.   
Contents of section \.data:
 0000 00000010                             \.\.\.\.            
Contents of section data1:
 0000 00100000                             \.\.\.\.            
Contents of section testw:
 0000 00000020 00200000                    \.\.\. \. \.\.        
Contents of section testn:
 0000 78563412 cdab0000 341201ef cdab      xV4\...\.\.4\.\....  
Contents of section testx:
 0000 160020 86834a 160020 06acb8  \.\. ..J\.\. \...
 0008 160020 86834a 06acb8 010478  \.\. ..J\..¸\.\..
 0010 f5a92f 160020 86834a 06acb8  ../\.\. ..J\...
 0018 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0020 86834a 06acb8                ..J\...      
