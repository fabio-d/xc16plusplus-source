#as: --no-warn
#objdump: -s
#name: .fillvalue directive, persistent across code sections
#source: cert0281a.s

dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 fefe00 fefe00 fefe00 fefe00  \.\.\.\.\.\.\.\.\.\.\.\.
 0008 fefe00 fefe00 fefe00 fefe00  \.\.\.\.\.\.\.\.\.\.\.\.
Contents of section myscn1:
 0000 fefe00                       ..\.         
Contents of section myscn2:
 0000 fefe00 fefe00                \.\.\.\.\.\.      
