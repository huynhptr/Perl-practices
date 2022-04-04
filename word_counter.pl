#!/usr/bin/perl

use strict;
use warnings;

use feature ':5.10';

my @words = ('apple', 'orange', 'apple', 'strawberry', 'apple', 'strawberry');
my %fruits;
for my $fruit (@words){
    $fruits{$fruit}++;
}
for my $fruit (keys %fruits) {
    say $fruit, '(', $fruits{$fruit}, ')';
}
