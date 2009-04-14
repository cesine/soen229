#!/usr/bin/perl -w
#
use strict;

use Getopt::Std;

my %options = ();
getopts("asdf", \%options);	#this script will accept options -a -s -d -f

foreach my $key (keys %options) {
	print $key." => ".$options{$key}."\n";
}

