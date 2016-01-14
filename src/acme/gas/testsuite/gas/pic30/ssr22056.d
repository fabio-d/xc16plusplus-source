#as: 
#objdump: -s
#name: SSR 22056 -- "\a" treated as 'a' rather than bell character


dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 070000 076100 006100         \.\.\.\.a\.\.a\.   
Contents of section \.data:
 0000 07000761 0061                        \.\.\.a\.a          
