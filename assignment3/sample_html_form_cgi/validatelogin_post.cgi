#!/usr/bin/perl 
#
print "Content-type: text/html\n\n";

print "<html>";

print "This uses POST to validate the info that was entered on the login_post.html page.<br />\n ";


#Normal webservers put things into the ENV hash automatically, you can uncomment this and print the ENV to see what Apache put in there for us. This is why we asked you to put things into ENV in your server script.
#print "The ENV contents\n";
my $key;
foreach $key( keys %ENV){
	# print "$key => $ENV{$key}<br />\n";
}#end foreach 
my $querystring;
read(STDIN, $querystring,$ENV{'CONTENT_LENGTH'});
($user, $pass) = split (/&/, $querystring , 2);
($junk, $user) = split(/=/, $user, 2);
($junk, $pass) = split(/=/, $pass , 2); 

print "This is the username entered $user <br />\n";

print "This is the password entered $pass <br />\n";
$filename="passwd.txt";
open("IN","<".$filename);

$found = 0;
while($line = <IN>){
	#print $line;
	@info = split(/\W/,$line);
	#print "Here is the user @info[0]";
	if ($user eq @info[0]){
		$found = 1;
		if ($pass eq @info[1]) {
			print "Login successful";
		}else{ 
			print "User valid, but password does not match.";
		}#end if for valid user
		last;
	}#end if for valid user
	
}#end while for input file loop

if ($found != 1){
	print "I looked in the passwd.txt file and the user was not found.";
}

print "</html>"
