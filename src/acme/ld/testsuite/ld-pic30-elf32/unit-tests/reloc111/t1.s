
        .section reserved1,bss,address(0x2000)
        .space  0x2222
        
        .section reserved2,bss,address(0x4224)
        .space   0x2220

        ;; address of b1 = 0xaa
      	.global	b1	; export
	.section	.buf1,data
b1:
	.byte 0xbb

        ;; address of b2 = 0x4222
        ;; dmaoffset(b2) = 0x2222
	.global	b2	; export
	.section	.buf2,dma
b2:
	.word	0x2211

        ;; address of b3 = 0x6444
        ;; dmaoffset(b3) = 0x4444
	.global	b3	; export
	.section	.buf3,bss,dma
b3:
        .space 4

        .text
        .global _main
_main:
        .pword 0x111111
	.end
