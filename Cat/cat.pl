#! /usr/bin/perl
use strict ;
use warnings ;

my $show_numbers = grep /-n/, @ARGV ;
my $squeze_empty = grep /-s/, @ARGV ;
my $parameter_count = $#ARGV + 1 ;

my $line_number = 1 ;
sub print_out {
	s/.*\n// if ( $squeze_empty and /^$/ ) ;
	s/^/${line_number}  / if ( $show_numbers ) and $line_number++ ;
	print ;
}

print_out while ( <STDIN> ) ;

for ( @ARGV ) {
	if ( -e $_ ) {
		open ( my $file, "<", $_ ) ;
		print_out $_ while ( <$file> ) ;
		close $file ;
	}
}

