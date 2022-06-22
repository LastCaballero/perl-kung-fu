#! /usr/bin/perl

use strict ; use warnings ;

{
	package WebServer ;
	use strict; use warnings ;
	use Data::Dumper ;
    use HTTP::Server::Simple::CGI ;
    use base "HTTP::Server::Simple::CGI" ;
	use lib "." ;
	use StatusProducer ;
	use HtmlProducer ;
	my %pages = (
		'/' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Welcome to Tornado Webserver :-) ") ;
			print p( a "/page1", "page1"  ) ;
			print p( a "/page2", "page2"  ) ;
			print p( a "/page3", "page3"  ) ;
			print p( a "/page4", "page4"  ) ;
			print p( a "/page5", "page5"  ) ;
			print body_bottom() ;
		},
		'/page1' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Page 1") ;
			print body_bottom() ;
		},
		'/page2' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Page 2") ;
			print body_bottom() ;
		},
		'/page3' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Page 3") ;
			print body_bottom() ;
		},
		'/page4' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Page 4") ;
			print body_bottom() ;
		},
		'/page5' => sub {
			print ok_200 ;
			print body_top() ;
			print h1("Page 5") ;
			print body_bottom() ;
		}
	) ;
	my $sub_handler ;
	sub handle_request {
		my $self = shift ;
		my $cgi = shift ;
		my $path = $cgi->path_info();
		$sub_handler = $pages{$path} ;
		&$sub_handler ;
	}
}

WebServer->new(4000)->run() ;


