#! /usr/bin/perl

use warnings;
use strict ;

my ( %inputs, $line_numbers );

if ( defined $ARGV[0] and $ARGV[0] =~ /\b[0-9]+\b/ ) {
	$line_numbers = $ARGV[0] ;
	shift @ARGV ;
} else {
	$line_numbers = 10 ;
}

if ( not -t STDIN ) {
	push @{$inputs{'stdin'}}, $_ while ( <STDIN> ) ;
}

for my $arg ( @ARGV ) {
	open my $fh, "<", $arg ;
	push @{$inputs{$arg}}, $_ while ( <$fh> ) ;
	close $fh ;
}


for my $key ( keys %inputs ){
	for ( my $i = 0; $i < $line_numbers ; $i++ ) {
		print @{$inputs{$key}}[$i] if ( $i <= $#{$inputs{$key}} ) ;
	}  
} 


