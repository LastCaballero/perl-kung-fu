#! /usr/bin/perl

use strict ;
use warnings ;


if ( not -t STDIN )  { 
	my $ln = 0 ;
	print ++$ln . "\t" . $_ while ( <STDIN> ) ;
}

for ( @ARGV ) {
	my $ln = 0 ;
	open my $reader, "<", $_ ;
	print ++$ln . "\t" . $_ while ( <$reader> ) ;
	close $reader ;
}
