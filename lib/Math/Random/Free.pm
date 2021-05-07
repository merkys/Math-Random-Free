package Math::Random::Free;

use strict;
use warnings;

# ABSTRACT: Free drop-in replacement for Math::Random
# VERSION

use Array::Shuffle qw( shuffle_array );

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(
    random_permutation 
    random_permuted_index
);
@EXPORT_OK = qw(
    random_permutation 
    random_permuted_index
    random_uniform 
    random_uniform_integer 
);

sub random_permutation
{
    my( @array ) = @_;
    return @array[random_permuted_index( scalar @array )];
}

sub random_permuted_index
{
    my( $n ) = @_;

    my @array = 0..$n-1;
    shuffle_array( @array );

    return @array;
}

sub random_uniform
{
    my( $n, $low, $high ) = @_;

    $n    = 1 unless defined $n;
    $low  = 0 unless defined $low;
    $high = 1 unless defined $high;

    if( wantarray ) {
        return map { rand * ($high - $low) + $low } 1..$n;
    } else {
        return rand * ($high - $low) + $low;
    }
}

sub random_uniform_integer
{
    my( $n, $low, $high ) = @_;

    return map { int( rand * ($high - $low) + $low ) } 1..$n;
}

1;
