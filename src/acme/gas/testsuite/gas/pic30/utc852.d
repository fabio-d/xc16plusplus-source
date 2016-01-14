#objdump: -r
#name: BFD_RELOC_PIC30_PSVOFFSET, psvoffset(extern) in .text

# This test ensures that the assembler creates a relocation when
# taking the psvoffset of an external symbol in an allocation directive
# in the .text section.
#
# Note that the reported relocation address is even, even though the
# linker will insert the relocation at an odd address. This is a special
# case in which octets, not address units, are stored in the COFF file.
# For more information, see linker unit test misc14: Non-aligned relocations
# 

.*: .*

RELOCATION RECORDS FOR \[\.text\]\:
OFFSET   TYPE              VALUE 
00000002 PSVOFFSET         externfoo


