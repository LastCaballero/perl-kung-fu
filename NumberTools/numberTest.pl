#! /usr/bin/perl

use strict;
use warnings;
use lib '.';
use NumberTools;

print iptobin( "200.200.200.20" ), "\n" ;
print to8dbin(qw(200)), "\n" ;
print to16dbin("200"), "\n" ;
