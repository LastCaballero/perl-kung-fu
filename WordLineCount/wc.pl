#! /usr/bin/perl

use strict;
use warnings ;

if ( not -t STDIN ) {
	my @lines = <STDIN> ;
	print $#lines+1, "\tSTDIN" , "\n" ;
}

for ( @ARGV ) {
	open my $filehandle, "<", $_ ;
	my @lines = <$filehandle> ;
	print $#lines+1, "\t$_" , "\n" ;
	close $filehandle ;
}
