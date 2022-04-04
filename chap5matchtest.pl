#!/usr/bin/perl
# matchtest2.plx
use warnings;
use strict;
$_ = '1: A silly sentence (495,a) *BUT* one which will be useful. (3)';
print "Enter a regular expression: ";
my $pattern = <STDIN>;
chomp($pattern);

my @matches;
if (@matches = $_ =~ /$pattern/) {
    print join "\n", @matches, "\n";
}
else {
    print "'$pattern' was not found.\n";
}
