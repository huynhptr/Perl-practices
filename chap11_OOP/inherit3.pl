#!/usr/bin/perl
use strict;
use warnings;

# Add current directory to @INC so Employee.pm can be found
use FindBin;
use File::Spec;
use lib File::Spec->catdir($FindBin::Bin, '.');

use Employee;

my $dilbert = Employee->new (
        forename => "John",
        surname => "Dilbert",
        address => "1 Sapien Street",
        phone_no => "000-000-0001",
        occupation => "programmer",
        position => "whatever Dogbert says",
        employer => "Dogbert",
        salary => "43000"
);

my $dogbert = $dilbert->employer;
$dogbert->forename("Pitbull");
$dogbert->address("12 Canine Street");
$dogbert->phone_no("123-456-7890");
$dogbert->occupation("Nondoer");

$dilbert->printBusinessCard();
print "\n\n";
$dogbert->printBusinessCard();
