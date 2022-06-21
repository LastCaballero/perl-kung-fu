use strict; use warnings ;

sub mixed_value { 
	$_[ int(rand($#_)) ]
}

sub min_value { 
	return $_[0] ; 
}

sub max_value { 
	return $_[$#_] ; 
}
sub size {
	return $_# + 1 ;
}

sub mean_value {
	my $sum = 0 ;
	$sum += $_ for ( @_ ) ;
	return $sum / ( $#_ + 1 ) ;
}
sub sum {
	my $sum = 0 ;
	$sum += $_ foreach ( @_ ) ;
	return $sum ;
}
sub product {
	my $product = 0 ;
	$product *= $_ foreach ( @_ ) ;
	return $product ;
}

sub compare_numeric_arrays {
	my @ar1 = shift ;
	my @ar2 = shift ;
	if ( size @ar1 != size @ar2 ) {
		return 0 ;
	}
	for ( my $i = 0 ; $i < $#ar1 ; $i++ ) {
		return 0 if ( $ar1[$i] != $ar2[$i] ) ;
	}
	return 1 ;
}

1
