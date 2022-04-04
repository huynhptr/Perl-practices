#!/usr/bin/perl
# chess.plx
use warnings;
use strict;

my @chessboard;
my @back = qw(R N B Q K N B R);
for (0..7) {
    $chessboard[0]->[$_] = "W" . $back[$_]; # White Back Row
    $chessboard[1]->[$_] = "WP"; # White Pawns
    $chessboard[6]->[$_] = "BP"; # Black Pawns
    $chessboard[7]->[$_] = "B" . $back[$_]; # Black Back Row
}

while (1) {
   # Print board
   for my $i (reverse (0..7)) { # Row
       for my $j (0..7) { # Column
           if (defined $chessboard[$i]->[$j]) {
               print $chessboard[$i]->[$j];
           }
           elsif ( ($i %2) == ($j %2) ) {
               print "..";
           }
           else {
               print "  ";
           }
           print " "; #Endofcell
       }
       print "\n";     # End of row
    }
    print "\nStarting square [x,y]: ";
    my $move = <>;
    last unless ($move =~ /^\s*([1-8]),([1-8])/);
    my $startx = $1-1;
    my $starty = $2-1;
    unless (defined $chessboard[$starty]->[$startx]) {
        print "There's nothing on that square!\n";
        next;
    }
    
    #Get start piece side and name
    my $startChessName = $chessboard[$starty]->[$startx];
    $startChessName =~ /(^[BW])([PRNBQK]$)/;
    my ($startSide, $startChess) = ($1, $2);
    
    #Calculate possible knight moves
    my $knightMoves = [];
    my $x1 = $startx - 2; my $y1 = $starty + 1;
    my $x2 = $startx - 2; my $y2 = $starty - 1;
    my $x3 = $startx + 2; my $y3 = $starty + 1;
    my $x4 = $startx + 2; my $y4 = $starty - 1;
    my $x5 = $startx - 1; my $y5 = $starty + 2;
    my $x6 = $startx + 1; my $y6 = $starty + 2;
    my $x7 = $startx - 1; my $y7 = $starty - 2;
    my $x8 = $startx + 1; my $y8 = $starty - 2;
    push @{$knightMoves}, [$x1, $y1] if ($x1 >= 0 && $x1 <9 && $y1 >= 0 && $y1 <9);
    push @{$knightMoves}, [$x2, $y2] if ($x2 >= 0 && $x2 <9 && $y2 >= 0 && $y2 <9);
    push @{$knightMoves}, [$x3, $y3] if ($x3 >= 0 && $x3 <9 && $y3 >= 0 && $y3 <9);
    push @{$knightMoves}, [$x4, $y4] if ($x4 >= 0 && $x4 <9 && $y4 >= 0 && $y4 <9);
    push @{$knightMoves}, [$x5, $y5] if ($x5 >= 0 && $x5 <9 && $y5 >= 0 && $y5 <9);
    push @{$knightMoves}, [$x6, $y6] if ($x6 >= 0 && $x6 <9 && $y6 >= 0 && $y6 <9);
    push @{$knightMoves}, [$x7, $y7] if ($x7 >= 0 && $x7 <9 && $y7 >= 0 && $y7 <9);
    push @{$knightMoves}, [$x8, $y8] if ($x8 >= 0 && $x8 <9 && $y8 >= 0 && $y8 <9);
    
    print "\nEnding square [x,y]: ";
    $move = <>;
    last unless ($move =~ /([1-8]),([1-8])/);
    my $endx = $1-1;
    my $endy = $2-1;
    
    if($endx < 0 || $endx > 8 || $endy < 0 || $endy > 8) {
        print "Cannot move off the board!\n";
        next;
    }
    
    #Get end piece side and name
    my $endChessName = $chessboard[$endy]->[$endx];
    $endChessName =~ /(^[BW\.\s])[PRNBQK\.\s]$/;
    my $endSide = $1;
    
    if ($startSide eq $endSide) {
        print "Cannot take your own pieces!\n";
        next;
    }
    
    if ($startChess eq 'K') {
        my $validMove = 0;
        for (0..(scalar(@{$knightMoves}) -1)) {
            if ($endx == $knightMoves->[$_]->[0] && $endy == $knightMoves->[$_]->[1]) {
                $validMove = 1;
                last;
            }
        }
        unless($validMove) {
            print "Invalid knight's move!\n";
            next;
        }
    }
    
    # Put starting square on ending square.
    $chessboard[$endy]->[$endx] = $chessboard[$starty]->[$startx];
    # Remove from old square
    undef $chessboard[$starty]->[$startx];
}
