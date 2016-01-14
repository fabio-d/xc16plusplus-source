#ld:
#name: paddr() in a section with "r" attribute and a .const section
#objects: /ld-pic30-coff/cert0710a.out /ld-pic30-coff/cert0710b.out
#objdump: -D -r

SSR_22140

.org directive beginning on odd data address causes a FATAL bad value

The following source code

           .data
           .long 0
           .long 1
           .byte 0xff
           .org . \+ 0x2
test:      .byte 0xa6
           .byte 0xa7
           .end

assembled with
pic30-as test.s

Causes the following error
test.s: Assembler messages:
test.s:5: Error: attempt to .org/.space backwards? \(-5\)
a.out: Bad value
test.s:8: FATAL: Can't write a.out: Bad value

I expected the file to assemble without an error.
