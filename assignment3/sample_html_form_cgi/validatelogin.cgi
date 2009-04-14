#!/usr/bin/perl 
#alarm=60;
#
print "Content-type: text/html\n\n";

print "<html>";

print "This uses either GET or POST to validate the info that was entered on the login.html page.<br /> You can also use this script at the command line.</p>\n ";



#print "The ENV contents\n";
my $key;
foreach $key( keys %ENV){
	#print "$key => $ENV{$key}\n";
}#end foreach 

#Script can handle either get or post, or even command line input
#For more info: http://www.cknuckles.com/webapps/downloads/PowerPoint/chap06.ppt
my $datastring;
if ($ENV{"REQUEST_METHOD"} eq "POST") {
  read(STDIN, $datastring, $ENV{"CONTENT_LENGTH"});	
}
elsif (exists $ENV{"REQUEST_METHOD"}) {
  $datastring = $ENV{"QUERY_STRING"};
}
else {
  print "Offline execution detected\n";
  print "Please enter some data. This is the equvalent to a Query-String in a browser.\n";
  $datastring = <>; chomp $datastring;
}


($user, $pass) = split (/&/, $datastring , 2);
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
