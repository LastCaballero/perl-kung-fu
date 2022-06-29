use strict;
use warnings ;

sub to8dbin { 
	sprintf "%08b", shift
}

sub to16dbin {
	sprintf "%016b", shift  
}

sub iptobin {
	my $back = '' ;
	my @ip_parts = split /\./, shift ;
	for my $part ( @ip_parts ) {
		$back .= sprintf "%08b.", $part ;
	}
	$back =~ s/\.$//r
}

1
