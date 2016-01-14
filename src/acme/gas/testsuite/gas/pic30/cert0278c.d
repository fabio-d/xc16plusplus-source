#as: --no-warn
#objdump: -s
#name: .fillupper directive not in code section (objdump)
#source: cert0278c.s

# When in a non-code section, the .fillupper directive generates a warning,
# but the file assembles with the directive ignored.  This file tests
# that the file assembles as if there was no .fillupper directive.


dump\.o:     file format coff-pic30

Contents of section \.text:
 0000 550020 160020 86834a 06acb8  U\. \.\. ..J\...
 0008 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0010 86834a 06acb8 160020 86834a  ..J\...\.\. ..J
 0018 06acb8 160020 86834a 06acb8  \...\.\. ..J\...
 0020 160020 86834a 06acb8 160020  \.\. ..J\...\.\. 
 0028 86834a 06acb8 160020 86834a  ..J\...\.\. ..J
 0030 06acb8 160020 86834a 06acb8  \...\.\. ..J\...
 0038 000004 000000 ffff00 ffff00  \.\.\.\.\.\...\...\.
 0040 ffff00 ffff00 ffff00 ffff00  ..\...\...\...\.
 0048 ffff00 ffff00 ffff00 ffff00  ..\...\...\...\.
 0050 ffff00 ffff00 ffff00 ffff00  ..\...\...\...\.
 0058 ffff00                       ..\.         
