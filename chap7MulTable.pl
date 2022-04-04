#!/usr/bin/perl
use strict;
use warnings;

my $table;
$table->[0]->[5] = $table->[5]->[0] = 'six';
$table->[0]->[4] = $table->[4]->[0] = 'five';
$table->[0]->[3] = $table->[3]->[0] = 'four';
$table->[0]->[2] = $table->[2]->[0] = 'three';
$table->[0]->[1] = $table->[1]->[0] = 'two';
$table->[0]->[0] = 'one';
$table->[1]->[5] = $table->[5]->[1] = 'twelve';
$table->[1]->[4] = $table->[4]->[1] = 'ten';
$table->[1]->[3] = $table->[3]->[1] = 'eight';
$table->[1]->[2] = $table->[2]->[1] = 'six';
$table->[1]->[1] = 'four';
$table->[2]->[5] = $table->[5]->[2] = 'eighteen';
$table->[2]->[4] = $table->[4]->[2] = 'fifteen';
$table->[2]->[3] = $table->[3]->[2] = 'twelve';
$table->[2]->[2] = "nine";
$table->[3]->[5] = $table->[5]->[3] = 'twenty four';
$table->[3]->[4] = $table->[4]->[3] = 'twenty';
$table->[3]->[3] = 'sixteen';
$table->[4]->[5] = $table->[5]->[4] = 'thirty';
$table->[4]->[4] = "twenty five";
$table->[5]->[5] = "thirty six";

print "Enter a multiplication with multipliers from 1 to 6 (Ex. 2 x 6) ('t' for whole table): ";
my $input = <STDIN>;
chomp($input);
if($input eq 't') {
    for my $i (1..6) {
        for my $j (1..6) {
            print "$i x $j = $table->[$i-1]->[$j-1]\n";
        }
    }
}
else {
    die "Invalid input: $!" unless $input =~ m/([1-6]) x ([1-6])/;
    my ($m1, $m2) = ($1, $2);
    print "$input = $table->[$m1-1]->[$m2-1]\n";
}
