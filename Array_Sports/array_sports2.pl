#! /usr/bin/perl

use strict ; use warnings ;

my $array_referenz = () ;
my $subbarray_referenz = () ;

for ( 1 .. 5 ) {
	for ( 1..30 ) {
		push @$subbarray_referenz, int(rand(33)) ;
	}
	push @$array_referenz, [ @$subbarray_referenz ] ;
}

for ( @$array_referenz ) {
	print "$_\n" for ( @$_ ) ;
}
