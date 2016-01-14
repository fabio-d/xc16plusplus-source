Usage: /home/kajitaj/GNU/acme/gas/as-new \[option\.\.\.\] \[asmfile\.\.\.\]
Options:
  -a\[sub-option\.\.\.\]	  turn on listings
                      	  Sub-options \[default hls\]:
                      	  c      omit false conditionals
                      	  d      omit debugging directives
                      	  h      include high-level source
                      	  l      include assembly
                      	  m      include macro expansions
                      	  n      omit forms processing
                      	  s      include symbols
                      	  L      include line debug statistics \(if applicable\)
                      	  =FILE  list to FILE \(must be last sub-option\)
  -D                      produce assembler debugging messages
  --defsym SYM=VAL        define symbol SYM to given value
  -f                      skip whitespace and comment preprocessing
  --gstabs                generate stabs debugging information
  --gdwarf2               generate DWARF2 debugging information
  --help                  show this message and exit
  --target-help           show target specific options
  -I DIR                  add DIR to search list for \.include directives
  -J                      don't warn about signed overflow
  -K                      warn when differences altered for long displacements
  -L,--keep-locals        keep local symbols \(e\.g\. starting with `L'\)
  -M,--mri                assemble in MRI compatibility mode
  --MD FILE               write dependency information in FILE \(default none\)
  -nocpp                  ignored
  -o OBJFILE              name the object-file output OBJFILE \(default a\.out\)
  -R                      fold data section into text section
  --statistics            print various measured statistics from execution
  --strip-local-absolute  strip local absolute symbols
  --traditional-format    Use same format as native assembler when possible
  --version               print assembler version number and exit
  -W  --no-warn           suppress warnings
  --warn                  don't suppress warnings
  --fatal-warnings        treat warnings as errors
  --itbl INSTTBL          extend instruction set to include instructions
                          matching the specifications defined in file INSTTBL
  -w                      ignored
  -X                      ignored
  -Z                      generate object file even after errors
  --listing-lhs-width     set the width in words of the output data column of
                          the listing
  --listing-lhs-width2    set the width in words of the continuation lines
                          of the output data column; ignored if smaller than
                          the width of the first line
  --listing-rhs-width     set the max width in characters of the lines from
                          the source file
  --listing-cont-lines    set the maximum number of continuation lines used
                          for the output data column of the listing

Microchip PIC30 options:
  --no-relax              Turn off relaxation \(default\)\.
  --relax                 Perform relaxation\.

Report bugs to bug-binutils@gnu\.org
