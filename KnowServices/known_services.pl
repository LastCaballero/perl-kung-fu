#! /usr/bin/perl

use strict; use warnings ;
use JSON ;
sub export_to_json ;
sub export_to_csv ;

open my $reader, "<", "/etc/services" ;

my @services ;
while ( <$reader> ) {
	push @services, [ $1, $2, $3 ] if ( /^([\w-]*)\s+(\d+)\/(tcp|udp)/  ) ;
}

close $reader ;

export_to_csv \@services ;
export_to_json \@services ;

sub export_to_csv {
	my $array_ref = shift ;
	open my $writer, ">", "services.csv" ;
	print $writer "name,port,protocol", "\n" ;  
	for ( @$array_ref ) {
		print $writer "@$_[0],@$_[1],@$_[2]\n" ;  
	}	

	close $writer ;
}

sub export_to_json {
	my $array_ref = shift ;
	my $json = encode_json $array_ref ;
	open my $writer, ">", "services.json" ;
	print $writer $json ;
	close $writer ;
}



