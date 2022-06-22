
sub body_top {
	my $body_top ;
	$body_top .= '<html><head><title>Startseite</title>
		<style>
			body {
				font-family: sans-serif ;
				margin: 45px ;
			}
		</style>
	</head><body>' ;
	return $body_top ;
}
sub body_bottom {
	my $body_bottom ;
	$body_bottom .= '</body></html>' ;
	return $body_bottom ;
}

sub p { '<p>' . shift . '</p>' }
sub h1 { '<h1>' . shift . '</h1>' }
sub h2 { '<h2>' . shift . '</h2>' }
sub h3 { '<h3>' . shift . '</h3>' }
sub h4 { '<h4>' . shift . '</h4>' }
sub h5 { '<h5>' . shift . '</h5>' }
sub h6 { '<h6>' . shift . '</h6>' }
sub a {
	my $target = shift ;
	my $innerhtml = shift ;
	my $concat_link ;
	$concat_link .= '<a href="' . $target . '">' ;
	$concat_link .= $innerhtml . '</a>'
}
1 ;
