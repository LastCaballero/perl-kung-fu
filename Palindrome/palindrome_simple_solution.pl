#! /usr/bin/perl

use strict ;
use warnings ;

sub test_palindrome ;
for ( @ARGV ) {
	print "$_ ",(test_palindrome $_), "\n" ;
}
sub test_palindrome {
	my $word = shift ;
	my $half = int ( (length $word) / 2 ) ;
	my $part_1 = substr $word, 0, $half ;
	my $part_2 = substr( (join ("", reverse (split "",$word) ) ), 0, $half ) ;
	return $part_1 eq $part_2 ;
}

