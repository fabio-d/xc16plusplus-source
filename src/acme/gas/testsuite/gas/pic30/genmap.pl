#!perl 
#
# gen.pl
#
# - generate test cases for GAS validation
#
# - reads opcode map files in the following format:
#
#    instr;opcode map
#
#    EX: mov;0010 dddd ffff ffff ffff ffff
#
# - writes test cases in the following format
#
#    instr[.b|w] op1[,op2][,op3] ; xx xx xx 00 
#
# Notes:
#   1. opcode map fields are defined in dsPIC Instruction Set DOS
#   2. spaces in opcode map are optional
#   3. test cases can be fed directly into the GAS assembler
#
use strict;

my (@inlines,@outlines);
my ($line,$instr,$map);
my @bits3 = ('000','001','010','011','100','101','110','111');
my @bits4 = ('0000','0001','0010','0011','0100','0101','0110','0111',
    '1000','1001','1010','1011','1100','1101','1110','1111');
my @bits5 = ('00000','00001','00010','00011','00100','00101','00110','00111',
    '01000','01001','01010','01011','01100','01101','01110','01111',
    '10000','10001','10010','10011','10100','10101','10110','10111',
    '11000','11001','11010','11011','11100','11101','11110','11111');
my @all_regs = ('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15');
my @double_regs = ('0','2','4','6','8','10','12','14');
my @quad_regs = ('0','4','8','12');

my $has_acc_mode = 0;     # A bit
my $has_byte_mode = 0;    # B bit
my $has_dest_mode = 0;    # D bit
my $has_ext_mode = 0;     # E bit
my $has_bittest_mode = 0; # Z bit

my $has_double_mode = 0;  # .d instructions
my $has_quad_mode = 0;    # .q instructions

my $has_base_mode = 0;
my $has_literal_mode = 0;

my $verbose = 0;
my $full_tests = 0;
my $partial_tests = 0;
my $bounds_tests = 0;
my $help = 0;

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
    print "\n  Error: Can't understand $_\n";
    exit;
}

#
# print help screen if asked
#
if ($help) {
    print "\n  syntax: gen.pl [options] file\n\n";
    print   " options:\n";
    print   "         -?,-h\tdisplay this help screen\n";
    print   "         -f\tfull expansion (maximum tests)\n";
    print   "         -p\tpartial expansion (minimum tests)\n";
    print   "         -b\tboundary tests (some should fail)\n";
    exit;
}

