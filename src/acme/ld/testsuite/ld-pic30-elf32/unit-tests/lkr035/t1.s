        ;;
        ;;  
        ;; 
        .text
        .global __reset
__reset:        
        .pword 1,2,3,4

        .bss
        .space 0x8

		.section .foo,"x"
		.pword 5,6,7,8

	    .data
        .space 0x8       
        
