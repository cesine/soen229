#!/usr/bin/perl
#
%wordCount;
%palindromes;

while($line = <STDIN>){
	chomp $line;
	&countWords($line);
	&findPalindromes($line);
	#countWords("we called a sub routine");
	#countWords("we","called","a","subroutine again");

	#@in = split(/\W/, $line);
}
print "Print the Hash of words:\n";
foreach $key (keys %wordCount) {
	print "$key => $wordCount{$key}\n";
}

print "\n These words are palindromes:\n";
foreach $key(keys %palindromes){
	print "\t$key\n";
}

sub countWords() {
	#print "We called a subroutine!\n";
	#print all the arguments that were passed to the subroutine
	#for ($i=0; $i<@_; $i++){
	#	print $_[$i]." ";
	#}
	my $line = $_[0];	
	my @line_words = split (/\W/, $line);
	foreach my $word (@line_words) {
		if ($wordCount{$word}) {
			$wordCount {$word}++;
		}
		else {
			$wordCount{$word} = 1;
		}
	}#end for loop
} #end sub coutnwords

sub findPalindromes(){
	my $line = $_[0];
	my @line_words = split(/\w/,$line);
	foreach my $word (@line_words) {
		if(&is_a_palindrome($word)) {
			$palindromes{$word} = 1;
		}
	}#end for loop
}#end findpalindromes

sub is_a_palindrome() {
	my $word = $_[0];
	for (my $n=0; $n<length($word)/2; $n++){
		if (substr($word, $n, 1) ne substr($word, -($n+1),1)) {
			return false;
		}
	}#end for
	return true;
}#end is a palindrome
	


