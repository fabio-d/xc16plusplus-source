#as: -W
#objdump: -s -j foo
#name: .org in .section foo, "x" - .fillupper/.fillvalue Specified

# Test to ensure that the .org directive works properly in a
# .section foo, "x" section.

.*: .*

Contents of section foo:
 0000 121234 121234 121234 551234  ..4..4..4U.4
