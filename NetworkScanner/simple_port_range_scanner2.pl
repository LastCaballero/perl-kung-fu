#! /usr/bin/perl

use strict ;
use warnings ;
use IO::Socket ; 

my $target_host = shift || "localhost" ;
my $range_begin = shift || 4000 ;
my $range_end = shift || 4010 ;
my $port_num_len = length $range_end ; 

my (%sockets, $probe ) ;
for my $port ( $range_begin .. $range_end ) {
	$probe = IO::Socket::INET -> new ( 
		PeerHost => $target_host,
		PeerPort => $port,
		Proto => 'tcp',
		Timeout => 0.4 
		) ;
	if ( $probe ) {
		$sockets{$port} = 'open' ;
		close $probe ;
	} else {
		$sockets{$port} = 'close' ;
	}
}

foreach my $portnumber ( sort { $a <=> $b } keys %sockets ){
	printf "%${port_num_len}d\t%s\n", $portnumber, $sockets{$portnumber} ;
}
