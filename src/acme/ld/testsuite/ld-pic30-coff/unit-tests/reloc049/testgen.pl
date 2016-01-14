#! /usr/local/bin/perl

# write header
print "\;\n";
print "\; Test cases for reloc049\n";
print "\;\n";

# write section directive
print "\t.text\n";

# declare the list of data directives
our @data = (
    ".pbyte i1",
    ".pword handle(i2)",
);

# other declarations
our $test = 1;

# construct test cases for all combinations
foreach $a (@data) {
    foreach $b (@data) {
        foreach $c (@data) {
            foreach $d (@data) {
                print "\n\t.align 2\n";
                print "T$test:\n";
                print "\t$a\n\t$b\n\t$c\n\t$d\n";
                $test++;
            }
        }
    }
}

print"END:\n";

                
