#! /usr/bin/perl
use strict;
use warnings;

my $width = shift;

my $a = 0;
my $b = 1;
my $c = $a + $b ;

until ( $a > $width ) {
	print "${a}\n";
	$a = $b;
	$b = $c;
	$c = $a + $b;
}
