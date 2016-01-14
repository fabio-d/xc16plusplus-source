#ld: --target-help --defsym __reset=0
#objects: mchpVersion.out
#name: Microchip Target-specific Help Screen

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
  --stack SIZE         Set minimum stack to SIZE bytes \(default=24\)
  --stackguard SIZE    Set stack guardband to SIZE bytes \(default=16\)
