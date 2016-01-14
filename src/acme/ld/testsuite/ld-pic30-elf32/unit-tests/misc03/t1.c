
static char *digits = "0123456789\n";
static char *lower = "abcdefghijklmnopqrstuvwxyz\n";
static char *upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n";
static char *graph = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~\n";
static char *space = " \f\t\n\r\v";
static char *xdigit = "abcdefABCDEF\n";

void print_string(char *);

int
main()
{
  print_string(digits);
  print_string(lower);
  print_string(upper);
  print_string(graph);
  print_string(xdigit);
}
