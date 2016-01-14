		.global __reset
		.global START

		.text
__reset:	LNK #EXTDEC
                LNK #test
                LNK #STARTB
	
		.data
	        .align 2		
START:		.byte 0x00	
SPACR1:		.long 0x01
SPACR2:		.byte 0x02
SPACR3: 	.byte 0xA5
SPACR4: 	.byte 0xA6
SPACR5: 	.byte 0xA7
PS: 		.int 0x07+1
	        .align 2
END:		.byte 0x00

