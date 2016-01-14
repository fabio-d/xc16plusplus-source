	.title cert0026 listing test
	.sbttl subtitle1 test
	.text
	goto main
	nopr
	.global foo
foo:	nopr
	.eject

	.ascii "Test of listing continuation lines.  This line should be really really really long so that gas is forced to use continuation lines.\n"

	.nolist
	
	.ascii "This ascii string should not appear in the list file\n"
	
	.list
	
	.sbttl subtitle2 test
	
	.ascii "Resume listing in list file."
	
	.eject
	
	.psize 20
	
main:	MOV #5, w5
	MOV #1, w6
	
	addc w5, w6, w7
	
	
	
	
