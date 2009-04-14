#!/usr/bin/perl -w
#
use strict;

my @allFiles = glob("*");  	#glob gets the name of all files in the present directory
for (my $i=0; $i<@allFiles; $i++) {
	print $allFiles[$i]."\n";
}
print "\n";
