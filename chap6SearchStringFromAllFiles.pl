#!/usr/bin/perl
use strict;
use warnings;

print "Enter a string you want to search: ";
my $searchString = <STDIN>;
chomp($searchString);

opendir DH, "." or die "Cannot open current directory handle!";
my $file;
while($file = readdir(DH)) {
    open FH, "< $file" or die "Cannot open file '$file' for reading!";
    my $lineNum = 1;
    while(<FH>) {
        last if m/$searchString/ and print "Found '$searchString' in file '$file' at line $lineNum\n";
        $lineNum++;
    }
}
