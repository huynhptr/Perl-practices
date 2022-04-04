#!/usr/bin/perl
use strict;
use warnings;
sub next_10_fibs(\@);

my @fibs = (1,1);
next_10_fibs(@fibs);

$, = " ";
print @fibs;

sub next_10_fibs(\@) {
    my $ref = shift;
    for (1..10) {
        push @$ref, $ref->[-1] + $ref->[-2];
    }
}
