#Ex.4
print 2+6/4-3*5+1, "\n"; #-10.5
print 17+-3**3/2, "\n"; #3.5
print 26+3^4*2, "\n"; #11101 xor 01000 = 0b10101 = 21
print 4+3>=7||2&4*2<4, "\n";
### 4+3>=7||2&8<4
### 7>=7||2&8<4
### true||2&false
### true||0
### true

#Ex.3
print "Enter a decimal less than 256: ";
my $input = <STDIN>;
my $binary = "";
for my $i (0..7) {
    $binary = ($input % 2) . $binary;
    $input >>= 1;
}
print $binary;
