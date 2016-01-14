               .equ fifteen, 15
               .equ negfifteen, -15
               .equ sixteen, 16
               .equ negsixteen, -16
               .equ seventeen, 17
               .equ negseventeen, -17

               .text
               nop
               SFTAC A, #0
               SFTAC A, #fifteen
               SFTAC A, #negfifteen
               SFTAC A, #15
               SFTAC A, #-15
               SFTAC A, #sixteen
               SFTAC A, #negsixteen
               SFTAC A, #16
               SFTAC A, #-16
               SFTAC A, #seventeen
               SFTAC A, #negseventeen
               SFTAC A, #17
               SFTAC A, #-17               
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen
               SFTAC B, #negfifteen
               SFTAC B, #15
               SFTAC B, #-15
               SFTAC B, #sixteen
               SFTAC B, #negsixteen
               SFTAC B, #16
               SFTAC B, #-16
               SFTAC B, #seventeen
               SFTAC B, #negseventeen
               SFTAC B, #17
               SFTAC B, #-17                    
               nop

               .section foo, code
               nop
               SFTAC A, #0
               SFTAC A, #fifteen
               SFTAC A, #negfifteen
               SFTAC A, #15
               SFTAC A, #-15
               SFTAC A, #sixteen
               SFTAC A, #negsixteen
               SFTAC A, #16
               SFTAC A, #-16
               SFTAC A, #seventeen
               SFTAC A, #negseventeen
               SFTAC A, #17
               SFTAC A, #-17               
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen
               SFTAC B, #negfifteen
               SFTAC B, #15
               SFTAC B, #-15
               SFTAC B, #sixteen
               SFTAC B, #negsixteen
               SFTAC B, #16
               SFTAC B, #-16
               SFTAC B, #seventeen
               SFTAC B, #negseventeen
               SFTAC B, #17
               SFTAC B, #-17                    
               nop
               .end

