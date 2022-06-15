#! /usr/bin/perl
use strict;
use warnings;

my $width = shift;
my @fibo_array ;
push @fibo_array, $_ for ( 1,2 ) ;
until ( $fibo_array[0] > $width ) {
	push @fibo_array,$fibo_array[0] + $fibo_array[1] ;
	print shift @fibo_array, "\n" ;
}
