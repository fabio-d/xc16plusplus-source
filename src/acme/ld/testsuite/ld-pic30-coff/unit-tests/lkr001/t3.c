/*
** bit equates
*/
#define FOO 0x1200
#define BAR 0x0034
#define UID 0xFF55

/*
** declare the __FOSC config bits
*/
const unsigned int __attribute__((__section__("__FOSC"), __space__(__prog__)))
     __FOSC = 0x1234;

/*
** declare the __FWDT config bits
*/
const unsigned int __attribute__((__section__("__FSS"), __space__(__prog__)))
     __FWDT = FOO | BAR ;

/*
** declare the __UID1 bits
**
** note: only the LS 16 bits are accessible
*/
const unsigned int __attribute__((__section__("__UID1"), __space__(__prog__)))
     __UID1 = UID;





