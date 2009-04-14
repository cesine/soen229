#!/usr/bin/perl 
#alarm=60;
#
print "Content-type: text/html\n\n";

print "<html>";

print "This uses either GET or POST or the command line to upload a file.</p>\n ";


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

print $datastring;

print "\n</html>\n";
