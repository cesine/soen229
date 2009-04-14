#!/usr/bin/perl
#
#
%wordCount;

#while loop to build word hash
while($line = <STDIN>) {
	chomp($line); 		#chomp eats the \n
	&countWords($line); #use $line as an argument for the subroutine
	
}

#for loop to print all words in the hash
print "\n";
foreach $key( keys %wordCount){
	print "$key => $wordCount{$key}\n";
}#end foreach 


sub countWords() {	
	my $line = $_[0]; 	
	my @line_words = split (/\W/, $line);
	foreach my $word (@line_words) {
		if ($wordCount{$word}) {
			$wordCount{$word}++;
		}
		else {
			$wordCount{$word} =1;
		}
	}#end for
}
