#!/usr/bin/perl
use strict;
use warnings;

our $MAX_COUNT = 30;
our $call_count = 0;
sub sub1($$);
sub sub2($$);
sub sub3($$);

sub1($call_count, $MAX_COUNT);

sub sub1($$) {
    my $count = shift;
    my $limit = shift;
    print "Inside sub1().";
    if (++$count == $limit) {
        print "Last call: sub1()\n";
    }
    else {
        print " Calling sub2()...\n";
        sub2($count, $limit);
    }
}
sub sub2($$) {
    my $count = shift;
    my $limit = shift;
    print "Inside sub2().";
    if (++$count == $limit) {
        print "Last call: sub2()\n";
    }
    else {
        print " Calling sub3()...\n";
        sub3($count, $limit);
    }
}
sub sub3($$) {
    my $count = shift;
    my $limit = shift;
    print "Inside sub3().";
    if (++$count == $limit) {
        print "Last call: sub3()\n";
    }
    else {
        print " Calling sub1()...\n";
        sub1($count, $limit);
    }
}
