#!/usr/bin/perl
use strict;
use warnings;

if($#ARGV != 0) {
    die "Usage: perl chap4Primes.pl <number>\n";
}

for my $current (2..$ARGV[0]) {
    my $isPrime = 1;
    for my $i (2..($current-1)) {
        if($current % $i == 0) {
            $isPrime = 0;
            last;
        }
    }
    print $current, " " if $isPrime;
    $isPrime = 0;
}
