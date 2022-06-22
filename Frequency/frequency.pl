#! /usr/bin/perl

use strict;
use warnings;

my @frq = () ;
my $sum_seconds = 0 ;

while ( <> ){
	push @frq, time ;
}

for ( my $i = 0 ; $i < $#frq; $i++ ) {
	$sum_seconds += ( $frq[$i+1] - $frq[$i] ) ;
}

my $result = $sum_seconds / $#frq ;

my $counter = 1 ;
for ( @frq ) {
	print $counter++ , $_ , "\n" ;
}

print "Frequency: ", $result , "\n" ;
