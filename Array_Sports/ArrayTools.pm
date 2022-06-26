use strict; use warnings ;

sub mixed_value { 
	$_[ int(rand($#_)) ]
}

sub first_value { 
	$_[0] 
}

sub last_value { 
	$_[$#_] 
}
sub size {
	$_# + 1
}

sub mean_value {
	eval (join "+", @_) / ( $#_ + 1 )  
}
sub sum {
   eval join "+", @_       
}
sub product {
   eval join "*", @_       
}

merge_arrays { @_ }


1
