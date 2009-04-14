#! /usr/bin/perl
#
#This script takes an html file from any phpbbb forum and outputs a plain text file with just the Author and Content information
#

$authorIndicator = '<p class="author">';
$contentIndicator = '<div class="content">';
$contentEnd ='</div>';


# use STDIN for the file handle in the file, this will alow us to use
# the pipe if no file name is specified, or to pretend that the file name is 
# STDIN if it is specified
if ($ARGV[0]) {
	$filename = $ARGV[0]; # the second argument will be the file name
	open("STDIN", "<".$filename);
}

while($line=<STDIN>){ 	#STDIN comes from either a pipe, the user, or a file
	# a pattern match using the pattern binding operator, =~
	$content="";				#reset the content 
	#print "In the outer loop\n";
	#trim leading white space http://www.perlmonks.org/?node_id=2258
	$line =~s/^\s+//;
	if($line =~ /$authorIndicator/) { 	# if $string contains `a substring'
		#http://www.comp.leeds.ac.uk/Perl/split.html
		@line = split(/<[^>]*>/, $line); 	#split on HTML tags,
							#thus deleting tags
		#http://www.tizag.com/perlT/perlarrays.php
		print "<AUTHOR>";
		print "@line";

	}#endif for author
	elsif($line =~/$contentIndicator/) {
		
		#chomp $line;
		$content = $line;
		#if you dont have the end of the content get more lines
		if(!($content =~/$contentEnd/)){
			while($line=<STDIN>){
				$content = "$content$line";
                        	#print "In inner loop\n";
				#until you find a </div>
				if($content =~ /$contentEnd/){
					#print "Found the end of the content.";
					last;	#http://www.expressnewsindia.com/site/katni/CGI%20Programming%20101%20Chapter%205%20Advanced%20Forms%20and%20Perl%20Control%20Structures.htm	
				}#end if to check for end of content
			}#end while to add more lines to content once found
		}#end if to see if the content has the end in it
		#clean up the content
		@content = split(/<[^>]*>/,$content);
		print "<CONTENT> ";
		print (@content);
	}#endif for content
}#end while
print "\n";
