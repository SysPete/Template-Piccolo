#!perl -T
use 5.10;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Template::Piccolo' ) || print "Bail out!\n";
}

diag( "Testing Template::Piccolo $Template::Piccolo::VERSION, Perl $], $^X" );
