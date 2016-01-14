#ld: --help --defsym __reset=0
#objects: mchpVersion.out
#name: Microchip Help Screen

Usage: .+pic30-coff-ld\.exe \[options\] file\.\.\.
Options:
  -a KEYWORD                  Shared library control for HP/UX compatibility
  -A ARCH, --architecture ARCH
                              Set architecture
  -b TARGET, --format TARGET  Specify target for following input files
  -c FILE, --mri-script FILE  Read MRI format linker script
  -d, -dc, -dp                Force common symbols to be defined
  -e ADDRESS, --entry ADDRESS Set start address
  -E, --export-dynamic        Export all dynamic symbols
  -EB                         Link big-endian objects
  -EL                         Link little-endian objects
  -f SHLIB, --auxiliary SHLIB Auxiliary filter for shared object symbol table
  -F SHLIB, --filter SHLIB    Filter for shared object symbol table
  -g                          Ignored
  -G SIZE, --gpsize SIZE      Small data size \(if no size, same as --shared\)
  -h FILENAME, -soname FILENAME
                              Set internal name of shared library
  -I PROGRAM, --dynamic-linker PROGRAM
                              Set PROGRAM as the dynamic linker to use
  -l LIBNAME, --library LIBNAME
                              Search for library LIBNAME
  -L DIRECTORY, --library-path DIRECTORY
                              Add DIRECTORY to library search path
  -m EMULATION                Set emulation
  -M, --print-map             Print map file on standard output
  -n, --nmagic                Do not page align data
  -N, --omagic                Do not page align data, do not make text readonly
  --no-omagic                 Page align data, make text readonly
  -o FILE, --output FILE      Set output file name
  -Qy                         Ignored for SVR4 compatibility
  -q, --emit-relocs           Generate relocations in final output
  -r, -i, --relocateable      Generate relocateable output
  -R FILE, --just-symbols FILE
                              Just link symbols \(if directory, same as --rpath\)
  -s, --strip-all             Strip all symbols
  -S, --strip-debug           Strip debugging symbols
  --strip-discarded           Strip symbols in discarded sections
  --no-strip-discarded        Do not strip symbols in discarded sections
  -t, --trace                 Trace file opens
  -T FILE, --script FILE      Read linker script
  -u SYMBOL, --undefined SYMBOL
                              Start with undefined reference to SYMBOL
  --unique \[=SECTION\]         Don't merge input \[SECTION | orphan\] sections
  -Ur                         Build global constructor/destructor tables
  -v, --version               Print version information
  -V                          Print version and emulation information
  -x, --discard-all           Discard all local symbols
  -X, --discard-locals        Discard temporary local symbols \(default\)
  --discard-none              Don't discard any local symbols
  -y SYMBOL, --trace-symbol SYMBOL
                              Trace mentions of SYMBOL
  -Y PATH                     Default search path for Solaris compatibility
  -\(, --start-group           Start a group
  -\), --end-group             End a group
  --accept-unknown-input-arch Accept input files whose architecture cannot be determined
  --no-accept-unknown-input-arch
                              Reject input files whose architecture is unknown
  -assert KEYWORD             Ignored for SunOS compatibility
  -Bdynamic, -dy, -call_shared
                              Link against shared libraries
  -Bstatic, -dn, -non_shared, -static
                              Do not link against shared libraries
  -Bsymbolic                  Bind global references locally
  --check-sections            Check section addresses for overlaps \(default\)
  --no-check-sections         Do not check section addresses for overlaps
  --cref                      Output cross reference table
  --defsym SYMBOL=EXPRESSION  Define a symbol
  --demangle \[=STYLE\]         Demangle symbol names \[using STYLE\]
  --embedded-relocs           Generate embedded relocs
  -fini SYMBOL                Call SYMBOL at unload-time
  --force-exe-suffix          Force generation of file with \.exe suffix
  --gc-sections               Remove unused sections \(on some targets\)
  --no-gc-sections            Don't remove unused sections \(default\)
  --help                      Print option help
  -init SYMBOL                Call SYMBOL at load-time
  -Map FILE                   Write a map file
  --no-define-common          Do not define Common storage
  --no-demangle               Do not demangle symbol names
  --no-keep-memory            Use less memory and more disk I/O
  --no-undefined              Allow no undefined symbols
  --allow-shlib-undefined     Allow undefined symbols in shared objects \(the default\)
  --no-allow-shlib-undefined  Do not allow undefined symbols in shared objects
  --allow-multiple-definition Allow multiple definitions
  --no-undefined-version      Disallow undefined version
  --no-warn-mismatch          Don't warn about mismatched input files
  --no-whole-archive          Turn off --whole-archive
  --noinhibit-exec            Create an output file even if errors occur
  -nostdlib                   Only use library directories specified on
				the command line
  --oformat TARGET            Specify target of output file
  -qmagic                     Ignored for Linux compatibility
  --relax                     Relax branches on certain targets
  --retain-symbols-file FILE  Keep only symbols listed in FILE
  -rpath PATH                 Set runtime shared library search path
  -rpath-link PATH            Set link time shared library search path
  -shared, -Bshareable        Create a shared library
  --stats                     Print memory usage statistics
  --target-help               Display target specific options
  --task-link SYMBOL          Do task level linking
  --traditional-format        Use same format as native linker
  --section-start SECTION=ADDRESS
                              Set address of named section
  -Tbss ADDRESS               Set address of \.bss section
  -Tdata ADDRESS              Set address of \.data section
  -Ttext ADDRESS              Set address of \.text section
  --verbose                   Output lots of information during link
  --version-script FILE       Read version information script
  --version-exports-section SYMBOL
                              Take export symbols list from \.exports, using
				SYMBOL as the version\.
  --warn-common               Warn about duplicate common symbols
  --warn-constructors         Warn if global constructors/destructors are seen
  --warn-multiple-gp          Warn if the multiple GP values are used
  --warn-once                 Warn only once per undefined symbol
  --warn-section-align        Warn if start of section changes due to alignment
  --fatal-warnings            Treat warnings as errors
  --whole-archive             Include all objects from following archives
  --wrap SYMBOL               Use wrapper functions for SYMBOL
  --mpc860c0 \[=WORDS\]         Modify problematic branches in last WORDS \(1-10,
				default 5\) words of a page
