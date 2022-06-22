
my $server_name = "Torpedo" ;

sub ok_200{
	my $head;
	$head .= "HTTP/1.1 200 OK\n" ; 
	$head .= "Server: " . $server_name . "\n" ;
	$head .= "\n" ;
	$head
}

1
