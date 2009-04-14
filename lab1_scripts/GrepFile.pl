#! /usr/bin/perl

$substring = $ARGV[0]; # the first argument will be the string to match

# use STDIN for the file handle in the file, this will alow us to use
# the pipe if no file name is specified, or to pretend that the file name is 
# STDIN if it is specified
if ($ARGV[1]) {
	$filename = $ARGV[1]; # the second argument will be the file name
	open("STDIN", "<".$filename);
}

while($line=<STDIN>){ 	#STDIN comes from either a pipe, the user, or a file
	# a pattern match using the pattern binding operator, =~
	if($line =~ /$substring/) { 	# if $string contains `a substring'
		print $line;
	}#endif for positive pattern match
}#end while
print "\n";
