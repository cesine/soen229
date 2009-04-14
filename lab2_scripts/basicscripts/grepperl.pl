#!/usr/bin/perl
#
#This is a quick and dirty cat script in perl
#
#$myFilename = "myFile.txt";
$myFilename = $ARGV[1];

$substring = $ARGV[0];

open("INPUTFILE", "<".$myFilename);

while($line = <INPUTFILE>)
{
	if($line =~ $substring){
		print $line;
	}#end if
}#end while


