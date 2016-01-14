#! perl
#
# cdump - dump partial contents from a COFF file
#

#
# file header
#
our $f_magic;
our $f_nscns;
our $f_timdat;
our $f_symptr;
our $f_nsyms;
our $f_opthdr;
our $f_flags;

#
# optional header
#
our $magic;
our $vstamp;
our $tsize;
our $dsize;
our $bsize;
our $entry;
our $txt_start;
our $data_start;

#
# section header
#
our $s_name;
our $s_paddr;
our $s_vaddr;
our $s_size;
our $s_scnptr;
our $s_relptr;
our $s_lnnoptr;
our $s_nreloc;
our $s_nlnno;
our $s_flags;


if ($#ARGV == -1)
{ $filename = "t.exe" } # default
else
{ $filename = $ARGV[0]; }

open(IN, $filename) or die "can't open $filename";
binmode(IN);

# read the file header    
read_file_header();
printf " \nMagic number = 0x%x\n", $f_magic;
printf "Number of sections = 0x%x\n", $f_nscns;

# skip the optional header
if ($f_opthdr) {
    skipN($f_opthdr);
}

# loop through the section headers
for ($i = 0; $i < $f_nscns; $i++) {
    read_section_header();
    printf "  $s_name, size = 0x%lx, addr = 0x%lx, flags = 0x%lx\n",
    $s_size, $s_paddr, $s_flags;
}

close(IN) or die "can't close t.exe";

exit;

sub read_file_header() {
    $f_magic = read_int();
    $f_nscns = read_int();
    $f_timdat = read_long();
    $f_symptr = read_long();
    $f_nsyms = read_long();
    $f_opthdr = read_int();
    $f_flags = read_int();
}

sub read_section_header() {
    $s_name = read_char8(); # does not handle long section names
    $s_paddr = read_long();
    $s_vaddr = read_long();
    $s_size = read_long();
    $s_scnptr = read_long();
    $s_relptr = read_long();
    $s_lnnoptr = read_long();
    $s_nreloc = read_int();
    $s_nlnno = read_int();
    $s_flags = read_long();
}

sub read_int() { # read a 16 bit integer from the file
    my $n,$word;
    $n = read (IN, $word, 2);
    if ($n != 2) {
        die "read_int failed";
    }
    return unpack ("S", $word);
}
    
sub read_long() { # read a 32 bit integer from the file
    my $n,$word;
    $n = read (IN, $word, 4);
    if ($n != 4) {
        die "read_long failed";
    }
    return unpack ("L", $word);
}

sub read_char8() { # read an 8 char string from the file
    my $n,$word;
    $n = read (IN, $word, 8);
    if ($n != 8) {
        die "read_char8 failed";
    }
    return $word;
}

sub skipN() { # skip N bytes in file
    my ($count) = @_;
    my $n,$junk;
    $n = read (IN, $junk, $count);
    if ($n != $count) {
        die "skipN failed";
    }
}
  
