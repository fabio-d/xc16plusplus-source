	.title cert0026ac listing test
	.sbttl subtitle1 test
	.text
	goto main
	nopr
	.global foo
foo:	nopr
	.eject

	.ascii "Test of listing continuation lines.  This line should be really really really long so that gas is forced to use continuation lines.\n"
	.psize 25
	.nolist
	
	.ascii "This ascii string should not appear in the list file\n"
	
	.list
	
	.sbttl subtitle2 test
	
	.ascii "Resume listing in list file."
	
	.eject
	.sbttl subtitle3 test main routine
	.psize 20
	
main:	MOV #5, w5
	MOV #1, w6
	
	addc w5, w6, w7
	
	MUL.US	w5, w6, w8
	
	
	
	
	
