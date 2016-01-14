               .equ fifteen_a, 15
               .equ negfifteen_a, -15
               .equ sixteen_a, 16
               .equ negsixteen_a, -16
               .equ seventeen_a, 17
               .equ negseventeen_a, -17
               
               .global fifteen_a
               .global negfifteen_a
               .global sixteen_a
               .global negsixteen_a
               .global seventeen_a
               .global negseventeen_a

               .text
               .global _main, __reset
               
_main:               
__reset:       nop
               SFTAC A, #0
               SFTAC A, #fifteen_b
               SFTAC A, #negfifteen_b
               SFTAC A, #sixteen_b
               SFTAC A, #negsixteen_b
               SFTAC A, #seventeen_b
               SFTAC A, #negseventeen_b           
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen_b
               SFTAC B, #negfifteen_b
               SFTAC B, #sixteen_b
               SFTAC B, #negsixteen_b
               SFTAC B, #seventeen_b
               SFTAC B, #negseventeen_b                 
               nop

               .section foo, "x"
               nop
               SFTAC A, #0
               SFTAC A, #fifteen_b
               SFTAC A, #negfifteen_b
               SFTAC A, #sixteen_b
               SFTAC A, #negsixteen_b
               SFTAC A, #seventeen_b
               SFTAC A, #negseventeen_b
         
               nop
               nop
               SFTAC B, #0               
               SFTAC B, #fifteen_b
               SFTAC B, #negfifteen_b
               SFTAC B, #sixteen_b
               SFTAC B, #negsixteen_b
               SFTAC B, #seventeen_b
               SFTAC B, #negseventeen_b                 
               nop
               .end

