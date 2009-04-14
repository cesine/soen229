#! /usr/bin/perl
#This is a script which demonstrates an array
#
@words = ('Hello', 'World', 'from', 'Perl');

#indexed for loop which prints the array contents
for ($i=0; $i<@words; $i++) {
	print $words[$i]." ";
}
print "\n";

#foreach loop which prints the array contents
foreach $word (@words) {
	print $word." ";
}
print "\n";

@plFiles = glob("*.pl"); 	# generates a list of files ending in .pl
@aFiles = glob("a*"); 		# generates a list of files that start with a
@dotFiles = glob("*.*"); 	# generates a list of files with a dot in name

# prints all files in the directory
@allFiles = glob("*");          # generates a list of all files in directory
print "Here is a list of all files in this directory:\n";
for($i=0; $i<@allFiles; $i++) {
	print $allFiles[$i]."\n";
}
print "\n";
