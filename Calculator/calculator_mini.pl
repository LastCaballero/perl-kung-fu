#! /usr/bin/perl

use strict ;
use warnings ;

my $line ;
while ( <STDIN> ) {
	$line = $_ ;
	print "= " ;
	print eval $line, "\n" ;
}
