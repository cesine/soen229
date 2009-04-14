#!/usr/bin/perl
#
#$status = system("wget -q -O - http://www.google.ca | perl TextAnalyser.pl");
#
#open PIPEIN, "ls -al |";
open PIPEIN, "w

while($line = <PIPEIN>){
	print $line;
}

close(PIPEIN);

open PIPEOUT, "| cat";
print PIPEOUT "This will write to the cat command's STDIN";
close PIPEOUT;

