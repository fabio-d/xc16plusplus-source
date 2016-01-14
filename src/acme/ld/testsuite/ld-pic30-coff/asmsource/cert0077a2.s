		.text
		nopr	
		nopr
		
		.data
		.org 0x100
ext:		.byte 	0x5A
		.byte	0x00
temp2:		.byte 	0xFF

		.global temp2
		.global ext	
		.end

