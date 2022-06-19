#! /usr/bin/perl

use strict ;
use warnings ;
use IO::Socket ;

my $host_to_scan = shift || "localhost" ;
my $range_begin = shift || 4000 ;
my $range_end = shift || 4010 ;


for my $port ( $range_begin..$range_end ) {
	my $socket = IO::Socket::INET->new(
		PeerAddr => $host_to_scan,
		PeerPort => $port,
		Proto => "tcp"
	) && print "$port open\n" ;
	print "$port closed\n" if ( not defined $socket ) ;
}


