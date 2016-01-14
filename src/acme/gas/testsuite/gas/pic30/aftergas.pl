#!perl
#
# aftergas.pl
#
# - reads through genmap.pl output
# - performs any post-processing required, including:
#
#   1.  convert literals to hex format
#   2.  rename equivalent instruction mnemonics
#
# - This file is part of the "tesgas" suite.
#

# slurp the input file
while (<>) {
    next if /^[\#\s]/; # skip blank or comment (#) lines
    chomp; # remove EOL char(s)
    push @inlines, $_;
}

# convert pop,push instructions
foreach $line (@inlines) {
    if ($line =~ /(.*)pop\s(w\d+)(.*)/) {
        push @outlines, "$1mov.w [--w15],$2$3";
    } elsif ($line =~ /(.*)pop\.d\s(w\d+)(.*)/) {
        push @outlines, "$1mov.d [--w15],$2$3";
    } elsif ($line =~ /(.*)pop\.q\s(w\d+)(.*)/) {
        push @outlines, "$1mov.q [--w15],$2$3";
    } elsif ($line =~ /(.*)push\s(w\d+)(.*)/) {
        push @outlines, "$1mov.w $2,[w15++]$3";
    } elsif ($line =~ /(.*)push\.d\s(w\d+)(.*)/) {
        push @outlines, "$1mov.d $2,[w15++]$3";
    } elsif ($line =~ /(.*)push\.q\s(w\d+)(.*)/) {
        push @outlines, "$1mov.q $2,[w15++]$3";
    } else {
        push @outlines, $line;
    }
}

# convert literals to hex format
reset_input();
foreach $line (@inlines) {
    if ($line =~ /(.*)\#(-?\d+)(.*)(k16\s)(.*)/) { # k16 literal
        $k = sprintf("#0x%x",($2 & 0xffff));
        push @outlines, "$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)(k10\s)(.*)/) { # k10 literal
        $k = sprintf("#0x%x",($2 & 0x3ff));
        push @outlines,"$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)(k8\s)(.*)/) { # k8 literal
        $k = sprintf("#0x%x",($2 & 0xff));
        push @outlines,"$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)(k6\s)(.*)/) { # k6 literal
        $k = sprintf("#0x%x",($2 & 0x3f));
        push @outlines,"$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)(k5\s)(.*)/) { # k5 literal
        $k = sprintf("#0x%x",($2 & 0x1f));
        push @outlines,"$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)(k4\s)(.*)/) { # k4 literal
        $k = sprintf("#0x%x",($2 & 0xf));
        push @outlines,"$1$k$3$5";
    } elsif ($line =~ /(.*)\#(-?\d+)(.*)/) { # any other literal
        $k = sprintf("#0x%x", $2);
        push @outlines,"$1$k$3";
    } else {
        push @outlines, $line;
    }
}

reset_input();
foreach $line (@inlines) { # convert .b to .w where necessary
    if (($line =~ /; a7/) && $line =~ /(.*)btsc.b(.*)/) { 
        push @outlines,"$1btsc.w$2";
    } elsif (($line =~ /; a6/) && $line =~ /(.*)btss.b(.*)/) { 
        push @outlines,"$1btss.w$2";
    } elsif (($line =~ /; a3/) && $line =~ /(.*)btst.b(.*)/) { 
        push @outlines,"$1btst.w$2";
    } elsif (($line =~ /; a4/) && $line =~ /(.*)btsts.b(.*)/) { 
        push @outlines,"$1btsts.w$2";
    } else {
        push @outlines, $line;
    }
}

# print the processed list
foreach $line (@outlines) {
    print "$line\n";
}


sub reset_input() {  # reset the input list
    @inlines = @outlines;
    @outlines = ();
}
