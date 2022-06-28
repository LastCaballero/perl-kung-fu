package Person ;
use strict;
use warnings;

my $name ;
my $points ;

sub new {
	my $class 	= shift ;
	$name 		= shift ;
	$points 	= shift ;
	my $self = {
		name 	=> $name,
		points 	=> $points
	} ;
	bless $self, $class ;
	return $self ;
}

1
