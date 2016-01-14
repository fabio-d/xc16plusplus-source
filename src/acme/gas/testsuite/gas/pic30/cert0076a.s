
	.title cert0076 Reserve copies of bytes in text min/max
	.sbttl subtitle1 test

	.data


	.text

	.ascii	"Begin first fill"
	.fill	0, 1, 1
	.fill	1, 0, 1
	.fill	1, 1, 0

	.ascii	"Begin second fill with all zeros"	
	.fill	0, 0, 0

	.ascii "Begin third fill"
	.fill 	0x0F, 4, 0x12345678

	.ascii "Begin fourth fill"
	.fill 	0xFF, 9, 0xFFFFFFFF		
	
	.end
