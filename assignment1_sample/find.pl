#! /usr/bin/perl
#FIND command to be used with MS-DOS simulator
#FIND a particular string in a file

$substring = $ARGV[0]; #Save substring to search for in file

if( $ARGV[1]){ #test if file exists
	open("STDIN", "<".$ARGV[1]); #Open file
}
	while($line = <STDIN>){		   #Search each line and display 
		if($line =~ /$substring/){ #line if contains the substring
		print $line;
		}
	}

#else {	#Return error if file does not exist.
#	$filename = $ARGV[1];
#	print "$filename does not exist in current directory.\n";
#}


print "\n";

