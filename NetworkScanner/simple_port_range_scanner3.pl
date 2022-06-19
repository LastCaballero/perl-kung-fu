#! /usr/bin/perl

use strict ;
use warnings ;
use IO::Socket ; 
use List::Util qw( reduce ) ;

my $target_host = "localhost" ;
my @ranges_array = map { (split /(\.+)|-/)[0] .. (split /(\.+)|-/)[1] } grep { /(.+)|-/  } @ARGV  ;
my $port_num_len = reduce { ( length $a ) > ( length $b )  } @ranges_array ; 
exit 1 ;
my (%sockets, $probe ) ;
for my $port ( @ranges_array ) {
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
