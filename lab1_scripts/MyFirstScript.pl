#! /usr/bin/perl
## My first Perl program; Hello World
print "What is your name? ";
$name = <STDIN>;
chomp($name); 			#the comp function removes the new line char
				#from the end of a string, if its there.
print "Hello ".$name."!\n"; 	#This line will generate output on the screen.
