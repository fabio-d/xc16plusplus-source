               .equ fifteen_b, 15
               .equ negfifteen_b, -15
               .equ sixteen_b, 16
               .equ negsixteen_b, -16
               .equ seventeen_b, 17
               .equ negseventeen_b, -17
               
               .global fifteen_b
               .global negfifteen_b
               .global sixteen_b
               .global negsixteen_b
               .global seventeen_b
               .global negseventeen_b

               .text
               nop
               SFTAC A, #0
               SFTAC A, #fifteen_a
               SFTAC A, #negfifteen_a
               SFTAC A, #sixteen_a
               SFTAC A, #negsixteen_a
               SFTAC A, #seventeen_a
               SFTAC A, #negseventeen_a          
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen_a
               SFTAC B, #negfifteen_a
               SFTAC B, #sixteen_a
               SFTAC B, #negsixteen_a
               SFTAC B, #seventeen_a
               SFTAC B, #negseventeen_a
               
               nop

               .section foo, "x"
               nop
               SFTAC A, #0
               SFTAC A, #fifteen_a
               SFTAC A, #negfifteen_a
               SFTAC A, #sixteen_a
               SFTAC A, #negsixteen_a
               SFTAC A, #seventeen_a
               SFTAC A, #negseventeen_a
            
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen_a
               SFTAC B, #negfifteen_a
               SFTAC B, #sixteen_a
               SFTAC B, #negsixteen_a
               SFTAC B, #seventeen_a
               SFTAC B, #negseventeen_a
                 
               nop
               .end

