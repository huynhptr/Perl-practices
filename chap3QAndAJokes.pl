#!/usr/bin/perl
use warnings;
use strict;
my @questions = qw(Java Python Perl C);

my @punchlines = (
"None. Change it once, and it's the same everywhere.",
"One. He just stands below the socket and the world revolves around him.", "A million. One to change it, the rest to try and do it in fewer lines.", '"CHANGE?!!"');
my %jokes;
for (0..$#questions) {
    $jokes{$questions[$_]} = $punchlines[$_];
    print "Q: $questions[$_]\nA: $jokes{$questions[$_]}\n\n";
}

