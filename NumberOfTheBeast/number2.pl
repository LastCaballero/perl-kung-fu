#! /usr/bin/perl

use strict; use warnings ;

my @array_of_names ;
my %name_and_sum ;
my $longest_name = 0 ;
sub calculate ;

if ( not -t STDIN ) {
	@array_of_names = <STDIN>
}

for my $arg ( @ARGV ) {
	if ( -e $arg ) {
		open my $f, "<", $arg ;
		push @array_of_names, $_ while ( <$f> ) ;
	}
	else{
		push @array_of_names, $arg ;
	}
}
chomp @array_of_names ;
for my $name ( @array_of_names ) {
	calculate( $name ) ;
}

for ( keys %name_and_sum ) {
	printf( "%-${longest_name}s\t%4i\n", $_, $name_and_sum{$_} ) ;
}

sub calculate {
	my $name = shift ;
	if ( length( $name ) > $longest_name ) {
		$longest_name = length ( $name ) ;
	} 
	my @letters = split(//, $name ) ;
	my $sum ;
	for ( @letters ) {
		$sum += ord( $_ ) ;
	}
	$name_and_sum{$name} = $sum ;
}


