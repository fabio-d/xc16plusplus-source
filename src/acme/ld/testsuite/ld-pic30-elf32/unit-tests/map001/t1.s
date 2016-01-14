        ;;
        ;; map001
        ;;
        ;;  - test that VMA addresses of symbols in .const
        ;;     section are correct in the linker map file
        ;;
        .global LC0,LC1 
       	.section	.const,"r"
LC0:
	.ascii "0123456789\12\0"
	.data
	.align	2
_digits:
	.word	LC0
	.section	.const,"r"
LC1:
	.ascii "abcdefghijklmnopqrstuvwxyz\12\0"
	.data
	.align	2
_lower:
	.word	LC1
        
        ;; more constant & pointer declataions in t3.s, t4.s
        
      	.text
	.align	4
	.global	_main	; export
_main:
	lnk	#0

	mov	_digits,w0
	call	_print_string
	mov	_lower,w0
	call	_print_string
	mov	_upper,w0
	call	_print_string
	mov	_graph,w0
	call	_print_string
	mov	_xdigit,w0
	call	_print_string

.L2:

	ulnk
	return
    .space 0x4000
	.end
