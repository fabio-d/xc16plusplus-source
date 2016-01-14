int main()
{
  volatile int k;
  k = f2(k);
}

int __attribute__((__weak__)) f2(int n)
{
  return 4 * n;
}
