#objdump: -r
#name: BFD_RELOC_PIC30_FRAME_SIZE, External Relocation

# Test to ensure that the assembler will create a relocation for a LNK
# instruction that references a variable that is declared externally
# to the assembly source file.

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000000 FRAME SIZE        EXTDEC


