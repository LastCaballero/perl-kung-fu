#! /usr/bin/perl

use strict ; 
use warnings ;

my $request = 1;

my ( $network_address, $network_part, $parts ) ;

unless ( $request ) {
	$network_address	= "150.150.150.0/24" ;
	$network_part = ( join ".", ( split /\./, $network_address )[0..2] ) . '.' ;
	$parts			= 2 ;
} else {
	print "give me na c-class networkaddress (f.e. 150.150.150.0/24) > " ;
	$network_address	= <STDIN> ;
	$network_part = ( join ".", ( split /\./, $network_address )[0..2] ) . '.' ;
	print "how many parts you want? 2,4,8,16,32,64 > " ;
	$parts			=  <STDIN>  ;
}

my %bit_hash = (
	2 	=> 0b10000000,
	4 	=> 0b11000000,
	8 	=> 0b11100000,
	16	=> 0b11110000,
	32	=> 0b11111000,
	64	=> 0b11111100,
) ;

my %short_notation_hash = (
	2 	=> 	25,
	4 	=>	26,
	8	=>	27,
	16	=>	28,
	32	=>	29,
	64	=>	30
);

my %network_hash ;

my $and_result ;
for ( 0 .. 255 ) {
	$and_result = $_ & $bit_hash{int($parts)} ;
	push @{$network_hash{ $and_result }}, $network_part . $_ ; 
}

print "\nmask will be: $network_part" . $bit_hash{int($parts)} . "\n"  ;
print "short-notation: " . $network_part . "0/" . $short_notation_hash{int($parts)} . "\n" ;

for my $net_key ( sort { $a <=> $b } keys %network_hash ) {
	print "\nbaseaddress: ", $network_part . $net_key, "\n" ;
	for my $ip ( @{$network_hash{ $net_key }} ) {
		print $ip, "\n" ;	
	}
	print "last one is the broadcast-address\n" ;
}