.*pic30-coff-ld\.exe: supported targets: coff-pic30
.*pic30-coff-ld\.exe: supported emulations: pic30_coff
.*pic30-coff-ld\.exe: emulation specific options:
pic30_coff: 
  --boot LIST          Specify options for boot segment
  --data-init          Initialize data memory \(default\)
  --no-data-init       Don't initialize data memory
  -D,--debug           Produce linker debugging messages
  --handles            Create jump table for function pointers \(default\)
  --no-handles         Don't create jump table for function pointers
  --fill-upper VALUE   Set fill value for upper byte of data \(default = 0\)
  --force-link         Force linking of objects that may not be compatible
  --no-force-link      Don't force linking \(default\)
  --general LIST       Specify options for general segment
  --heap SIZE          Create heap of SIZE bytes
  --isr                Create interrupt function for unused vectors \(default\)
  --no-isr             Don't create interrupt function for unused vectors
  -p,--processor PROC  Specify the target processor \(e\.g\., 30F2010\)
  --pack-data          Use upper byte of program memory to store data \(default\)
  --no-pack-data       Don't use upper byte of program memory to store data
  --report-mem         Report memory usage to console
  --secure LIST        Specify options for secure segment
  --smart-io           Merge I/O library functions \(default\)
  --no-smart-io        Don't merge I/O library functions
  --stack SIZE         Set minimum stack to SIZE bytes \(default=16\)

Report bugs to bug-binutils@gnu\.org
Microchip Language Tool Shell Version v.* \(Build date: .+\)\.
Copyright \(c\) .... Microchip Technology Inc\. All rights reserved

  -omf={coff|elf}	Select coff or elf object module format
