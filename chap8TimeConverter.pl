#!/usr/bin/perl
# seconds1.plx
use warnings;
use strict;

our $sec_num;

get_seconds();

my ($hours, $minutes, $seconds) = secs2hms($sec_num);
print "3723 seconds is $hours hours, $minutes minutes and $seconds seconds";
print "\n";

sub get_seconds {
    print "Enter number of seconds: ";
    $sec_num = <STDIN>;
}
sub secs2hms {
    my ($h,$m);
    my $seconds = shift;
    $h = int($seconds/(60*60));
    $seconds %= 60*60;
    $m = int($seconds/60);
    $seconds %= 60;
    ($h,$m,$seconds);
}
