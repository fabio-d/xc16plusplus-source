#!perl
#
# isa_encoding.pl
#
# - automated testing of GAS assembler
#
# - calls genmap.pl, diff, aftergas
#
# - tests are generated from opcode map files
#

use File::Basename;

my $GAS = "~/.install/bin/pic30-as";
my $OBJDUMP = "~/.install/bin/pic30-objdump";

my $verbose = 0;
my $full_tests = 0;
my $partial_tests = 0;
my $bounds_tests = 0;
my $help = 0;

my $count = 0;

my $total_test_completed = 0;
my $error = 0;
my $begin_date = 0;

#
# process command line options
#
while (@ARGV and $ARGV[0] =~ /^-/) {
    $_ = shift;  # remove first -option
    last if /^--$/; # -- terminates options (unused)
    if (/^-v$/) {$verbose++; next;}
    if (/^-f$/) {$full_tests++; next;}
    if (/^-p$/) {$partial_tests++; next;}
    if (/^-b$/) {$bounds_tests++; next;}
    if (/^-\?|h/) {$help++; next;}
    if (/^-asm$/) {$GAS = shift; next;}
    if (/^-dump$/) {$OBJDUMP = shift; next;}
    print "\n  Error: Can't understand $_\n";
    exit;
}

my $name = basename($0);
my $dir = dirname($0);

#
# print help screen if asked
#
if ($help) {
    print "\n  syntax: $name [options] file\n\n";
    print   " options:\n";
    print   "    -asm <path_to_asm>\t\tSpecify which assembler to use.\n";
    print   "    -dump <path_to_objdump>\tSpecify which objdump to use.\n";
    print   "    -f\t\t\t\tfull expansion (maximum tests)\n";
    print   "    -p\t\t\t\tpartial expansion (minimum tests)\n";
    print   "    -b\t\t\t\tboundary tests (FUTURE)\n";
    print   "    -v\t\t\t\tverbose output\n";
    print   "    -?,-h\t\t\tdisplay this help screen\n";
    exit;
}

print "\n";
print "\n<<<<<<<<<<<<<<< GAS Test Results >>>>>>>>>>>>>>>\n";
$begin_date = `date`;

# remove the aggregate test file, if one exists
print `rm -f $dir/big.s`;

while (<>) {
    next if /^[\#\s]/; # skip blank or comment (#) lines
    chomp; # remove EOL char(s)
    my $pattern = $_;
    $count++;

# create TEMP00, a map file with a single pattern
    open(OUT, ">temp00") or die "can't open map file: $!";
    print(OUT "$pattern");
    close OUT or die "can't close map file: $!";

    print "\n<<<<<<<<<<<<<<<<<<<<<< $count >>>>>>>>>>>>>>>>>>>>>>\n";

# report pattern
    print "\nPattern: $pattern\n";

# create TEMP01, assembler source with expanded pattern
    if ($full_tests) {
        print "perl $dir/genmap.pl -f temp00 > temp01\n" if $verbose;
        print `perl $dir/genmap.pl -f temp00 > temp01`;
    } elsif ($partial_tests) {
        print "perl $dir/genmap.pl -p temp00 > temp01\n" if $verbose;
        print `perl $dir/genmap.pl -p temp00 > temp01`;
    } elsif ($bounds_tests) {
        print "\nSorry, Bounds tests are not yet implemented.\n\n";
        exit;
    } else {
        print "\nPlease specify -f for full tests, -p for partial.\n\n";
        exit;
    }

# build aggregate test file
    print `cat temp01 >> $dir/big.s`;

# create TEMP02, object file from TEMP01
    print "$GAS -p33FJ128MC510 temp01 -o temp02\n" if $verbose;
    print `$GAS -p33FJ128MC510 temp01 -o temp02`;

    if ($?) {die} # assembler error

# create TEMP03, re-formatted assembler source
    print "perl $dir/aftergas.pl temp01 > temp03\n" if $verbose;
    print `perl $dir/aftergas.pl temp01 > temp03`;

# create TEMP04, dis-assembly of TEMP02
    print "$OBJDUMP -d temp02 > temp04\n" if $verbose;
    print `$OBJDUMP -d temp02 > temp04`;

    if ($?) {die} # objdump error

# create TEMP05, re-formatted dis-assembly
    open(IN, "temp04") or die "can't open input file: $!";
    open(OUT, ">temp05") or die "can't open output file: $!";


# read and process each objdump line
#
# addr : xx xx xx instruction
#
    while (<IN>) {
        if ($_ =~ /^\s+\w+\:\s+(\w+)\s(\w+)\s(\w+)\s+(.*)$/) {
            $instr = $4; # get the text part
            $map = join " ","\t;",$3,$2,$1; # get the hex part
            print (OUT "$instr $map\n");
        }
    }

    close IN or die "can't close input file: $!";
    close OUT or die "can't close output file: $!";

# create TEMP06, the diff of TEMP03 and TEMP05
    print "diff -uw temp03 temp05 > temp06\n" if $verbose;
    print `diff -uw temp03 temp05 > temp06`;

    my $diff_error = $?;


# report test count
    my $out = `wc temp01`;
    my ($junk,$lc1) = split /\s+/, $out;
    my $out = `wc temp05`;
    my ($junk,$lc2) = split /\s+/, $out;

    $total_tests_completed = $total_tests_completed + $lc1;

    if ($lc1 - $lc2) {
        print "\nError: Tests Did Not Complete!\n\n";
        $error = 1;
        last;
    } else {
        print "\n$lc1 Tests Completed\n";
    }

# report results
    if ($diff_error) {
        print "\nErrors reported (see file temp06)\n";
        $error = 1;
        last;
    } else {
        print "\nNo errors detected\n";
    }
}

print "\n<<<<<<<<<<<<<<<<<<<< Stats >>>>>>>>>>>>>>>>>>>>\n";
print "\nTotal Tests Completed = $total_tests_completed.\n";

if ($error) {
    print "Errors found!\n";
}
else {
    print "No errors found!\n";
}

print "\nBegin:  $begin_date";
print "  End:  ";
print `date`;
print "\n<<<<<<<<<<<<<<<<<<<<< End >>>>>>>>>>>>>>>>>>>>>\n";
print "\n";
