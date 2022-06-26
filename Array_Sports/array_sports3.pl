#! /usr/bin/perl

use strict ;
use warnings ;

use lib "." ;
use ArrayTools ;


my @ar1 = ( 1 .. 200 ) ;
my @ar2 = ( 1 .. 200 ) ;
print array_compare @ar1, @ar2 , "\n" ;
