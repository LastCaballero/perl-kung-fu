#! /usr/bin/perl

use Time::HiRes "clock_gettime" ;

use strict; use warnings ;

sub reducer ;

my @times ;
my $current_time ;
system "clear" ;
printf "%16s\t%16s\n", "Realtime", "Frequency" ;
while ( <STDIN> ) {
	$current_time = clock_gettime ;
	push @times, $current_time ;
	printf "%16.4f\t%16.4f\n", $current_time, reducer ;
}


printf "\n   Result: %16.4f\n", reducer ;

sub reducer {
	my $time_diffs_sum ;
	for ( my $i = 0 ; $i < $#times ; $i++ ) {
		$time_diffs_sum += $times[$i+1] - $times[$i] ;
	}
	if ( $#times+1 > 1 ) {
		return $time_diffs_sum/ ( $#times+1 ) ;
	}
	else {
		return 0 ;
	}
}


