#! /usr/bin/perl
# This script opens a file and cats the contents to the screen
#
# $filename = "myFile.txt";
$filename = $ARGV[0];
open("IN", "<".$filename); 	# IN is the filehandle refering to $filename
				#< indicates opening with readonly access
				
# while to go through the file and print it line by line
# assignment returns false when it doesnt work, so the while will stop 
# when the assignment of reading from <IN> doesnt work
while($line = <IN>) {
	print $line;
}
print "\n";


