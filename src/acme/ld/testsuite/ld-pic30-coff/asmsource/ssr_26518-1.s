               .section scnpsv,psv
               .asciz "scnpsv section"

               .section .const,psv
	     .asciz ".const psv section"

               .text

               .global __reset
__reset:       bra __reset

               .end

