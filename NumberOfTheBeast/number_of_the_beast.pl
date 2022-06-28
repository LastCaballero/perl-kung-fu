#! /usr/bin/perl

use strict; use warnings ;
use lib "." ;

use Person ;
sub calculate_sums_and_add ;

my $letter_latin = join "", ' ', "a".."z" ;

my @array_of_names ;
my @array_of_persons ;

if ( not -t STDIN  ) {
	@array_of_names = <STDIN> ;
}

for my $arg_or_file ( @ARGV ) {
	if ( -e $arg_or_file ) {
		open my $fh, "<", $arg_or_file ;
		push @array_of_names, $_ while ( <$fh> ) ;
		close $fh ;
	} else {
		push @array_of_names, $arg_or_file ;
	}
}
chomp @array_of_names ;

for my $name ( @array_of_names ) {
	calculate_sums_and_add $name ;	
}

for my $pers ( sort { $a->{'points'} <=> $b->{'points'}  } @array_of_persons ) {
	printf "%-50s%d\n", $pers->{'name'}, $pers->{'points'} ;
}

sub calculate_sums_and_add {
	my $sum = 0 ;
	my @word = split "", shift ;
	for my $letter ( @word ) {
		$sum += index( $letter_latin, lc $letter )  ;
	}
	push @array_of_persons, Person -> new( (join "", @word), $sum);
}
