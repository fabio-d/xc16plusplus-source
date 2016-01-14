	.title cert0026fo listing test
	.sbttl subtitle1 test
	
; test that length is correctly reported by -ai option.

	.text
	.fillvalue 0xcd
	.fillupper 0xab
	.fill 0xf, 4, 0x78563412


        .data
        .fill 0xf, 4, 0xefcdab01
        
        .bss
        .fill 0x8, 4, 0x78563412
        
        .section pbss,persist
        .fill 0x6, 4, 0xefcdab01
        
        .end
