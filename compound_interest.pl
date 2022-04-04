#!/usr/bin/perl

use strict;
use warnings;

use feature ':5.10';

# compound_interest.pl - the miracle of compound interest

# First, we'll set up the variables we want to use.
my $nest_egg = 10000;    # $nest_egg is our starting amount
my $year     = 2000;     # This is the starting year for our table.
my $duration = 10;       # How many years are we saving up?
my $apr      = 9.5;      # This is our annual percentage rate.

# Print the headers for our report.
say "Year", "\t\t", "Balance", "\t\t", "Interest", "\t\t", "New balance";

# Calculate interest for each year.
for my $i ( 1 .. $duration )
{
    print $year, "\t\t";
    $year++;

    print $nest_egg, "\t\t";

    # Try using this instead to see why this line looks so complex:
    # my $interest = ($apr / 100) * $nest_egg;
    my $interest = int( ( $apr / 100 ) * $nest_egg * 100 ) / 100;
    print $interest, "\t\t";

    $nest_egg += $interest;

    say $nest_egg;
}

say $year, "\t\t", $nest_egg;
