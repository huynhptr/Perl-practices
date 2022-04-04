#!/usr/bin/perl
#buggy.plx
use strict;
use warnings;

my %hash;
while(1) {
    print "What would you like to do? ('o' for options): ";
    chomp($_ = <STDIN>);
    if($_ eq "o"){
        options();
    }
    elsif($_ eq "r"){
        myRead();
    }
    elsif($_ eq "l"){
        list();
    }
    elsif($_ eq "w"){
        myWrite();
    }
    elsif($_ eq "d"){
        myDelete();
    }
    elsif($_ eq "x"){
        myClear();
    }
    elsif($_ eq "q"){
        last;
    }
    else {
        print "Sorry, not a recognized option.\n";
    }
}

sub options {
    print <<'MSG';
        Options available:
        o - view options
        r - read entry
        l - list all entries
        w - write entry
        d - delete entry
        x - delete all entries
MSG
}
sub myRead {
    my $keyname = getkey();
    if (exists $hash{"$keyname"}) {
        print "Element \'$keyname\' has value $hash{$keyname}\n";
    }
    else {
        print "Sorry, this element does not exist.\n";
    }
}
sub list {
    foreach (sort keys(%hash)) {
        print "$_ => $hash{$_}\n";
    }
}
sub myWrite {
    my $keyname = getkey();
    my $keyval = getval();
    if (exists $hash{$keyname}) {
        print "Sorry, this element already exists.\n";
    }
    else {
        $hash{$keyname}=$keyval;
    }
}
sub myDelete {
    my $keyname = getkey();
    if (exists $hash{$keyname}) {
        print "This will delete the entry $keyname.\n";
        delete $hash{$keyname};
    }
}
sub myClear {
    undef %hash;
}
sub getkey {
    print "Enter key name of element: ";
    chomp($_ = <STDIN>);
    return $_;
}
sub getval {
    print "Enter value of element: ";
    chomp($_ = <STDIN>);
    return $_;
}
