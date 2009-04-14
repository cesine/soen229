#!/usr/bin/perl
#

#you can add a pipe to open()
$pid = open(README, "program arguments |") or die "Couldn't fork: $!\n";
while (<README>){
	print "in the readme";
}
close(README)				or die "Couldn't close: $!\n";

$pid = open(WRITEME,"|program arguments") or die "Couldn't fork: $!\n";
print WRITEME "data\n";
close(WRITEME)				or die "Couldn't close: $!\n";
