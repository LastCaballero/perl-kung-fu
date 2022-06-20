sub mix { 
	$_[ int(rand($#_)) ]
}

sub lowest { 
	$_[0] 
}

sub highest { 
	$_[$#_]  
}

sub mean {
	my $sum = 0 ;
	$sum += $_ for ( @_ ) ;
	$sum / ( $#_ + 1 )
}





1
