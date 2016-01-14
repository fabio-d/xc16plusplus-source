#source: utc241.s
#objdump: -t
#name: Include file annotation

# Test to ensure that include files are annotated

.*: .*

SYMBOL TABLE:
00000000 l    df \*ABS\*\t00000000 .*/utc241.inc
00000000 l    df \*ABS\*\t00000000 .*/utc241.s
00000001 l       \*ABS\*\t00000000 __C30ELF
00000000 l    d  .text\t00000000 
00000000 l    d  .data\t00000000 
00000000 l    d  .bss\t00000000 
00000001 l       \*ABS\*\t00000000 CONST

