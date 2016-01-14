/*
** Default Linker Script for dsPIC
*/
OUTPUT_FORMAT("coff-pic30")
OUTPUT_ARCH("pic30")
EXTERN(__reset)
ENTRY(__reset)
/*
** Memory Regions
*/
MEMORY
{
  program (rx) : ORIGIN = 0,        LENGTH = (128 * 1024 * 4)
  data  (!rx)  : ORIGIN = 0x800,    LENGTH = 63487
  psv          : ORIGIN = 0x8000,   LENGTH = 32K
  config       : ORIGIN = 0xF80000, LENGTH = (7 * 4)
  eedata       : ORIGIN = 0xFFE000, LENGTH = (4096 * 2)
}
/*
** Base Memory Addresses - Program Memory
*/
__RESET_BASE  = 0;        /* Reset Instruction                */
__IVT_BASE    = 0x08;     /* Interrupt Vector Table           */
__AIVT_BASE   = 0x108;    /* Alternate Interrupt Vector Table */
__CODE_BASE   = 0x200;    /* Handles, User Code, Library Code */
__CONFIG_BASE = 0xF80000; /* Configuration Fuse Registers     */
__EEDATA_BASE = 0xFFE000; /* Data Flash Memory                */
/*
** Base Memory Addresses - Data Memory
*/
__SFR_BASE    = 0;        /* Memory-mapped SFRs                 */
__DATA_BASE   = 0x800;    /* X and General Purpose Data Memory  */
__YDATA_BASE  = 0x3000;   /* Y Data Memory for DSP Instructions */
__RAM_LIMIT   = 0xFFFE;   /* Last Address in RAM                */
__DATA_WINDOW = 0x8000;   /* Mapped Access to Program Memory    */
/*
** dsPIC Core SFRs
*/
PROVIDE(WREG0     = 0x00);
PROVIDE(WREG1     = 0x02);
PROVIDE(WREG2     = 0x04);
PROVIDE(WREG3     = 0x06);
PROVIDE(WREG4     = 0x08);
PROVIDE(WREG5     = 0x0A);
PROVIDE(WREG6     = 0x0C);
PROVIDE(WREG7     = 0x0E);
PROVIDE(WREG8     = 0x10);
PROVIDE(WREG9     = 0x12);
PROVIDE(WREG10    = 0x14);
PROVIDE(WREG11    = 0x16);
PROVIDE(WREG12    = 0x18);
PROVIDE(WREG13    = 0x1A);
PROVIDE(WREG14    = 0x1C);
PROVIDE(WREG15    = 0x1E);
PROVIDE(_SPLIM    = 0x20);
PROVIDE(_ACCA     = 0x22);
PROVIDE(_ACCAL    = 0x22);
PROVIDE(_ACCAM    = 0x24);
PROVIDE(_ACCAH    = 0x26);
PROVIDE(_ACCB     = 0x28);
PROVIDE(_ACCBL    = 0x28);
PROVIDE(_ACCBM    = 0x2A);
PROVIDE(_ACCBH    = 0x2C);
PROVIDE(_PCL      = 0x2E);
PROVIDE(_PCH      = 0x30);
PROVIDE(_TBLPAG   = 0x32);
PROVIDE(_PSVPAG   = 0x34);
PROVIDE(_RCOUNT   = 0x36);
PROVIDE(_DCOUNT   = 0x38);
PROVIDE(_DOSTARTL = 0x3A);
PROVIDE(_DOSTARTH = 0x3C);
PROVIDE(_DOENDL   = 0x3E);
PROVIDE(_DOENDH   = 0x40);
PROVIDE(_SR       = 0x42);
PROVIDE(_CORCON   = 0x44);
PROVIDE(_MODCON   = 0x46);
PROVIDE(_XMODSRT  = 0x48);
PROVIDE(_XMODEND  = 0x4A);
PROVIDE(_YMODSRT  = 0x4C);
PROVIDE(_YMODEND  = 0x4E);
PROVIDE(_XBREV    = 0x50);
PROVIDE(_DISICNT  = 0x52);
/*
** dsPIC Extended SFRs
*/
PROVIDE(_WDTCON   = 0x0054);
PROVIDE(_INTCON2  = 0x0082);
PROVIDE(_U1STA    = 0x01B2);
PROVIDE(_TX1REG   = 0x01B4);
PROVIDE(_TMR3     = 0x010A);
PROVIDE(_TMR3H    = 0x010C);
/*
** Section Map
*/
SECTIONS
{
/*
================== Program Memory =====================
*/
/*
** Reset Instruction
*/
.reset __RESET_BASE :
  {
        SHORT(__reset / 2);
        SHORT(0x04);
        SHORT(__reset >> 17);
	SHORT(0);
  } > program
/*
** Interrupt Vector Table
*/
.ivt __IVT_BASE :
{
	LONG(DEFINED(__OscillatorFail) ? __OscillatorFail / 2 : 0);
	LONG(DEFINED(__StackError)     ? __StackError     / 2 : 0);
	LONG(DEFINED(__AddressError)   ? __AddressError   / 2 : 0);
	LONG(DEFINED(__MathWarning)    ? __MathWarning    / 2 : 0);
	LONG(DEFINED(__SoftwareTrap)   ? __SoftwareTrap   / 2 : 0);
	LONG(DEFINED(__SecurityTrap)   ? __SecurityTrap   / 2 : 0);
	LONG(DEFINED(__ReservedTrap1)  ? __ReservedTrap1  / 2 : 0);
	LONG(DEFINED(__ReservedTrap2)  ? __ReservedTrap2  / 2 : 0);
	LONG(DEFINED(__Interrupt0)  ? __Interrupt0  / 2 : 0);
	LONG(DEFINED(__Interrupt1)  ? __Interrupt1  / 2 : 0);
	LONG(DEFINED(__Interrupt2)  ? __Interrupt2  / 2 : 0);
	LONG(DEFINED(__Interrupt3)  ? __Interrupt3  / 2 : 0);
	LONG(DEFINED(__Interrupt4)  ? __Interrupt4  / 2 : 0);
	LONG(DEFINED(__Interrupt5)  ? __Interrupt5  / 2 : 0);
	LONG(DEFINED(__Interrupt6)  ? __Interrupt6  / 2 : 0);
	LONG(DEFINED(__Interrupt7)  ? __Interrupt7  / 2 : 0);
	LONG(DEFINED(__Interrupt8)  ? __Interrupt8  / 2 : 0);
	LONG(DEFINED(__Interrupt9)  ? __Interrupt9  / 2 : 0);
	LONG(DEFINED(__Interrupt10) ? __Interrupt10 / 2 : 0);
	LONG(DEFINED(__Interrupt11) ? __Interrupt11 / 2 : 0);
	LONG(DEFINED(__Interrupt12) ? __Interrupt12 / 2 : 0);
	LONG(DEFINED(__Interrupt13) ? __Interrupt13 / 2 : 0);
	LONG(DEFINED(__Interrupt14) ? __Interrupt14 / 2 : 0);
	LONG(DEFINED(__Interrupt15) ? __Interrupt15 / 2 : 0);
	LONG(DEFINED(__Interrupt16) ? __Interrupt16 / 2 : 0);
	LONG(DEFINED(__Interrupt17) ? __Interrupt17 / 2 : 0);
	LONG(DEFINED(__Interrupt18) ? __Interrupt18 / 2 : 0);
	LONG(DEFINED(__Interrupt19) ? __Interrupt19 / 2 : 0);
	LONG(DEFINED(__Interrupt20) ? __Interrupt20 / 2 : 0);
	LONG(DEFINED(__Interrupt21) ? __Interrupt21 / 2 : 0);
	LONG(DEFINED(__Interrupt22) ? __Interrupt22 / 2 : 0);
	LONG(DEFINED(__Interrupt23) ? __Interrupt23 / 2 : 0);
	LONG(DEFINED(__Interrupt24) ? __Interrupt24 / 2 : 0);
	LONG(DEFINED(__Interrupt25) ? __Interrupt25 / 2 : 0);
	LONG(DEFINED(__Interrupt26) ? __Interrupt26 / 2 : 0);
	LONG(DEFINED(__Interrupt27) ? __Interrupt27 / 2 : 0);
	LONG(DEFINED(__Interrupt28) ? __Interrupt28 / 2 : 0);
	LONG(DEFINED(__Interrupt29) ? __Interrupt29 / 2 : 0);
	LONG(DEFINED(__Interrupt30) ? __Interrupt30 / 2 : 0);
	LONG(DEFINED(__Interrupt31) ? __Interrupt31 / 2 : 0);
	LONG(DEFINED(__Interrupt32) ? __Interrupt32 / 2 : 0);
	LONG(DEFINED(__Interrupt33) ? __Interrupt33 / 2 : 0);
	LONG(DEFINED(__Interrupt34) ? __Interrupt34 / 2 : 0);
	LONG(DEFINED(__Interrupt35) ? __Interrupt35 / 2 : 0);
	LONG(DEFINED(__Interrupt36) ? __Interrupt36 / 2 : 0);
	LONG(DEFINED(__Interrupt37) ? __Interrupt37 / 2 : 0);
	LONG(DEFINED(__Interrupt38) ? __Interrupt38 / 2 : 0);
	LONG(DEFINED(__Interrupt39) ? __Interrupt39 / 2 : 0);
	LONG(DEFINED(__Interrupt40) ? __Interrupt40 / 2 : 0);
	LONG(DEFINED(__Interrupt41) ? __Interrupt41 / 2 : 0);
	LONG(DEFINED(__Interrupt42) ? __Interrupt42 / 2 : 0);
	LONG(DEFINED(__Interrupt43) ? __Interrupt43 / 2 : 0);
	LONG(DEFINED(__Interrupt44) ? __Interrupt44 / 2 : 0);
	LONG(DEFINED(__Interrupt45) ? __Interrupt45 / 2 : 0);
	LONG(DEFINED(__Interrupt46) ? __Interrupt46 / 2 : 0);
	LONG(DEFINED(__Interrupt47) ? __Interrupt47 / 2 : 0);
	LONG(DEFINED(__Interrupt48) ? __Interrupt48 / 2 : 0);
	LONG(DEFINED(__Interrupt49) ? __Interrupt49 / 2 : 0);
	LONG(DEFINED(__Interrupt50) ? __Interrupt50 / 2 : 0);
	LONG(DEFINED(__Interrupt51) ? __Interrupt51 / 2 : 0);
	LONG(DEFINED(__Interrupt52) ? __Interrupt52 / 2 : 0);
	LONG(DEFINED(__Interrupt53) ? __Interrupt53 / 2 : 0);
  } >program
/*
** Alternate Interrupt Vector Table
*/
.aivt __AIVT_BASE :
{
	LONG(DEFINED(__AltOscillatorFail) ? __AltOscillatorFail / 2 :
            (DEFINED(__OscillatorFail)    ? __OscillatorFail    / 2 : 0));
	LONG(DEFINED(__AltStackError)     ? __AltStackError     / 2 :
            (DEFINED(__StackError)        ? __StackError        / 2 : 0));
	LONG(DEFINED(__AltAddressError)   ? __AltAddressError   / 2 :
            (DEFINED(__AddressError)      ? __AddressError      / 2 : 0));
	LONG(DEFINED(__AltMathWarning)    ? __AltMathWarning    / 2 :
            (DEFINED(__MathWarning)       ? __MathWarning       / 2 : 0));
	LONG(DEFINED(__AltSoftwareTrap)   ? __AltSoftwareTrap   / 2 :
            (DEFINED(__SoftwareTrap)      ? __SoftwareTrap      / 2 : 0));
	LONG(DEFINED(__AltSecurityTrap)   ? __AltSecurityTrap   / 2 :
            (DEFINED(__SecurityTrap)      ? __SecurityTrap      / 2 : 0));
	LONG(DEFINED(__AltReservedTrap1)  ? __AltReservedTrap1  / 2 :
	    (DEFINED(__ReservedTrap1)     ? __ReservedTrap1     / 2 : 0));
	LONG(DEFINED(__AltReservedTrap2)  ? __AltReservedTrap2  / 2 :
	    (DEFINED(__ReservedTrap2)     ? __ReservedTrap2     / 2 : 0));
	LONG(DEFINED(__AltInterrupt0)  ? __AltInterrupt0  / 2 :
	    (DEFINED(__Interrupt0)     ? __Interrupt0     / 2 : 0));
	LONG(DEFINED(__AltInterrupt1)  ? __AltInterrupt1  / 2 :
	    (DEFINED(__Interrupt1)     ? __Interrupt1     / 2 : 0));
	LONG(DEFINED(__AltInterrupt2)  ? __AltInterrupt2  / 2 :
	    (DEFINED(__Interrupt2)     ? __Interrupt2     / 2 : 0));
	LONG(DEFINED(__AltInterrupt3)  ? __AltInterrupt3  / 2 :
	    (DEFINED(__Interrupt3)     ? __Interrupt3     / 2 : 0));
	LONG(DEFINED(__AltInterrupt4)  ? __AltInterrupt4  / 2 :
	    (DEFINED(__Interrupt4)     ? __Interrupt4     / 2 : 0));
	LONG(DEFINED(__AltInterrupt5)  ? __AltInterrupt5  / 2 :
	    (DEFINED(__Interrupt5)     ? __Interrupt5     / 2 : 0));
	LONG(DEFINED(__AltInterrupt6)  ? __AltInterrupt6  / 2 :
	    (DEFINED(__Interrupt6)     ? __Interrupt6     / 2 : 0));
	LONG(DEFINED(__AltInterrupt7)  ? __AltInterrupt7  / 2 :
	    (DEFINED(__Interrupt7)     ? __Interrupt7     / 2 : 0));
	LONG(DEFINED(__AltInterrupt8)  ? __AltInterrupt8  / 2 :
	    (DEFINED(__Interrupt8)     ? __Interrupt8     / 2 : 0));
	LONG(DEFINED(__AltInterrupt9)  ? __AltInterrupt9  / 2 :
	    (DEFINED(__Interrupt9)     ? __Interrupt9     / 2 : 0));
	LONG(DEFINED(__AltInterrupt10) ? __AltInterrupt10 / 2 :
	    (DEFINED(__Interrupt10)    ? __Interrupt10    / 2 : 0));
	LONG(DEFINED(__AltInterrupt11) ? __AltInterrupt11 / 2 :
	    (DEFINED(__Interrupt11)    ? __Interrupt11    / 2 : 0));
	LONG(DEFINED(__AltInterrupt12) ? __AltInterrupt12 / 2 :
	    (DEFINED(__Interrupt12)    ? __Interrupt12    / 2 : 0));
	LONG(DEFINED(__AltInterrupt13) ? __AltInterrupt13 / 2 :
	    (DEFINED(__Interrupt13)    ? __Interrupt13    / 2 : 0));
	LONG(DEFINED(__AltInterrupt14) ? __AltInterrupt14 / 2 :
	    (DEFINED(__Interrupt14)    ? __Interrupt14    / 2 : 0));
	LONG(DEFINED(__AltInterrupt15) ? __AltInterrupt15 / 2 :
	    (DEFINED(__Interrupt15)    ? __Interrupt15    / 2 : 0));
	LONG(DEFINED(__AltInterrupt16) ? __AltInterrupt16 / 2 :
	    (DEFINED(__Interrupt16)    ? __Interrupt16    / 2 : 0));
	LONG(DEFINED(__AltInterrupt17) ? __AltInterrupt17 / 2 :
	    (DEFINED(__Interrupt17)    ? __Interrupt17    / 2 : 0));
	LONG(DEFINED(__AltInterrupt18) ? __AltInterrupt18 / 2 :
	    (DEFINED(__Interrupt18)    ? __Interrupt18    / 2 : 0));
	LONG(DEFINED(__AltInterrupt19) ? __AltInterrupt19 / 2 :
	    (DEFINED(__Interrupt19)    ? __Interrupt19    / 2 : 0));
	LONG(DEFINED(__AltInterrupt20) ? __AltInterrupt20 / 2 :
	    (DEFINED(__Interrupt20)    ? __Interrupt20    / 2 : 0));
	LONG(DEFINED(__AltInterrupt21) ? __AltInterrupt21 / 2 :
	    (DEFINED(__Interrupt21)    ? __Interrupt21    / 2 : 0));
	LONG(DEFINED(__AltInterrupt22) ? __AltInterrupt22 / 2 :
	    (DEFINED(__Interrupt22)    ? __Interrupt22    / 2 : 0));
	LONG(DEFINED(__AltInterrupt23) ? __AltInterrupt23 / 2 :
	    (DEFINED(__Interrupt23)    ? __Interrupt23    / 2 : 0));
	LONG(DEFINED(__AltInterrupt24) ? __AltInterrupt24 / 2 :
	    (DEFINED(__Interrupt24)    ? __Interrupt24    / 2 : 0));
	LONG(DEFINED(__AltInterrupt25) ? __AltInterrupt25 / 2 :
	    (DEFINED(__Interrupt25)    ? __Interrupt25    / 2 : 0));
	LONG(DEFINED(__AltInterrupt26) ? __AltInterrupt26 / 2 :
	    (DEFINED(__Interrupt26)    ? __Interrupt26    / 2 : 0));
	LONG(DEFINED(__AltInterrupt27) ? __AltInterrupt27 / 2 :
	    (DEFINED(__Interrupt27)    ? __Interrupt27    / 2 : 0));
	LONG(DEFINED(__AltInterrupt28) ? __AltInterrupt28 / 2 :
	    (DEFINED(__Interrupt28)    ? __Interrupt28    / 2 : 0));
	LONG(DEFINED(__AltInterrupt29) ? __AltInterrupt29 / 2 :
	    (DEFINED(__Interrupt29)    ? __Interrupt29    / 2 : 0));
	LONG(DEFINED(__AltInterrupt30) ? __AltInterrupt30 / 2 :
	    (DEFINED(__Interrupt30)    ? __Interrupt30    / 2 : 0));
	LONG(DEFINED(__AltInterrupt31) ? __AltInterrupt31 / 2 :
	    (DEFINED(__Interrupt31)    ? __Interrupt31    / 2 : 0));
	LONG(DEFINED(__AltInterrupt32) ? __AltInterrupt32 / 2 :
	    (DEFINED(__Interrupt32)    ? __Interrupt32    / 2 : 0));
	LONG(DEFINED(__AltInterrupt33) ? __AltInterrupt33 / 2 :
	    (DEFINED(__Interrupt33)    ? __Interrupt33    / 2 : 0));
	LONG(DEFINED(__AltInterrupt34) ? __AltInterrupt34 / 2 :
	    (DEFINED(__Interrupt34)    ? __Interrupt34    / 2 : 0));
	LONG(DEFINED(__AltInterrupt35) ? __AltInterrupt35 / 2 :
	    (DEFINED(__Interrupt35)    ? __Interrupt35    / 2 : 0));
	LONG(DEFINED(__AltInterrupt36) ? __AltInterrupt36 / 2 :
	    (DEFINED(__Interrupt36)    ? __Interrupt36    / 2 : 0));
	LONG(DEFINED(__AltInterrupt37) ? __AltInterrupt37 / 2 :
	    (DEFINED(__Interrupt37)    ? __Interrupt37    / 2 : 0));
	LONG(DEFINED(__AltInterrupt38) ? __AltInterrupt38 / 2 :
	    (DEFINED(__Interrupt38)    ? __Interrupt38    / 2 : 0));
	LONG(DEFINED(__AltInterrupt39) ? __AltInterrupt39 / 2 :
	    (DEFINED(__Interrupt39)    ? __Interrupt39    / 2 : 0));
	LONG(DEFINED(__AltInterrupt40) ? __AltInterrupt40 / 2 :
	    (DEFINED(__Interrupt40)    ? __Interrupt40    / 2 : 0));
	LONG(DEFINED(__AltInterrupt41) ? __AltInterrupt41 / 2 :
	    (DEFINED(__Interrupt41)    ? __Interrupt41    / 2 : 0));
	LONG(DEFINED(__AltInterrupt42) ? __AltInterrupt42 / 2 :
	    (DEFINED(__Interrupt42)    ? __Interrupt42    / 2 : 0));
	LONG(DEFINED(__AltInterrupt43) ? __AltInterrupt43 / 2 :
	    (DEFINED(__Interrupt43)    ? __Interrupt43    / 2 : 0));
	LONG(DEFINED(__AltInterrupt44) ? __AltInterrupt44 / 2 :
	    (DEFINED(__Interrupt44)    ? __Interrupt44    / 2 : 0));
	LONG(DEFINED(__AltInterrupt45) ? __AltInterrupt45 / 2 :
	    (DEFINED(__Interrupt45)    ? __Interrupt45    / 2 : 0));
	LONG(DEFINED(__AltInterrupt46) ? __AltInterrupt46 / 2 :
	    (DEFINED(__Interrupt46)    ? __Interrupt46    / 2 : 0));
	LONG(DEFINED(__AltInterrupt47) ? __AltInterrupt47 / 2 :
	    (DEFINED(__Interrupt47)    ? __Interrupt47    / 2 : 0));
	LONG(DEFINED(__AltInterrupt48) ? __AltInterrupt48 / 2 :
	    (DEFINED(__Interrupt48)    ? __Interrupt48    / 2 : 0));
	LONG(DEFINED(__AltInterrupt49) ? __AltInterrupt49 / 2 :
	    (DEFINED(__Interrupt49)    ? __Interrupt49    / 2 : 0));
	LONG(DEFINED(__AltInterrupt50) ? __AltInterrupt50 / 2 :
	    (DEFINED(__Interrupt50)    ? __Interrupt50    / 2 : 0));
	LONG(DEFINED(__AltInterrupt51) ? __AltInterrupt51 / 2 :
	    (DEFINED(__Interrupt51)    ? __Interrupt51    / 2 : 0));
	LONG(DEFINED(__AltInterrupt52) ? __AltInterrupt52 / 2 :
	    (DEFINED(__Interrupt52)    ? __Interrupt52    / 2 : 0));
	LONG(DEFINED(__AltInterrupt53) ? __AltInterrupt53 / 2 :
	    (DEFINED(__Interrupt53)    ? __Interrupt53    / 2 : 0));
  } >program

/*
** User Code and Library Code
*/
.text ALIGN(4) : AT (0x10C)
  {
	*(.text);
	__etext = .;
  } >program
/*
** Configuration Fuses
*/
.config __CONFIG_BASE :
  {
        *(.config)
  } >config
/*
** Data Flash Memory
*/
.eedata __EEDATA_BASE :
  {
        *(.eedata)
  } >eedata
/*
==================== X Data Memory ===================
*/
/*
** X BSS
*/
.xbss __DATA_BASE (NOLOAD):
  {
        __xbss = .;
        *(.xbss);
        __exbss = .;
  } >data
/*
** X Initialized Data
*/
.xdata ALIGN(2) :
  AT ( ADDR (.text) + SIZEOF (.text))
  {
        __xdata = .;
        *(.xdata);
        __exdata = .;
  } >data
/*
=================== NEAR Data Memory ==================
*/
/*
** NEAR Common and Static Data
*/
.nbss ALIGN(2) :
  {
        __nbss = .;
        *(.nbss);
        __enbss = .;
  } > data
/*
** NEAR Initialized Data
*/
.ndata ALIGN(2) :
  AT ( LOADADDR (.xdata) + (SIZEOF (.xdata) * 2))
  {
        __ndata = .;
        *(.ndata);
        __endata = .;
  } > data
/*
** NEAR Constants in Data Memory
*/
.ndconst ALIGN(2) :
  AT ( LOADADDR (.ndata) + (SIZEOF (.ndata) * 2))
  {
        __ndconst = .;
        *(.ndconst);
        __endconst = .;
  } > data
/*
================ General Data Memory ==================
*/
/*
** Common and Static Data
*/
.bss ALIGN(2) :
  {
        __bss = .;
        *(.bss);
        *(COMMON);
        __ebss = .;
  } >data
/*
** Initialized Data
*/
.data ALIGN(2) :
  AT ( LOADADDR (.ndconst) + (SIZEOF (.ndconst) * 2))
  {
        __data = .;
        *(.data);
        __edata = .;
  } >data
/*
** Constants in Data Memory
*/
.dconst ALIGN(2) :
  AT ( LOADADDR (.data) + (SIZEOF (.data) * 2))
  {
        __dconst = .;
        *(.dconst);
        __edconst = .;
  } >data
/*
** Runtime heap
*/
.heap ALIGN(2) :
  {
        __heap = .;
        . += DEFINED(HEAPSIZE) ? HEAPSIZE : 0 ;
        __eheap = .;
  } >data
/*
==================== Y Data Memory ===================
*/
/*
** Y BSS
*/
.ybss MAX( __YDATA_BASE , ALIGN(2)) (NOLOAD):
  {
        __ybss = .;
        *(.ybss);
        __eybss = .;
  } >data
/*
** Y Initialized Data
*/
.ydata ALIGN(2) :
  AT ( LOADADDR (.dconst) + (SIZEOF (.dconst) * 2))
  {
        __ydata = .;
        *(.ydata);
        __eydata = .;
  } >data
/*
===================== PSV Window ====================
*/
/*
** Constants in Program Memory
*/
.const __DATA_WINDOW :
  AT ((LOADADDR (.ydata) + (SIZEOF (.ydata) * 2) + 0xFFFF) & ~ 0xFFFF)
  {
	__const = .;
	*(.const);
	__econst = .;
  } >psv
}
/*
** Symbols needed by the C runtime library
*/
__LMAxdata_offset      = (LOADADDR (.xdata) >> 1) & 0xFFFF;
__LMAxdata_tblpage     = LOADADDR (.xdata) >> 17;
__xdatalen             = __exdata - __xdata;
__LMAydata_offset      = (LOADADDR (.ydata) >> 1) & 0xFFFF;
__LMAydata_tblpage     = LOADADDR (.ydata) >> 17;
__ydatalen             = __eydata - __ydata;
__bsslen               = __ebss - __bss;
__nbsslen              = __enbss - __nbss;
__LMAndata_tbloffset   = (LOADADDR (.ndata) >> 1) & 0xFFFF;
__LMAndata_tblpage     = LOADADDR (.ndata) >> 17;
__ndatalen             = __endata - __ndata;
__LMAdata_tbloffset    = (LOADADDR (.data) >> 1) & 0xFFFF;
__LMAdata_tblpage      = LOADADDR (.data) >> 17;
__datalen              = __edata - __data;
__LMAconst_psvoffset   = ((LOADADDR (.const) >> 1) | 0x8000) & 0xFFFF;
__LMAconst_psvpage     = LOADADDR (.const) >> 16;
__constlen             = __econst - __const;
__LMAdconst_tbloffset  = (LOADADDR (.dconst) >> 1) & 0xFFFF;
__LMAdconst_tblpage    = LOADADDR (.dconst) >> 17;
__dconstlen            = __edconst - __dconst;
__LMAndconst_tbloffset = (LOADADDR (.ndconst) >> 1) & 0xFFFF;
__LMAndconst_tblpage   = LOADADDR (.ndconst) >> 17;
__ndconstlen           = __endconst - __ndconst;
/*
** Stack Pointer Initialization
**
** Note: applications can reference these symbols
**  to initialize the stack (W15) and SPLIM register.
*/
__SP_init     = __eydata;
__SPLIM_init  = SIZEOF (.const) ?
  (MIN (0x7FFE , __RAM_LIMIT)) : __RAM_LIMIT ;
/*
** XData Range Check
*/
__XX          = !((__YDATA_BASE - __exdata) & 0x80000000);
__RANGE_CHECK = ASSERT( (__XX), "Error: Section .xdata has overflowed into Y space!");
/*
** YData Range Check
*/
__YY          = !((__RAM_LIMIT - __eydata) & 0x80000000);
__RANGE_CHECK = ASSERT( (__YY), "Error: Section .ydata has overflowed Y space!");
/*
** Stack Range Check
**
** Note: Define symbol STACKSIZE to specify minimum
**  stack (default = 16 bytes).
*/
__STACK_AVAIL = (__SPLIM_init - __SP_init);
__STACK_MIN   = (DEFINED(STACKSIZE) ? STACKSIZE : 0x10);
__ZZ          = !((__STACK_AVAIL - __STACK_MIN) & 0x80000000);
__STACK_CHECK = ASSERT( (__ZZ), "Error: Not enough memory for stack!");
