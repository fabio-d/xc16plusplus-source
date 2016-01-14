        ;; misc12

        .section        .xbss,"b"
        .space 0x10                
        .section	.xdata,"d"
_digits: .ascii "0123456789\12\0"

        .section        .nbss,"b"
        .space 0x10                
	.section	.ndata,"d"
_lower: .ascii "abcdefghijklmnopqrstuvwxyz\12\0"

        .bss
        .space 0x10
	.data
_upper: .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ\12\0"

        .section .ybss,"b"
        .space 0x10
	.section .ydata,"d"
_graph: .ascii "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~\12\0"
        
	.section	.dconst,"d"
_xdigit: .ascii "abcdefABCDEF\12\0"
        
	.text
	.align	4
	.global	_main	; export
_main:
	lnk	#0

	mov	#_digits,w0
	call	_print_string
	mov	#_lower,w0
	call	_print_string
	mov	#_upper,w0
	call	_print_string
	mov	#_graph,w0
	call	_print_string
	mov	#_xdigit,w0
	call	_print_string
.L2:

	ulnk
	return

	.end
