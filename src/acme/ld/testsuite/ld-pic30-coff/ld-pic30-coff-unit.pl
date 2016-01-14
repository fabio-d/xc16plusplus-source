#!/usr/local/bin/perl
#
# go [dir]
#
# - execute all unit tests
#    and clean up after
#

# load some modules we need
use Cwd;
use File::Spec::Functions;

my $num_tests = 0;
my $num_pass = 0;
my $num_fail = 0;

if (@ARGV) {
    # read test directory from the command line
    $home = $ARGV[0];
}
else {
    # get the current working directory
    $home = getcwd();
}

print "\n----------------\n";
print "GLD30 Unit Tests\n";
print "----------------\n";
print "\n\nTest Directory: $home\n\n";

# a list of directories to skip
my %skip = (
	operators => 1,
        pdata => 1,
);

# open the test directory
#  and get a list of nested directories
chdir $home;
opendir(DOT, '.');
@dirlist = grep { -d and $_ ne '.' and $_ ne '..' } readdir DOT;

# for each nested directory
foreach $d (@dirlist) {
    chomp $d;
    next if $skip{$d}; # avoid skip list

    #print "$d\n";
    chdir catfile($home,$d); # cd to an absolute path

    next if (! -e 'go'); # avoid directories without 'go' scripts

    #print `go` ; # execute the test
    $result = `go`;
    $num_tests++;
    $num_pass++ if ($result =~ /Pass/);
    $num_fail++ if ($result =~ /ERROR/);
    print $result;

    #@files = <*>;
    #print " @files\n"; # list the directory before cleaning

    unlink 'a.out', 'test.out', 'UartOut.txt'; # clean up
    unlink <*.stackdump>, <*.hex>, <*.lst>, <*.map>, <*~>, <*.exe>, <*.o>;

    #@files = <*>;
    #print " @files\n"; # list the directory after cleaning
}

closedir DOT;

# print summary
print "-----------------------\n";
print "GLD30 Unit Test Summary\n";
print "-----------------------\n\n";
print "$num_tests Total tests in $home\n";
print "$num_pass Tests PASS\n";
print "$num_fail Tests FAIL\n\n";

exit;

