/* Verify that we do not promote a short loop index variable when it is
   being stored to memory.  */

/* { dg-do compile } */
/* { dg-options "-O2 -fpromote-loop-indices -fdump-tree-promoteshort" } */
/* { dg-final { scan-tree-dump-times "Promoting 0 variables" 1 "promoteshort" } } */
/* { dg-final { cleanup-tree-dump "promoteshort" } } */

void
test1 (short n, short *x)
{
  short i;

  for (i = 0; i < n; i++)
    x[i] = i;
}
