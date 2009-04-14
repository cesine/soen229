#!/usr/bin/perl
#This script demonstrates Getopt to process arguments sent in using a - and how to print usage and/or help nformation if the user doesnt call the program correctly

################ use these Perl modules #########################################
use strict;
use Getopt::Std;

################## Subroutine to print help/usage ##############################
# The usage message is usally 1 line long and reminds the user
# how to call the script.
# The help message is more detailed and explains what each command does.
# For a small script you can provide a help as your usage message.
################################################################### 
sub printUsage(){
        print "Usage: ./usageExample.pl  [OPTION]... PATTERN [FILE]...\n";
        print "Options:\n";
        print "\t\t-h\t Print this help message\n";
        print "\t\t-C\t (Does something)\n";
        print "\t\t-N\t (Does something)\n";
        print "\t\t-P\t (Does something)\n";
	exit;
}#end sub to print usage/help

################ process the options ############################################
my %options = ();
getopts("hCNP", \%options); 	# This script will accept -h -C -N -P  options
				# Any other option will get an "Unknown option"
				# message and the option will be discarded
if ( $options{"h"} ){
	&printUsage();
}#end if to test for the help/usage option was called by the user

################### process the arguments #######################################
if (!$ARGV[0]){
	print "\nPlease provide a substring to search for.\n";
	&printUsage();
}#end if to check for a substring argument
my $substring = $ARGV[0];	# search input for the first command line arguemnt
if($ARGV[1]) { 			# If there is a second argument use the STDIN
	open("STDIN", "<".$ARGV[1]);	# file handle too, overloading the STDIN
}

##################### Main #####################################################
# If the user provided a filename it will go through the file, if the user piped text in it will go to the end of the piped input. If the user just called the script, with no filename and no piped input it will sit and wait, and process only lines that the user enters. 
while(my $line = <STDIN>) {	
	if($line =~ /$substring/) {
		print $line;
	}
}