# build a list of test cases
while (<>) {
    next if /^[\#\s]/; # skip blank or comment (#) lines
    s/\s//g; # remove spaces in the map sources
    chomp; # remove EOL char(s)
    push @inlines, $_;
}


# expand the B bit
foreach $line (@inlines) {
    ($instr,$map) = split /;/, $line, 2;
    next unless $map;
    if ($map =~ /(.*)B(.*)/) {
        #print "$instr\t$1 B $2\n" if $verbose;
        push @outlines, join "",$instr,'.b;',$1,'1',$2;
        push @outlines, join "",$instr,'.w;',$1,'0',$2;
    }
    else {
        push @outlines, $line;
    }
}

# expand the Z bit
reset_input();
foreach $line (@inlines) {
    ($instr,$map) = split /;/, $line, 2;
    next unless $map;
    if ($map =~ /(.*)Z(.*)/) {
        #print "$instr\t$1 Z $2\n" if $verbose;
        push @outlines, join "",$instr,'.z;',$1,'1',$2;
        push @outlines, join "",$instr,'.c;',$1,'0',$2;
    }
    else {
        push @outlines, $line;
    }
}

# expand the S bit
reset_input();
foreach $line (@inlines) {
    ($instr,$map) = split /;/, $line, 2;
    next unless $map;
    if ($map =~ /(.*)S(.*)/) {
        #print "$instr\t$1 S $2\n" if $verbose;
        push @outlines, join "",$instr,'.s;',$1,'1',$2;
        push @outlines, join "",$instr,';',$1,'0',$2;
    }
    else {
        push @outlines, $line;
    }
}

# expand the W bit
reset_input();
foreach $line (@inlines) {
    ($instr,$map) = split /;/, $line, 2;
    next unless $map;
    if ($map =~ /(.*)W(.*)/) {
        #print "$instr\t$1 W $2\n" if $verbose;
        push @outlines, join "",$instr,'.d;',$1,'1',$2;
        push @outlines, join "",$instr,'.w;',$1,'0',$2;
    }
    else {
        push @outlines, $line;
    }
}
# check for bra with comma condition
check_branch_comma();
#print "\ncheck_branch_comma\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the A bit if it is first
expand_A2();
#print "\nexpand_A2\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand special case ldwlo or stwlo instructions
expand_spmov_indir();
#print "\nexpand_spmov_indir\n";
#foreach $line (@outlines) { print "$line\n"; }
#exit

# expand base register for 3 operand instructions
expand_base();
#print "\nexpand_base\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the ppp field
expand_ppp();
#print "\nexpand_ppp\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the nnnnnnnnnnnnnnnn field
expand_n16(); 
#print "\nexpand_n16\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkkkkkkkkkkkkkk field
expand_k16();
#print "\nexpand_k16\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkkkkkkkkkkkk field
expand_k14();
#print "\nexpand_k14\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkkkkkkkk field
expand_k10();
#print "\nexpand_k10\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkkkk DSP 6 bit field
expand_kkkkkk();
#print "\nexpand_kkkkkk\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkkk field
expand_kkkkk();
#print "\nexpand_kkkkk\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the kkkk field
expand_kkkk();
#print "\nexpand_kkkk\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the ffffffffffffffff field
expand_f16();
#print "\nexpand_f16\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the fffffffffffffff field
expand_f15();
#print "\nexpand_f15\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the (register direct) ttttvvvv field for divide instructions
expand_ttttvvvv();

# expand the (register direct) ssss field for a few odd instructions
expand_ssss3();
#print "\nexpand_ssss3\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the qqq field
expand_qqq();
#print "\nexpand_qqq\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the ggg field
expand_ggg();
#print "\nexpand_ggg\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the (source) ssss field
expand_ssss();
#print "\nexpand_ssss\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the (register direct) ssss field
expand_ssss2();
#print "\nexpand_ssss2\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the wwww field (for source operands)
expand_wwww();
#print "\nexpand_wwww\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the rrrr field (signed 4 bit literal)        
expand_rrrr();   
#print "\nexpand_rrrr\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the hhh field
expand_hhh();
#print "\nexpand_hhh\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the wwww field (for dest operands)
expand_wwww();
#print "\nexpand_wwww\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the (destination) dddd field
expand_dddd();
#print "\nexpand_dddd\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the (register direct) dddd field
expand_dddd2();
#print "\nexpand_dddd2\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the Dfffffffffffff field
expand_Df13sp();
#print "\nexpand_Df13sp\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the Dfffffffffffff field
expand_Df13();
#print "\nexpand_Df13\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the fffffffffffff field
expand_f13();
#print "\nexpand_f13\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the mmm field 
expand_mmm();
#print "\nexpand_mmm\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the mm field 
expand_mm();
#print "\nexpand_mm\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the A bit 
expand_A();
#print "\nexpand_A\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the bbbb field
expand_bbbb();
#print "\nexpand_bbbb\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the bbb field
expand_bbb();
#print "\nexpand_bbb\n";
#foreach $line (@outlines) { print "$line\n"; }
#exit 

# expand the wwww field for BSW, BTST
expand_wwww2();
#print "\nexpand_wwww2\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the k field (1-bit bit selection)
expand_k();
#print "\nexpand_k\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the iiii field 
expand_iiii();
#print "\nexpand_iiii\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the xx field 
expand_xx2();
#print "\nexpand_xx\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the jjjj field 
expand_jjjj();
#print "\nexpand_jjjj\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the yy field 
expand_yy();
#print "\nexpand_yy\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the xx field 
expand_xx();
#print "\nexpand_xx\n";
#foreach $line (@outlines) { print "$line\n"; }

# expand the aa field 
expand_aa();
#print "\nexpand_aa\n";
#foreach $line (@outlines) { print "$line\n"; }

# clear out any unused fields
cleanup();

# print the current list
foreach $line (@outlines) {
    ($instr,$map) = split /;/, $line, 2;
    print "$instr\t; $map\n";
}
# end of main()

sub reset_input() {  # reset the input list
    @inlines = @outlines;
    @outlines = ();
}

sub expand_A2() { # expand the A bit if it is first
	my ($comma_required, $c, $skipA);
	reset_input();
	foreach $line (@inlines) {
    	($instr,$map) = split /;/, $line, 2;
	    next unless $map;
	    $comma_required = (($map =~ /jjjj/) ||
	                       ($map =~ /ssss/) ||
	                       ($map =~ /dddd/) ||
	                       ($map =~ /kkkkk/));

    	if ($comma_required) { $c = ','; }
		$skipA = (($map =~ /ggg/) || ($map =~ /mm/));
	    if (!($skipA) && ($map =~ /(.*)A(.*)/)) {
	    	#print "$instr\t$1 A $2\n" if $verbose;
		    push @outlines, join "",$instr,' A',$c,';',$1,'0',$2;
	    	push @outlines, join "",$instr,' B',$c,';',$1,'1',$2;
	    }
	    else {
	        push @outlines, $line;
	    }
	}
}
  
sub expand_A() {	# expand the A bit
	my ($comma_required, $c);
	reset_input();
	foreach $line (@inlines) {
    	($instr,$map) = split /;/, $line, 2;
	    next unless $map;
	    $comma_required = (($map =~ /jjjj/) ||
	                       ($map =~ /ssss/) ||
	                       ($map =~ /dddd/) ||
	                       ($map =~ /kkkkk/));

    	if ($comma_required) { $c = ','; }
	    if ($map =~ /(.*)A(.*)/) {
	        #print "$instr\t$1 A $2\n" if $verbose;
	        push @outlines, join "",$instr,' A',$c,';',$1,'0',$2;
	        push @outlines, join "",$instr,' B',$c,';',$1,'1',$2;
	    }
	    else {
	        push @outlines, $line;
	    }
	}
}

sub expand_spmov_indir() {  # expand special case ldwlo or stwlo instructions
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        my $byteOp = ($instr =~ /\.b/);
        if ($map =~ /\b(10010)/) {
            if ($full_tests || $partial_tests){
                if ($byteOp) {
                    push @outlines, join "",$instr," [ws-512],wd; ","1001010001000dddd000ssss";
                    push @outlines, join "",$instr," [ws+0],wd; ","1001000001000dddd000ssss";
                    push @outlines, join "",$instr," [ws+1],wd; ","1001000001000dddd001ssss";
                    push @outlines, join "",$instr," [ws+511],wd; ","1001001111111dddd111ssss";
                } else {
                    push @outlines, join "",$instr," [ws-1024],wd; ","1001010000000dddd000ssss";
                    push @outlines, join "",$instr," [ws+0],wd; ","1001000000000dddd000ssss";
                    push @outlines, join "",$instr," [ws+2],wd; ","1001000000000dddd001ssss";
                    push @outlines, join "",$instr," [ws+1022],wd; ","1001001110111dddd111ssss";
                }
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
		elsif ($map =~ /\b(10011)/) {
            if ($full_tests || $partial_tests){
                if ($byteOp) {
                    push @outlines, join "",$instr," ws,[wd-512]; ","1001110001000dddd000ssss";
                    push @outlines, join "",$instr," ws,[wd+0]; ","1001100001000dddd000ssss";
                    push @outlines, join "",$instr," ws,[wd+1]; ","1001100001000dddd001ssss";
                    push @outlines, join "",$instr," ws,[wd+511]; ","1001101111111dddd111ssss";
                } else {
                    push @outlines, join "",$instr," ws,[wd-1024]; ","1001110000000dddd000ssss";
                    push @outlines, join "",$instr," ws,[wd+0]; ","1001100000000dddd000ssss";
                    push @outlines, join "",$instr," ws,[wd+2]; ","1001100000000dddd001ssss";
                    push @outlines, join "",$instr," ws,[wd+1022]; ","1001101110111dddd111ssss";
                }
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
		}
        else {
            push @outlines, $line;
        }
    }
}

# expand the base register for 3 operand instructions
sub expand_base()
{
    my $reg;
    reset_input();
    foreach $line (@inlines)
    {
        ($instr,$map) = split /;/, $line, 2;
        # avoid unusual instructions
        if (($instr =~ /bsw/) || ($instr =~ /btst/))
        {
            push @outlines, $line;
            next;
        }
        if ((($map =~ /ppp/)
             ||
             ($map =~ /11k/)
             ||
             ($map =~ /100kkkk/)
             ||
             ($map =~ /000ssss/)
             ||
             ($map =~ /kkkkkkkkkk/)
            )
            &&
            ($map =~ /(.*)wwww(.*)/)
           )
        {
            if ($full_tests)
            {
                for ($reg = 0; $reg < 16; $reg++) 
                {
                    push @outlines, join "",$instr,' w',$reg,',;',
                                                       $1,$bits4[$reg],$2;
                }
            }
            elsif ($partial_tests)
            {
                push @outlines, join "",$instr,' w0',',;',$1,'0000',$2;
                push @outlines, join "",$instr,' w1',',;',$1,'0001',$2;
                push @outlines, join "",$instr,' w15',',;',$1,'1111',$2;
            }
            elsif ($bounds_tests)
            {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else
        {
            push @outlines, $line;
        }
    }
}
# expand the (register direct) ttttvvvv field for divide instructions
sub expand_ttttvvvv()
{
    my $reg;
    reset_input();
    foreach $line (@inlines)
    {
        ($instr,$map) = split /;/, $line, 2;
        if ($map =~ /(.*)ttttvvvv(.*)/)
        {
            if ($full_tests || $partial_tests)
            {
                for ($reg = 0; $reg < 16; $reg = $reg + 2) 
                {
                    push @outlines, join "",$instr,' w',$reg,',;',
                                            $1,$bits4[$reg+1],$bits4[$reg],$2;
                }
            }
            elsif ($bounds_tests)
            {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else
        {
            push @outlines, $line;
        }
    }
}

sub expand_ppp() {  # expand the ppp field
    my ($comma_required, $c);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line

        $comma_required = (($map =~ /wwww/) ||
                           ($map =~ /bbb/) ||
                           ($map =~ /dddd/));
        my $include_direct = !($instr =~ /tblrd/) &&
                             !($instr =~ /mov.d/);

        if ($comma_required) { $c = ','; }
        if ($map =~ /(.*)ppp(.*)/) {
                #print "$instr\t$1 ppp $2\n" if $verbose;
                if ($include_direct) {
                   push @outlines, join "",$instr,' ws',$c,';',$1,'000',$2;
                }
                push @outlines, join "",$instr,' [ws]',$c,';',$1,'001',$2;
                push @outlines, join "",$instr,' [ws--]',$c,';',$1,'010',$2;
                push @outlines, join "",$instr,' [ws++]',$c,';',$1,'011',$2;
                push @outlines, join "",$instr,' [--ws]',$c,';',$1,'100',$2;
                push @outlines, join "",$instr,' [++ws]',$c,';',$1,'101',$2;
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_qqq() {  # expand the qqq field
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;

        my $include_direct = !($instr =~ /tblwt/) &&
                             !($instr =~ /mov.d/);

        if ($map =~ /(.*)qqq(.*)/) {
            #print "$instr\t$1 qqq $2\n" if $verbose;
            if ($include_direct) {
               push @outlines, join "",$instr,' wd',';',$1,'000',$2;
            }
            push @outlines, join "",$instr,' [wd]',';',$1,'001',$2;
            push @outlines, join "",$instr,' [wd--]',';',$1,'010',$2;
            push @outlines, join "",$instr,' [wd++]',';',$1,'011',$2;
            push @outlines, join "",$instr,' [--wd]',';',$1,'100',$2;
            push @outlines, join "",$instr,' [++wd]',';',$1,'101',$2;
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_ggg() {  # expand the ggg field
    my ($comma_required, $c);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = !($instr =~ /push/);
        if ($comma_required) { $c = ','; }
        if ($map =~ /(.*)ggg(.*)/) {
            #print "$instr\t$1 ggg $2\n" if $verbose;
            push @outlines, join "",$instr,' ws',$c,';',$1,'000',$2;
            push @outlines, join "",$instr,' [ws]',$c,';',$1,'001',$2;
            push @outlines, join "",$instr,' [ws--]',$c,';',$1,'010',$2;
            push @outlines, join "",$instr,' [ws++]',$c,';',$1,'011',$2;
            push @outlines, join "",$instr,' [--ws]',$c,';',$1,'100',$2;
            push @outlines, join "",$instr,' [++ws]',$c,';',$1,'101',$2;
            push @outlines, join "",$instr,' [ws+wb]',$c,';',$1,'110',$2;
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_wwww() {  # expand the wwww field
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if ($instr =~ /Slit5/) 
            { expand_Slit5($instr,$map); }
        elsif ($instr =~ /wb/) 
            { expand_wb($instr,$map); }
        else 
            { push @outlines, $line; }
    }
}

sub expand_wwww2() {  # expand the wwww field for BSW, BTSTW
    my $reg;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if ((($instr =~ /bsw/) || ($instr =~ /btst/))
            && ($map =~ /(.*)wwww(.*)/)) {
            if ($full_tests) {
                for ($reg = 0; $reg < 16; $reg++) 
                { push @outlines, join "",$instr,' w',$reg,';',$1,$bits4[$reg],$2; }
            }
            elsif ($partial_tests) {
                push @outlines, join "",$instr,' w0',';',$1,'0000',$2;
                push @outlines, join "",$instr,' w1',';',$1,'0001',$2;
                push @outlines, join "",$instr,' w15',';',$1,'1111',$2;
            }
            elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else 
            { push @outlines, $line; }
        }
}

sub expand_n16() {  # expand the nnnnnnnnnnnnnnnn field
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if ($full_tests || $partial_tests) {
            if ($map =~ /(.*)n{16}$/) {
                push @outlines, join "",$instr," 0",";",$1,"0000000000000000",$2;
            }
            else {
                push @outlines, $line;
            }
        }
        else {
            # ToDo: create "out-of-bounds" test cases
        }
    }
}

sub expand_kkkk() {  # expand the kkkk field (unsigned 4 bit literal)        
    my $k;
    my ($comma_required, $c);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = (($instr =~ /asr/) ||
                           ($instr =~ /lsr/) ||
                           ($instr =~ /sl/));
        if ($comma_required)
        {
            $c = ',';
        }
        if ($map =~ /(.*)kkkk$/) {
            if ($full_tests) {
                for ($k = 0; $k < 16; $k++) {
                    push @outlines, join "",$instr," #",$k,$c,";",$1,$bits4[$k];
                }
            } elsif ($partial_tests) {
                push @outlines, join "",$instr," #0",$c,";",$1,"0000";
                push @outlines, join "",$instr," #1",$c,";",$1,"0001";
                push @outlines, join "",$instr," #15",$c,";",$1,"1111";
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_kkkkk() {  # expand the kkkkk field (unsigned 5 bit literal)        
    my $k;
    my ($comma_required, $c, $bitlit_only);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = !($instr =~ /cp/);
        if ($comma_required) { $c = ','; }
		$bitlit_only = (($instr =~ /asr/) || ($instr =~ /lsr/) || ($instr =~ /sl/));
        if ($map =~ /(.*)kkkkk$/) {
            if ($full_tests) {
				if ($bitlit_only) {
	   	            for ($k = 0; $k < 16; $k++) {
    	   	            push @outlines, join "",$instr," #",$k,$c,";",$1,"0",$bits4[$k];
					}
				} else {
   	    	        for ($k = 0; $k < 32; $k++) {
       	    	        push @outlines, join "",$instr," #",$k,$c,";",$1,$bits5[$k];
           	    	}
				}
            } elsif ($partial_tests) {
   	                push @outlines, join "",$instr," #0",$c,";",$1,"00000";
       	            push @outlines, join "",$instr," #1",$c,";",$1,"00001";
					if ($bitlit_only) {
	           	        push @outlines, join "",$instr," #15",$c,";",$1,"01111";
					} else {
    	       	        push @outlines, join "",$instr," #31",$c,";",$1,"11111";
					}
            } elsif ($bounds_tests) {
   	            # ToDo: create "out-of-bounds" test cases
       	    }
		}
        else {
            push @outlines, $line;
        }
    }
}

sub expand_kkkkkk() {  # expand the kkkkkk field (DSP 6 bit literal)        
    my $k;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
       	if (($instr =~ /sftac/) && ($map =~ /(.*)kkkkkk$/)) {
            if ($full_tests) {
				for ($k = -16; $k < 0; $k++) {
       	         push @outlines, join "",$instr," #",$k,";k6 ",$1,"11",$bits4[$k+16];					
				}
				for ($k = 0; $k < 16; $k++) {
       	         push @outlines, join "",$instr," #",$k,";",$1,"00",$bits4[$k];					
				}
            	 push @outlines, join "",$instr," #16",";",$1,"010000";
			}
            elsif ($partial_tests) {
    	    	push @outlines, join "",$instr," #-8;k6 ",$1,"111000";
	            push @outlines, join "",$instr," #0",";",$1,"000000";
    	   	    push @outlines, join "",$instr," #1",";",$1,"000001";
            	push @outlines, join "",$instr," #16",";",$1,"010000";
	        } elsif ($bounds_tests) {
    		        # ToDo: create "out-of-bounds" test cases
			}
		}
		else {
            push @outlines, $line;
	    }
    }
}

sub expand_k() { # expand the k field (1-bit bit selection)
    my $b;
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if (($instr =~ /pwrsav/) && ($map =~ /(.*)k(.*)/)) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr," #0;",$1,"0",$2;
                push @outlines, join "",$instr," #1;",$1,"1",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_k16() {  # expand the kkkkkkkkkkkkkkkk field (16 bit literal)        
    my $k;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if ($map =~ /(.{4})k{16}(.{4})/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr," #-32768,;k16 ", $1, "1000000000000000",$2;
                push @outlines, join "",$instr," #0,;",$1,"0000000000000000",$2;
                push @outlines, join "",$instr," #1,;",$1,"0000000000000001",$2;
                push @outlines, join "",$instr," #65535,;",$1,"1111111111111111",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        elsif ($map =~ /(.*)k{16}/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr," #0;",$1,"0000000000000000";
                push @outlines, join "",$instr," #1;",$1,"0000000000000001";
                push @outlines, join "",$instr," #65535;",$1,"1111111111111111";
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_k14() {  # expand the kkkkkkkkkkkkkk field (unsigned 14 bit literal)        
    my $k;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        my $require_even = ($instr =~ /lnk/);
        if ($map =~ /(.{10})k{14}/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr," #0;",$1,"00000000000000";

                if ($require_even) {
                    push @outlines, join "",$instr," #2;",$1,"00000000000010";
                    push @outlines, join "",$instr," #16382;",$1,"11111111111110";
                }
                else {
                    push @outlines, join "",$instr," #1;",$1,"00000000000001";
                    push @outlines, join "",$instr," #16383;",$1,"11111111111111";
                }
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

# expand the kkkkkkkkkk field (unsigned 10 bit literal)        
sub expand_k10()
{
    my $k;
    reset_input();
    foreach $line (@inlines)
    {
        ($instr,$map) = split /;/, $line, 2;
        my $byteOp = ($instr =~ /\.b/);
        my ($comma_required, $c);
        $comma_required = 1;
        if ($comma_required)
        {
            $c = ',';
        }
        if ($map =~ /(.{10})k{10}(.{4})/)
        {
            if ($full_tests || $partial_tests)
            {
                if ($byteOp)
                {
                    # For bytes, support positive and negative
                    push @outlines, join "",$instr,
                                         " #-128",$c,";k8 ",$1,"0010000000",$2;
                    push @outlines, join "",$instr,
                                         " #0   ",$c,";k8 ",$1,"0000000000",$2;
                    push @outlines, join "",$instr,
                                         " #1   ",$c,";k8 ",$1,"0000000001",$2;
                    push @outlines, join "",$instr,
                                         " #127 ",$c,";k8 ",$1,"0001111111",$2;
                    push @outlines, join "",$instr,
                                         " #255 ",$c,";k8 ",$1,"0011111111",$2;
                }
                else
                {
                    push @outlines, join "",$instr,
                                         " #0   ",$c,";k10 ",$1,"0000000000",$2;
                    push @outlines, join "",$instr,
                                         " #1   ",$c,";k10 ",$1,"0000000001",$2;
                    push @outlines, join "",$instr,
                                         " #511 ",$c,";k10 ",$1,"0111111111",$2;
                    push @outlines, join "",$instr,
                                         " #1023",$c,";k10 ",$1,"1111111111",$2;
                }
            }
            elsif ($bounds_tests)
            {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else
        {
            push @outlines, $line;
        }
    }
}

sub expand_Df13() {  # expand the Dfffffffffffff field (pic18 'F' instructions)        
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if ($full_tests || $partial_tests) {
            if (($instr =~ /\.b/) && ($map =~ /(.{10})Df{13}/)) {
                push @outlines, join "",$instr," 0x0;",$1,"10000000000000";
                push @outlines, join "",$instr," 0x1;",$1,"10000000000001";
                push @outlines, join "",$instr," 0x1fff;",$1,"11111111111111";
                push @outlines, join "",$instr," 0x0, WREG;",$1,"00000000000000";
                push @outlines, join "",$instr," 0x1, WREG;",$1,"00000000000001";
                push @outlines, join "",$instr," 0x1fff, WREG;",$1,"01111111111111";
            }
            elsif ($map =~ /(.{10})Df{13}/) {
                push @outlines, join "",$instr," 0x0;",$1,"10000000000000";
                push @outlines, join "",$instr," 0x2;",$1,"10000000000010";
                push @outlines, join "",$instr," 0x1ffe;",$1,"11111111111110";
                push @outlines, join "",$instr," 0x0, WREG;",$1,"00000000000000";
                push @outlines, join "",$instr," 0x2, WREG;",$1,"00000000000010";
                push @outlines, join "",$instr," 0x1ffe, WREG;",$1,"01111111111110";
            }
            else {
                push @outlines, $line;
            }
        }
        else {
            # ToDo: create "out-of-bounds" test cases
        }
    }
}


sub expand_Df13sp() {  # expand the Dfffffffffffff field for CLR and SETM instructions        
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        if (($instr =~ /clr/) || ($instr =~ /setm/)){ 
	        if ($full_tests || $partial_tests) {
	   	       	if (($instr =~ /\.b/) && ($map =~ /(.{10})Df{13}/)) {
    	   	        push @outlines, join "",$instr," 0x0;",$1,"10000000000000";
        	   	    push @outlines, join "",$instr," 0x1;",$1,"10000000000001";
            	   	push @outlines, join "",$instr," 0x1fff;",$1,"11111111111111";
                	push @outlines, join "",$instr," WREG;",$1,"00000000000000";
	           	}
    	        elsif ($map =~ /(.{10})Df{13}/) {
   	    	        push @outlines, join "",$instr," 0x0;",$1,"10000000000000";
       	    	    push @outlines, join "",$instr," 0x2;",$1,"10000000000010";
           	    	push @outlines, join "",$instr," 0x1ffe;",$1,"11111111111110";
	               	push @outlines, join "",$instr," WREG;",$1,"00000000000000";
    	   	    }
        	   	else {
            	   	push @outlines, $line;
	            }
   		    }
       		else {
           	# ToDo: create "out-of-bounds" test cases
	        }
		}
   	   	else {
       	   	push @outlines, $line;
        }
	}
}


sub expand_f16() {  # expand the ffffffffffffffff field
    my ($comma_required, $c);

    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = ($map =~ /dddd/);
        if ($comma_required) { $c = ','; }
        if ($full_tests || $partial_tests) {
            if (($instr =~ /\.b/) && ($map =~ /(.*)f{16}(.*)/)) {
                push @outlines, join "",$instr," 0x0",$c,";",$1,"0000000000000000",$2;
                push @outlines, join "",$instr," 0x1",$c,";",$1,"0000000000000001",$2;
                push @outlines, join "",$instr," 0xffff",$c,";",$1,"1111111111111111",$2;
            }
            elsif ($map =~ /(.*)f{16}(.*)/) {
                push @outlines, join "",$instr," 0x0",$c,";",$1,"0000000000000000",$2;
                push @outlines, join "",$instr," 0x2",$c,";",$1,"0000000000000010",$2;
                push @outlines, join "",$instr," 0xfffe",$c,";",$1,"1111111111111110",$2;
            }
            else {
                push @outlines, $line;
            }
        }
        else {
            # ToDo: create "out-of-bounds" test cases
        }
    }
}


sub expand_f15() {  # expand the fffffffffffffff field
    my ($comma_required, $c);

    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = (($map =~ /dddd/) || ($map =~ /ssss/));
        if ($comma_required) { $c = ','; }
        if ($full_tests || $partial_tests) {
	        if (($map =~ /\b(10001)/) && ($map =~ /(.*)f{15}(.*)/)) {		# for stw Wn, f
                    push @outlines, join "",$instr," ws, 0x0",";",$1,"000000000000000",$2;
            	    push @outlines, join "",$instr," ws, 0x2",";",$1,"000000000000001",$2;
	                push @outlines, join "",$instr," ws, 0x7ffe",";",$1,"011111111111111",$2;
    	        }
        	elsif (($map =~ /\b(10000)/) && ($map =~ /(.*)f{15}(.*)/)) {	# for ldw f,Wn
            	    push @outlines, join "",$instr," 0x0",$c,";",$1,"000000000000000",$2;
                	push @outlines, join "",$instr," 0x2",$c,";",$1,"000000000000001",$2;
	                push @outlines, join "",$instr," 0x7ffe",$c,";",$1,"011111111111111",$2;
    	        }
            else {
                push @outlines, $line;
            }
        }
        else {
            # ToDo: create "out-of-bounds" test cases
        }
    }
}


sub expand_f13() {  # expand the fffffffffffff field
    my ($comma_required, $c, $Reg_first, $Reg);

    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $comma_required = ($map =~ /bbb/);
        if ($comma_required) { $c = ','; }
		$Reg_first = ($map =~ /\b101101111/);
		if ($Reg_first) {
			$c = '';
			$Reg = ' WREG,';
		}
        if ($full_tests || $partial_tests) {
            if (($instr =~ /\.b/) && ($map =~ /(.*)f{13}(.*)/)) {
                push @outlines, join "",$instr,$Reg," 0x0",$c,";",$1,"0000000000000",$2;
                push @outlines, join "",$instr,$Reg," 0x1",$c,";",$1,"0000000000001",$2;
                push @outlines, join "",$instr,$Reg," 0x1fff",$c,";",$1,"1111111111111",$2;
            }
            elsif ($map =~ /(.*)f{13}(.*)/) {
                push @outlines, join "",$instr,$Reg," 0x0",$c,";",$1,"0000000000000",$2;
                push @outlines, join "",$instr,$Reg," 0x2",$c,";",$1,"0000000000010",$2;
                push @outlines, join "",$instr,$Reg," 0x1ffe",$c,";",$1,"1111111111110",$2;
            }
            else {
                push @outlines, $line;
            }
        }
        else {
            # ToDo: create "out-of-bounds" test cases
        }
    }
}


sub expand_rrrr() {  # expand the rrrr field (signed 4 bit literal)        
    my $k;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
       	if ($map =~ /(.*)rrrr(.*)/) {
            if ($full_tests) {
				for ($k = -8; $k < 0; $k++) {
       	            push @outlines, join "",$instr," #",$k,",;k4 ",$1,"1",$bits3[$k+8],$2;					
				}
				for ($k = 0; $k < 8; $k++) {
       	            push @outlines, join "",$instr," #",$k,",;",$1,"0",$bits3[$k],$2;					
				}
			}
            elsif ($partial_tests) {
    	    	push @outlines, join "",$instr," #-8,;k4 ",$1,"1000",$2;
	            push @outlines, join "",$instr," #0,",";",$1,"0000",$2;
    	   	    push @outlines, join "",$instr," #1,",";",$1,"0001",$2;
            	push @outlines, join "",$instr," #7,",";",$1,"0111",$2;
	        } elsif ($bounds_tests) {
    		        # ToDo: create "out-of-bounds" test cases
			}
		}
		else {
            push @outlines, $line;
	    }
    }
}

sub expand_Slit5() {
    my ($reg,$lit);
    my ($instr,$map) = @_;            # get args
    $instr =~  /(.*)\+Slit5(.*)/;     # take apart instr
    my ($instr1,$instr2) = ($1,$2);   # keep the pieces
    my $is_word_op = ($instr1 =~ /\.w/);
    $map =~ /(.*)wwww(.*)[M](.*)/;    # take apart map
    if ($full_tests) {
        for ($reg = 0; $reg < 16; $reg++) {
            $lit = $reg - 16;
            $lit *=2 if $is_word_op;
            push @outlines, join "",$instr1,$lit,$instr2,';',$1,$bits4[$reg],$2,'1',$3;
        }
        for ($reg = 0; $reg < 16; $reg++) {
            $lit = $reg;
            $lit *=2 if $is_word_op;
            push @outlines, join "",$instr1,'+',$lit,$instr2,';',$1,$bits4[$reg],$2,'0',$3;
        }
    }
    elsif ($partial_tests) {
        if ($is_word_op) {
            push @outlines, join "",$instr1,'-32',$instr2,';',$1,'0000',$2,'1',$3;
            push @outlines, join "",$instr1,'-2',$instr2,';',$1,'1111',$2,'1',$3;
            push @outlines, join "",$instr1,'+30',$instr2,';',$1,'1111',$2,'0',$3;
        }
        else {
            push @outlines, join "",$instr1,'-16',$instr2,';',$1,'0000',$2,'1',$3;
            push @outlines, join "",$instr1,'-1',$instr2,';',$1,'1111',$2,'1',$3;
            push @outlines, join "",$instr1,'+15',$instr2,';',$1,'1111',$2,'0',$3;
        }
    }
    elsif ($bounds_tests) {
        # ToDo: create "out-of-bounds" test cases
    }
}

sub expand_wb() {
    my $reg;
    my ($instr,$map) = @_;            # get args
    $instr =~  /(.*)wb(.*)/;          # take apart instr
    my ($instr1,$instr2) = ($1,$2);   # keep the pieces
    $map =~ /(.*)wwww(.*)/;           # take apart map
    if ($full_tests) {
        for ($reg = 0; $reg < 16; $reg++) 
            { push @outlines, join "",$instr1,'w',$reg,$instr2,';',$1,$bits4[$reg],$2; }
    }
    elsif ($partial_tests) {
        push @outlines, join "",$instr1,'w0',$instr2,';',$1,'0000',$2;
        push @outlines, join "",$instr1,'w1',$instr2,';',$1,'0001',$2;
        push @outlines, join "",$instr1,'w15',$instr2,';',$1,'1111',$2;
    }
    elsif ($bounds_tests) {
        # ToDo: create "out-of-bounds" test cases
    }
}

sub expand_hhh() { # expand the hhh field
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2;
        $has_literal_mode = ($map =~ /wwww/);
        if ($map =~ /(.*)hhh(.*)/) {
            #print "$instr\t$1 hhh $2\n" if $verbose;
            push @outlines, join "",$instr,' wd',';',$1,'000',$2;
            push @outlines, join "",$instr,' [wd]',';',$1,'001',$2;
            push @outlines, join "",$instr,' [wd--]',';',$1,'010',$2;
            push @outlines, join "",$instr,' [wd++]',';',$1,'011',$2;
            push @outlines, join "",$instr,' [--wd]',';',$1,'100',$2;
            push @outlines, join "",$instr,' [++wd]',';',$1,'101',$2;
            # avoid multiple use of the shared wwww field
            if ($has_literal_mode) {
                push @outlines, join "",$instr,' [wd+wb]',';',$1,'110',$2;
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_ssss() {
    my ($reg, @regs, @full_regs, @partial_regs);
    reset_input();
    @full_regs = @all_regs; @partial_regs = (0,1,15);
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line
        $instr =~  /(.*)ws(.*)/;             # take instr apart
        my ($instr1,$instr2) = ($1,$2);      # keep the pieces
        if (($instr =~ /ws/) && ($map =~ /(.*)ssss(.*)/)) {        # take map apart
            if ($full_tests)
                { @regs = @full_regs; }
            elsif ($partial_tests)
                { @regs = @partial_regs; }
            elsif ($bounds_tests)
                {} # ToDo: create "out-of-bounds" test cases
            foreach $reg (@regs)
            { push @outlines, join "",$instr1,'w',$reg,$instr2,';',$1,$bits4[$reg],$2; }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_ssss2() { # expand register-direct operand
    my ($reg, @regs, @full_regs, @partial_regs);
    my ($comma_required, $c);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line

        $comma_required = (($map =~ /wwww/) ||
                           ($map =~ /bbb/) ||
                           ($map =~ /dddd/) ||
                           ($map =~ /f{16}/));

        if ($comma_required)
        {
            $c = ',';
        }

        if ($instr =~ /\.d/)
        {
            @full_regs = @double_regs; @partial_regs = (0,2,14);
        }
        elsif ($instr =~ /\.q/)
        {
            @full_regs = @quad_regs; @partial_regs = (0,4,12);
        }
        else
        {
            @full_regs = @all_regs; @partial_regs = (0,1,15);
        }

	if ($instr =~/div/)
        {
            # special case where w0 and w1 are reserved
	    if ($instr =~ /\.d/)
    	    {
                @full_regs = (2,4,6,8,10,12,14); @partial_regs = (2,4,14);
            }
	    else
    	    {
                @full_regs = (2,3,4,5,6,7,8,9,10,11,12,13,14,15);
                @partial_regs = (2,3,15);
            }
	}

        if (!($instr =~ /ws/)
            && ($map =~ /(.*)ssss(.*)/)) {        # take map apart
            if ($full_tests)
                { @regs = @full_regs; }
            elsif ($partial_tests)
                { @regs = @partial_regs; }
            elsif ($bounds_tests)
                {} # ToDo: create "out-of-bounds" test cases
            foreach $reg (@regs)
            { push @outlines, join "",$instr,' w',$reg,$c,';',$1,$bits4[$reg],$2; }
        }
        else {
            push @outlines, $line;
        }
    }
}

# expand register-direct operand for a few odd instructions
sub expand_ssss3()
{
#
# note: this function works correctly *only if* genmap
#  processes one instruction map at a time...this is how
#  testgas invokes it..
#
    $line = @inlines[0];
    if (($line =~ /mov.d/)
        || ($line =~ /mov.q/)
        || ($line =~ /push/))
    {
        expand_ssss2();
    }
}

sub expand_dddd() { # expand destination register operand
    my $reg;
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line
        $instr =~  /(.*)wd(.*)/;             # take instr apart
        my ($instr1,$instr2) = ($1,$2);      # keep the pieces
#src        if (($instr =~ /wd/) && ($map =~ /(.*)dddd(.{7})/)) {      # take map apart
        if (($instr =~ /wd/) && ($map =~ /(.*)dddd(.*)/)) {      # take map apart
            if ($full_tests) {
                for ($reg = 0; $reg < 16; $reg++) 
                { push @outlines, join "",$instr1,'w',$reg,$instr2,';',$1,$bits4[$reg],$2; }
            }
            elsif ($partial_tests) {
                push @outlines, join "",$instr1,'w0',$instr2,';',$1,'0000',$2;
                push @outlines, join "",$instr1,'w1',$instr2,';',$1,'0001',$2;
                push @outlines, join "",$instr1,'w15',$instr2,';',$1,'1111',$2;
            }
            elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_dddd2() { # expand register-direct operand
    my ($reg, @regs, @full_regs, @partial_regs);
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line

        if ($instr =~ /\.d/)
            { @full_regs = @double_regs; @partial_regs = (0,2,14); }
        elsif ($instr=~/mul/)
            { @full_regs = (0,2,4,6,8,10,12); @partial_regs = (0,2,12); }
        elsif ($instr =~ /\.q/)
            { @full_regs = @quad_regs; @partial_regs = (0,4,12); }
        else
            { @full_regs = @all_regs; @partial_regs = (0,1,15); }

        if ($map =~ /(.*)dddd(.*)/) {        # take map apart
            if ($full_tests)
                { @regs = @full_regs; }
            elsif ($partial_tests)
                { @regs = @partial_regs; }
            elsif ($bounds_tests)
                {} # ToDo: create "out-of-bounds" test cases
            foreach $reg (@regs)
            { push @outlines, join "",$instr,' w',$reg,';',$1,$bits4[$reg],$2; }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_bbbb() { # expand the bbbb field (4-bit bit selection)
    my $b;
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)bbbb(.*)/) {
            if ($full_tests) {
                for ($b = 8; $b < 16; $b++) {
                    push @outlines, join "",$instr," #",$b,";",$1,$bits4[$b],$2;
                }
            } elsif ($partial_tests) {
                push @outlines, join "",$instr," #8;",$1,"1000",$2;
                push @outlines, join "",$instr," #9;",$1,"1001",$2;
                push @outlines, join "",$instr," #15;",$1,"1111",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_bbb() { # expand the bbb field (3-bit bit selection)
    my $b;
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)bbb(.*)/) {
            if ($full_tests) {
                for ($b = 0; $b < 8; $b++) {
                    push @outlines, join "",$instr," #",$b,";",$1,$bits3[$b],$2;
                }
            } elsif ($partial_tests) {
                push @outlines, join "",$instr," #0;",$1,"000",$2;
                push @outlines, join "",$instr," #1;",$1,"001",$2;
                push @outlines, join "",$instr," #7;",$1,"111",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_mmm() { # expand the mmm field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)mmm(.*)/) {
            if ($full_tests) {
#			Ran out of memory testing mac and msc instructions - too many
#			variations so removed w4 * w5 and w6 * w7 from full_tests since 
#			they are covered in partial_tests
#                push @outlines, join "",$instr," w4 * w5,;",$1,"000",$2;
                push @outlines, join "",$instr," w4 * w6,;",$1,"001",$2;
                push @outlines, join "",$instr," w4 * w7,;",$1,"010",$2;
                push @outlines, join "",$instr," w5 * w6,;",$1,"100",$2;
                push @outlines, join "",$instr," w5 * w7,;",$1,"101",$2;
#                push @outlines, join "",$instr," w6 * w7,;",$1,"110",$2;
            } elsif ($partial_tests) {
                push @outlines, join "",$instr," w4 * w5,;",$1,"000",$2;
                push @outlines, join "",$instr," w6 * w7,;",$1,"110",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_mm() { # expand the mm field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)mm(.*)/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr," w4 * w4,;",$1,"00",$2;
                push @outlines, join "",$instr," w5 * w5,;",$1,"01",$2;
                push @outlines, join "",$instr," w6 * w6,;",$1,"10",$2;
                push @outlines, join "",$instr," w7 * w7,;",$1,"11",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_xx() { # expand the xx field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)xx(.*)/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr,", w4;",$1,"00",$2;
                push @outlines, join "",$instr,", w5;",$1,"01",$2;
                push @outlines, join "",$instr,", w6;",$1,"10",$2;
                push @outlines, join "",$instr,", w7;",$1,"11",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_xx2() { # expand the xx field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if (($map =~ /yy/) && ($map =~ /(.*)xx(.*)/)) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr,", w4;",$1,"00",$2;
                push @outlines, join "",$instr,", w5;",$1,"01",$2;
                push @outlines, join "",$instr,", w6;",$1,"10",$2;
                push @outlines, join "",$instr,", w7;",$1,"11",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_yy() { # expand the yy field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)yy(.*)/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr,", w4;",$1,"00",$2;
                push @outlines, join "",$instr,", w5;",$1,"01",$2;
                push @outlines, join "",$instr,", w6;",$1,"10",$2;
                push @outlines, join "",$instr,", w7;",$1,"11",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_iiii() { # expand the iiii field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if (($instr =~ /ed/) && ($map =~ /(.*)iiii(.*)/)) {
            if ($partial_tests) {
                push @outlines, join "",$instr," [w8];",$1,"0000",$2;
                push @outlines, join "",$instr," [w8]+=2;",$1,"0001",$2;
                push @outlines, join "",$instr," [w9+w12];",$1,"1100",$2;
                push @outlines, join "",$instr," [w9]-=6;",$1,"1101",$2;
            } elsif ($full_tests){
                push @outlines, join "",$instr," [w8];",$1,"0000",$2;
                push @outlines, join "",$instr," [w8]+=2;",$1,"0001",$2;
                push @outlines, join "",$instr," [w8]+=4;",$1,"0010",$2;
                push @outlines, join "",$instr," [w8]+=6;",$1,"0011",$2;
                push @outlines, join "",$instr," [w8]-=6;",$1,"0101",$2;
                push @outlines, join "",$instr," [w8]-=4;",$1,"0110",$2;
                push @outlines, join "",$instr," [w8]-=2;",$1,"0111",$2;
                push @outlines, join "",$instr," [w9];",$1,"1000",$2;
                push @outlines, join "",$instr," [w9]+=2;",$1,"1001",$2;
                push @outlines, join "",$instr," [w9]+=4;",$1,"1010",$2;
                push @outlines, join "",$instr," [w9]+=6;",$1,"1011",$2;
                push @outlines, join "",$instr," [w9+w12];",$1,"1100",$2;
                push @outlines, join "",$instr," [w9]-=6;",$1,"1101",$2;
                push @outlines, join "",$instr," [w9]-=4;",$1,"1110",$2;
                push @outlines, join "",$instr," [w9]-=2;",$1,"1111",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
		} 
        elsif ($map =~ /(.*)(xx)(.*)iiii(.*)/) {
            if ($partial_tests) {
                push @outlines, join "",$instr," [w8];",$1,"xx",$3,"0000",$4;
                push @outlines, join "",$instr," [w8]+=2;",$1,"xx",$3,"0001",$4;
                push @outlines, join "",$instr," [w9+w12];",$1,"xx",$3,"1100",$4;
                push @outlines, join "",$instr," [w9]-=6;",$1,"xx",$3,"1101",$4;
				chop($instr); # remove last comma
               	push @outlines, join "",$instr,";",$1,"00",$3,"0100",$4;
            } elsif ($full_tests){
                push @outlines, join "",$instr," [w8];",$1,"xx",$3,"0000",$4;
                push @outlines, join "",$instr," [w8]+=2;",$1,"xx",$3,"0001",$4;
                push @outlines, join "",$instr," [w8]+=4;",$1,"xx",$3,"0010",$4;
                push @outlines, join "",$instr," [w8]+=6;",$1,"xx",$3,"0011",$4;
                push @outlines, join "",$instr," [w8]-=6;",$1,"xx",$3,"0101",$4;
                push @outlines, join "",$instr," [w8]-=4;",$1,"xx",$3,"0110",$4;
                push @outlines, join "",$instr," [w8]-=2;",$1,"xx",$3,"0111",$4;
                push @outlines, join "",$instr," [w9];",$1,"xx",$3,"1000",$4;
                push @outlines, join "",$instr," [w9]+=2;",$1,"xx",$3,"1001",$4;
                push @outlines, join "",$instr," [w9]+=4;",$1,"xx",$3,"1010",$4;
                push @outlines, join "",$instr," [w9]+=6;",$1,"xx",$3,"1011",$4;
                push @outlines, join "",$instr," [w9+w12];",$1,"xx",$3,"1100",$4;
                push @outlines, join "",$instr," [w9]-=6;",$1,"xx",$3,"1101",$4;
                push @outlines, join "",$instr," [w9]-=4;",$1,"xx",$3,"1110",$4;
                push @outlines, join "",$instr," [w9]-=2;",$1,"xx",$3,"1111",$4;
				chop($instr); # remove last comma
               	push @outlines, join "",$instr,";",$1,"00",$3,"0100",$4;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
		else {
            push @outlines, $line;
        }
    }
}

sub expand_jjjj() { # expand the jjjj field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)(yy)(.*)jjjj(.*)/) {
            if ($partial_tests) {
                push @outlines, join "",$instr,", [w10];",$1,"yy",$3,"0000",$4;
                push @outlines, join "",$instr,", [w10]+=2;",$1,"yy",$3,"0001",$4;
               	push @outlines, join "",$instr,";",$1,"00",$3,"0100",$4;
                push @outlines, join "",$instr,", [w11+w12];",$1,"yy",$3,"1100",$4;
                push @outlines, join "",$instr,", [w11]-=6;",$1,"yy",$3,"1101",$4;
            } elsif ($full_tests){
                push @outlines, join "",$instr,", [w10];",$1,"yy",$3,"0000",$4;
                push @outlines, join "",$instr,", [w10]+=2;",$1,"yy",$3,"0001",$4;
                push @outlines, join "",$instr,", [w10]+=4;",$1,"yy",$3,"0010",$4;
                push @outlines, join "",$instr,", [w10]+=6;",$1,"yy",$3,"0011",$4;
               	push @outlines, join "",$instr,";",$1,"00",$3,"0100",$4;
                push @outlines, join "",$instr,", [w10]-=6;",$1,"yy",$3,"0101",$4;
                push @outlines, join "",$instr,", [w10]-=4;",$1,"yy",$3,"0110",$4;
                push @outlines, join "",$instr,", [w10]-=2;",$1,"yy",$3,"0111",$4;
                push @outlines, join "",$instr,", [w11];",$1,"yy",$3,"1000",$4;
                push @outlines, join "",$instr,", [w11]+=2;",$1,"yy",$3,"1001",$4;
                push @outlines, join "",$instr,", [w11]+=4;",$1,"yy",$3,"1010",$4;
                push @outlines, join "",$instr,", [w11]+=6;",$1,"yy",$3,"1011",$4;
                push @outlines, join "",$instr,", [w11+w12];",$1,"yy",$3,"1100",$4;
                push @outlines, join "",$instr,", [w11]-=6;",$1,"yy",$3,"1101",$4;
                push @outlines, join "",$instr,", [w11]-=4;",$1,"yy",$3,"1110",$4;
                push @outlines, join "",$instr,", [w11]-=2;",$1,"yy",$3,"1111",$4;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
		}
        elsif (($instr =~ /ed/) && ($map =~ /(.*)jjjj(.*)/)){
            if ($partial_tests) {
                push @outlines, join "",$instr,", [w10];",$1,"0000",$2;
                push @outlines, join "",$instr,", [w10]+=2;",$1,"0001",$2;
                push @outlines, join "",$instr,", [w11+w12];",$1,"1100",$2;
                push @outlines, join "",$instr,", [w11]-=6;",$1,"1101",$2;
            } elsif ($full_tests){
                push @outlines, join "",$instr,", [w10];",$1,"0000",$2;
                push @outlines, join "",$instr,", [w10]+=2;",$1,"0001",$2;
                push @outlines, join "",$instr,", [w10]+=4;",$1,"0010",$2;
                push @outlines, join "",$instr,", [w10]+=6;",$1,"0011",$2;
                push @outlines, join "",$instr,", [w10]-=6;",$1,"0101",$2;
                push @outlines, join "",$instr,", [w10]-=4;",$1,"0110",$2;
                push @outlines, join "",$instr,", [w10]-=2;",$1,"0111",$2;
                push @outlines, join "",$instr,", [w11];",$1,"1000",$2;
                push @outlines, join "",$instr,", [w11]+=2;",$1,"1001",$2;
                push @outlines, join "",$instr,", [w11]+=4;",$1,"1010",$2;
                push @outlines, join "",$instr,", [w11]+=6;",$1,"1011",$2;
                push @outlines, join "",$instr,", [w11+w12];",$1,"1100",$2;
                push @outlines, join "",$instr,", [w11]-=6;",$1,"1101",$2;
                push @outlines, join "",$instr,", [w11]-=4;",$1,"1110",$2;
                push @outlines, join "",$instr,", [w11]-=2;",$1,"1111",$2;
			}
        }
        else {
            push @outlines, $line;
        }
    }
}

sub expand_aa() { # expand the aa field 
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($map =~ /(.*)aa(.*)/) {
            if (($full_tests) || ($partial_tests)) {
                push @outlines, join "",$instr,", w13;",$1,"00",$2;
                push @outlines, join "",$instr,", [w13]+=2;",$1,"01",$2;
                push @outlines, join "",$instr,";",$1,"10",$2;
            } elsif ($bounds_tests) {
                # ToDo: create "out-of-bounds" test cases
            }
        }
        else {
            push @outlines, $line;
        }
    }
}

sub check_branch_comma() {	# check for bra with comma condition
    reset_input();
    foreach $line (@inlines) {
        ($instr, $map) = split /;/, $line, 2;
        if ($instr =~ /(.*),(.*)/) {
	        push @outlines, join "",$1," ",$2,",;",$map;
        }
        else {
            push @outlines, $line;
        }
    }
}



sub cleanup() {
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line
        if ($map =~ /(.*)wwww(.*)/) {        # take map apart
            push @outlines, join "",$instr,';',$1,'0000',$2;
        }
        else {
            push @outlines, $line;
        }
    }

    # where two different encodings are valid, stick with
    #  the one the assembler uses
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line
        # fix mov.d
        if (($instr =~ /mov.d\s+w1?[02468],\s?w1?[02468]/)
             && ($map =~ /(.{8})1(.{15})/)) {
            push @outlines, join "",$instr,';',$1,'0',$2;
        }
        # fix mov.q
        elsif (($instr =~ /mov.q\s+w[048],\s?w[048]/)
             && ($map =~ /(.{8})1(.{15})/)) {
            push @outlines, join "",$instr,';',$1,'0',$2;
        }
        # fix mov.q more
        elsif (($instr =~ /mov.q\s+w[048],\s?w12/)
             && ($map =~ /(.{8})1(.{15})/)) {
            push @outlines, join "",$instr,';',$1,'0',$2;
        }
        # fix mov.q even more
        elsif (($instr =~ /mov.q\s+w12,\s?w[048]/)
             && ($map =~ /(.{8})1(.{15})/)) {
            push @outlines, join "",$instr,';',$1,'0',$2;
        }
        # fix mov.q the last little bit
        elsif (($instr =~ /mov.q\s+w12,\s?w12/)
             && ($map =~ /(.{8})1(.{15})/)) {
            push @outlines, join "",$instr,';',$1,'0',$2;
        }
        else {
            push @outlines, $line;
        }
    }

    # Insert NOPs between REPEATs as REPEATs cannot follow REPEATs
    reset_input();
    foreach $line (@inlines) {
        push @outlines, $line;

        ($instr,$map) = split /;/, $line, 2; # split the line

        if ($instr =~ /repeat/) {
           push @outlines, "nop;0000 0000 0000 0000 0000 0000";
        }
    }

    # convert binary strings to hex for easier handling
    reset_input();
    foreach $line (@inlines) {
        ($instr,$map) = split /;/, $line, 2; # split the line
        #print "$instr.$map\n";
        $map =~ /(k?\d?\d?\s?)(\d{4})(\d{4})(\d{4})(\d{4})(\d{4})(\d{4})/; # take map apart
        #print "$instr $1 $2 $3 $4 $5 $6 $7\n";
        my ($b1,$b2,$b3) = (bin2dec($2.$3), bin2dec($4.$5), bin2dec($6.$7));
        my $str = sprintf("$instr ;$1%2.2x %2.2x %2.2x",$b1,$b2,$b3);
        push @outlines, $str;
    }
}


#sub bin2dec {
#    return oct ("0b" . shift);
#}

sub bin2dec { 
    return unpack ("N", pack("B32", substr("0" x 32 . shift, -32))); 
} 

