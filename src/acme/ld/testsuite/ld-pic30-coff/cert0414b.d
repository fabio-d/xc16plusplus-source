#ld: 
#objects: /ld-pic30-coff/cert0414a.out /ld-pic30-coff/cert0414b.out
#objdump: -s -j .data
#name: PSVOFFSET Relocation in .data

#
# This test verifies the DOFFSET relocation in .data space.
# Bit 15 is always 1.  8102 prog counter == 204 loc counter
# Disregard bit 15 and double the remaining hex number.
#

.*cert0414b.o:     file format .*pic30.*

Contents of section \.data:
 0800 18812881 ff001881 2881               \.\.\(\.ÿ\.\.\.\(\.      
