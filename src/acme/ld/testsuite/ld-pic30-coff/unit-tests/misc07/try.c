extern void setup;

int
main()
{
  unsigned int *p  = (unsigned int *) 0x8000;
  unsigned int err = 0;

  setup;
  while (p < (unsigned int *) 0xFFFF) {
    if (*p != (unsigned int) p)
      {
      printf("Error at %#x\n\n", p);
      err++;
      break;
      }
  }

    printf("%d Errors Detected!");
}
