#! /usr/bin/perl

use strict vars;
use warnings ;
use Getopt::Std ; 

my %options ;

getopts( "s:", \%options )  ;

my $sep = $options{'s'} || "\n" ;

my ($begin, $end, $stp ) = @ARGV ;
$stp = 1 if ( not defined $stp ) ;

die "same number for begin and end of sequence!" if ( $begin == $end ) ;


if ( $begin < $end ) {
	my @seq = ( $begin .. $end + 1 ) ; 
	for ( my $i = 0 ; $i < $#seq ; $i += $stp ) {
		printf "%s", $seq[$i] . $sep ;
	}
} else {
	my @seq = ( $end .. $begin + 1 ) ; 
	for ( my $i = 0 ; $i < $#seq ; $i += $stp ) {
		printf "%s", $seq[$i] . $sep ;
	}

}
