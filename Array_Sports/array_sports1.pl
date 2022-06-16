#! /usr/bin/perl

use strict ; use warnings ;

my @array ;
my @sub_array ;
for ( 1 .. 5 ) {	
	for ( 1 .. 30 ) {
		push @sub_array, int(rand(33)) ;
	}
	push @array, [ @sub_array ] ;
}

for ( @array ) {
	for ( @$_ ){
		print "$_\n" ;
	}
}
