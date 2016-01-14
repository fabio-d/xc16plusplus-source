#define __dsPIC30F6014__
#include <p30f6014.h>
#include <stdio.h>

int bss[2100];
char _YDATA(32) dat[] = "abcdefghijklmnopqrstuvwxyz";

#if ICD2RAM
extern int  __attribute__((alias("dat"))) _ICD2RAM ;
#endif

int main()
{ printf("a-z: "); printf("%s\n",&dat); }
