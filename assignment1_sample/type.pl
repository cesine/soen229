#! /usr/bin/perl
#TYPE command for MS-DOS prompt simulator
#Displays the content of a file on screen.
#Piping supported.


foreach $filename (@ARGV){
	

	if (-e $filename){	#If file exists, display text
		open("STDIN", "<".$filename); #Opens file
		while($line = <STDIN>){
			print $line;
		}
	}
	else{			#If file does not exist, return error msg.
		print "$filename not found in current directory.\n";
	}


}
print "\n";

