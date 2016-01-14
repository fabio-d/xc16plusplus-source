/*
** misc18
*/

#include <stdio.h>
#define __dsPIC30F6014__
#include <p30F6014.h>

int evals[] __attribute__((section(".eedata,r"))) =
{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

int main()
{
  int i;

  PSVPAG = 0xff;       /* to select 0x7ff000 */
  CORCONbits.PSV = 1;  /* turn on PSV */
  printf("%x:", &evals);
  for (i = 0; i < 10; i++)
    printf(" %d", evals[i]);
  printf("\n");
}
