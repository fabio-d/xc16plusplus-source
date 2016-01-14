#include <stdio.h>

int _iprintf(const char *, ...);

int i = 2;
int main()
{
_iprintf("The value of 2 is %d\n", i);
i++;
printf("The value of 3 is %d\n", i);
i++;
printf("The value of 4.0 is %f\n", (float) i);

}
