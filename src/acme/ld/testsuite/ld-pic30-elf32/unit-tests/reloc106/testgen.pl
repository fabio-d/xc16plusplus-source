#! /usr/bin/perl

# write header
print "\;\n";
print "\; Test cases for reloc106\n";
print "\;\n";

# conditional section directive (default = .text)
print ".if 1\n\t.text\n.else\n\t.data\n.endif\n";

# declare the list of data directives
our @data = (
    ".byte b1",
    ".word dmaoffset(b2)",
    ".long dmaoffset(b3)",
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

                
