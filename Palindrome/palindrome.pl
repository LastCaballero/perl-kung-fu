#! /usr/bin/perl

use warnings ;

sub test_palindrome ;

for ( @ARGV ) {
	print test_palindrome($_), "\t", $_, "\n" ;
}

sub test_palindrome {
	
	my $word = shift ;
	my @word_array = split "", $word ;
	
	my $half = int( ($#word_array + 1 ) / 2 ) ;
	
	my $beg = 0 ;
	my $end = $#word_array ;

	while (  $beg <= $half and $end >= $half ) {
		if ( $word_array[$beg] ne $word_array[$end] ) {
			return 0 ;
		}	
	} continue {
		$beg++ ;
		$end-- ;
	}
	return 1 ;
}

