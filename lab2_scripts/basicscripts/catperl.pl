#!/usr/bin/perl
#
#This is a quick and dirty cat script in perl
#
#$myFilename = "myFile.txt";
$myFilename = $ARGV[0];

open("INPUTFILE", "<".$myFilename);

while($line = <INPUTFILE>)
{
	print $line;
}


