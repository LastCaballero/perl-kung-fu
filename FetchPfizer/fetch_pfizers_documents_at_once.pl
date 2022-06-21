#! /usr/bin/perl
use strict;
use warnings;

use File::Fetch ;
use WWW::Mechanize ;

my $mechanic = WWW::Mechanize->new() ;
my $url = 'https://phmpt.org/pfizers-documents/' ;

my $match_string = '/uploads/' ;

$mechanic->get( $url ) ;
my @links = $mechanic->links() ;

my @download_urls = grep { $_ =~ $match_string and $_ !~ 'png$' } map { $_->url() } @links ;

my $pfizer_dir = "PfizersDocuments" ;
mkdir $pfizer_dir if ( not -d $pfizer_dir ) ;   

my ( $fetcher, $location ) ;
for ( @download_urls ) {
	$fetcher = File::Fetch->new ( uri => $_ ) ;
	$location = $fetcher->fetch( to => $pfizer_dir ) and
	print "$location downloaded\n" or print "problem with the download $location...\n" ;
}
