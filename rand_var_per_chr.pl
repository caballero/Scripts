#!/usr/bin/perl

# Script to randomly select one variant for each sequence/chromosome from a VCF file.
# Usage: perl rand_var_per_chr.pl < VCF > OUTPUT
# (C) 2018 Juan Caballero
# License: Artistic License 2.0 https://www.perlfoundation.org/artistic-license-20.html

use strict;
use warnings;

my %snps_per_seq = (); # hash to store all variants per sequence

while (<>) {
    if (/^#/) { # print headers as the original
        print; 
    }
    else {
        my ($seq_id) = split (/\t/, $_);
        push @{ $snps_per_seq{ $seq_id } }, $_; # store a hash per sequence, with possitions as array
    }
}
foreach my $seq_id (sort keys %snps_per_seq) {
    my @snps = @{ $snps_per_seq{ $seq_id } };
    print $snps[ int rand @snps ]; # grab one random position from the array
}
