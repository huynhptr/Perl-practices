package Employee;
use strict;
use warnings;

# Add current directory to @INC so Person.pm can be found
use FindBin;
use File::Spec;
use lib File::Spec->catdir($FindBin::Bin, '.');

use Person;

our @ISA = qw(Person);

sub employer {$_[0]->{employer}=$_[1] if defined $_[1]; $_[0]->{employer}}
sub position {$_[0]->{position}=$_[1] if defined $_[1]; $_[0]->{position}}
sub salary {$_[0]->{salary}=$_[1] if defined $_[1]; $_[0]->{salary}}

sub raise {
    my $self = shift;
    $self->{salary} += 2000;
    $self
}

sub _init {
    my $self = shift;
    my $employer = $self->{employer} || "unknown";
    unless (ref $employer) {
        my $boss = Person->new(surname => $employer);
        $self->employer($boss);
    }
    $self->SUPER::_init();
}

sub printBusinessCard {
    my $emp = shift;
    my $position = $emp->position;
    my $salary = $emp->salary;
    my $employer = $emp->employer->surname;
    $emp->SUPER::printBusinessCard;
    print <<EOF;
Position: $position
Salary: $salary
Employer: $employer
EOF
    return $emp;
}
