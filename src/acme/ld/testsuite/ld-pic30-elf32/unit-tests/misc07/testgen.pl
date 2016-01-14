#! /usr/local/bin/perl

# write header
print <<EOF;
;
; Test data for misc07:
;

\t.text
EOF

# write init() routine
print <<EOF;
        .global _init
_init:
        ;; put data table into the PSV window
        mov     #psvpage(data_start),w0
        mov     w0,PSVPAG

        ;;  set start, end address
        mov     #data_start,w0
        mov     #data_end,w1
        return

EOF


# print the data table
print "\t.section\t.const,\"x\"\n";
print "data_start:\n";

our $addr = 0x8000 - 2;

for ($i = 0; $i < 0x1000; $i++) {
    print "\t.word\t";
    print (sprintf("%#4x", $addr+=2));
    for ($j = 0; $j<2; $j++) {
        print (sprintf(", %#4x", $addr+=2));
    }
    print (sprintf(", %#4x\n", $addr+=2))
        unless ($i == 0xFFF); # don't print the very last value
}

print "\ndata_end:\n";
print (sprintf("\t.word\t%#4x\n", $addr+=2));

print"END:\n";

                
