#! /usr/bin/perl
use strict ;
use warnings ;

my $show_numbers = grep /-n/, @ARGV ;
my $squeze_empty = grep /-s/, @ARGV ;
my $parameter_count = $#ARGV + 1 ;

sub print_out {
	my $line_number = 1 ;

	foreach ( @_ )
	{
		next if ( $squeze_empty and /^$/ ) ;
		if ( $show_numbers ) {
			print $line_number++ . " $_";
		} else {
			print "$_";
		}
	}

}

my @stdin = <STDIN>  ; print_out @stdin ;

for ( @ARGV ) {
	if ( -e $_ and not $_ eq "-n" and not $_ eq "-s" ) {
		open ( my $file, "<", $_ ) ;
		my @content = <$file> ; print_out @content ;
		close $file ;
	}
}

