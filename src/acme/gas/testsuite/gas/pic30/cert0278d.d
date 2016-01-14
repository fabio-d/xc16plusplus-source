#as: 
#name: .fillupper directive non-code-section warning
#source: cert0278d.s

# When in a non-code section, the .fillupper directive generates a warning,
# but the file assembles with the directive ignored.  This file tests
# that the assembler generates a warning.



.*\.s: Assembler messages:
.*\.s:.*: Warning: \.fillupper not specified in a code section\.  \.fillupper ignored\.
