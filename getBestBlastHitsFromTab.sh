#!/usr/bin/perl

use strict;
use warnings;

my $first      = 1;
my $best_hit   = undef;
my $best_score = undef;
my $last_id    = undef;

while (<>) {
    chomp;
    my @line   = split (/\t/, $_);
    my $id     = $line[0];
    my $score  = $line[-1];
    if ($first == 1) {
        $best_hit   = $_;
        $best_score = $score;
        $last_id    = $id;
        $first      = 0;
    }
    elsif ($last_id ne $id) {
        print "$best_hit\n";
        $best_hit   = $_;
        $best_score = $score;
        $last_id    = $id;
    }
    else {
        if ($score > $best_score) {
            $best_hit   = $_;
            $best_score = $score;
        }
        elsif ($score == $best_score) {
            $best_hit .= ":$_";
        }
    }
}
