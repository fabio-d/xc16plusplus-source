/*
** macro definition for setting config words
*/
#define config(REG, VALUE) \
  __asm__ (".section  " #REG ",\"x\""); \
  __asm__ (".pword    " #VALUE); \

/*
** bit field equates
*/
#define FE 0x120000
#define FI 0x003400
#define FO 0x000056

/*
** set config word using inline assembly code
*/
__asm__ (".section __FOSC,\"x\"");
__asm__ (".pword   0x123456");

/*
** set config words using a macro
*/
config(__FWDT, 0x123456);
config(__UID1, FE | FI | FO);

int
main(void)
{
}
