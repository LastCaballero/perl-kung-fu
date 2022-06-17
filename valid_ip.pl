#! /usr/bin/perl

use strict;
use warnings;

my $ip_search_string = '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' ;

for ( @ARGV ) {
	if ( grep { /$ip_search_string/ } $_ ) {
		print "$_ it was valid ip.\n" ;
	} else{
		print "$_ is not a valid ip!\n" ;
	}
}

