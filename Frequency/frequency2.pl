#! /usr/bin/perl

use strict;
use warnings;
use Time::HiRes "gettimeofday" ;

system("clear");
open ( my $log, ">>", "frequency.log" ) ;


my @frq = () ;
my $sum_seconds = 0 ;

my $start = 0 ;
while ( <> ){
	my ( $secs, $milisecs ) = gettimeofday ;
	push @frq, $secs ;
	my $line = $start++ . "\t". $secs. "\t" . scalar localtime() ;
	print $line ;
	print $log $line, "\n" ;
}

for ( my $i = 0 ; $i < $#frq; $i++ ) {
	$sum_seconds += ( $frq[$i+1] - $frq[$i] ) ;
}

my $result = $sum_seconds / $#frq ;

print "\nResult: \t", $result, "\n" ;

close ( $log ) ;
