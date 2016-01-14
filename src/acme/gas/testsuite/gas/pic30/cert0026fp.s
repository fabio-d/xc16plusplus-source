	.title cert0026fp listing test
	.sbttl subtitle1 test
	
; test that length is correctly reported by -ai option.

	.text
	.fillvalue 0xcd
	.fillupper 0xab
	.fill 0x2AAAAA, 4, 0x78563412
	.fill 0x01


        .data
        .fill 0x1234, 4, 0xefcdab01
        
        .bss
        .fill 0x1b97, 4, 0x78563412
        
        .section pbss,persist
        .fill 0x1234, 4, 0xefcdab01
        
        .data
        .fill 0x04, 1, 0x55
        
        .end
