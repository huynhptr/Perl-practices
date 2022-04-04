#!/usr/bin/perl

use strict;
use warnings;

use feature ':5.10';

my $usage = "./print_calendar.pl <month ex. Jan, Feb, etc> <day of the 1st Ex: 0-6 for Monday-Sunday>";
my %monthLength = ('Jan' => 31, 'Feb' => 28, 'Mar' => 31, 'Apr' => 30,
                   'May' => 31, 'Jun' => 30, 'Jul' => 31, 'Aug' => 31,
                   'Sep' => 30, 'Oct' => 31, 'Nov' => 30, 'Dec' => 31);
my @daysOfWeek = ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
if ($#ARGV != 1 || !defined($daysOfWeek[$ARGV[1]]) || !defined($monthLength{$ARGV[0]})) {
   say $usage;
    exit 1;
}

my $month = $ARGV[0];
my $dayOfFirst = $ARGV[1];

my %dateToWeekday;
my $currentWeekday = $dayOfFirst;
for my $i (1..$monthLength{$month}) {
    $dateToWeekday{$i} = $daysOfWeek[$currentWeekday];
    $currentWeekday++;
    $currentWeekday %= 7;
}

say join "\t", @daysOfWeek;

my $d = 1;
while($d <= $monthLength{$month}) {
    my $line = '';
    for my $wd (@daysOfWeek) {
        if(defined($dateToWeekday{$d}) && $wd eq $dateToWeekday{$d}) {
            $line = $line . $d . "\t";
            $d++;
        }
        else {
            $line = $line . " \t";
        }
    }
    say $line;
    $line = '';
}
