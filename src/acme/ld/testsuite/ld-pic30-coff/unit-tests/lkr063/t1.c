void __attribute__((noload,section("foo"))) foo (void);
void foo (void)
{
 asm (".pword 0x111111");
 }

int __attribute__((noload,section("boo"))) boo = 0x2222;
 
void _reset()
{}
