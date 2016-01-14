	.text
	LNK #START
	
test:	.byte 0xA5	
	
	.data
START:	.byte 0x00	
SPACR1:	.long 0x01
SPACR2:	.byte 0x02
SPACR3: .byte 0xA5
SPACR4: .byte 0xA6
SPACR5: .byte 0xA7
PS: 	.int 0x07+1
END:	.byte 0x00

