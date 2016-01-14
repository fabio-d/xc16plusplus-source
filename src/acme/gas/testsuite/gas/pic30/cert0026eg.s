	.title cert0026eg listing test
	.sbttl subtitle1 test
	
	
/* Begin macro SUM definition	*/
	.macro 	sum from=0, to=5
	.long	\from
	.if	\to-\from
	sum	"(\from+1)",\to
	.endif
	.endm
/* End macro SUM definition */
	
	
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
	
	
	/* False conditional next */
	.if 0
	.ascii "This ascii string is within a false conditional"
	.endif
	/* End False conditional */
	
	.sbttl subtitle2 test
	
	.ascii "Resume listing in list file."
	
/* Begin SUM macro expansion */
	
/* First SUM macro expansion goes next. [1,5] */	
	.align 2
	
	SUM	1, 5
	
/* Second SUM macro expansion goes next. [1,2] */	

	SUM	1, 2
	
/* Third SUM macro expansion goes next. [1,4] */		
	
	SUM	1, 4
	
/* End of macro expansions */	
	
	.eject
	.sbttl subtitle3 test main routine
	.psize 20
	
main:	MOV #5, w5
	MOV #1, w6
	
	addc w5, w6, w7
	
	MUL.US	w5, w6, w8
	
	
	
	
	
