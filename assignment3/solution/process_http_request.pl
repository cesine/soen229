package process_http_request;

use strict;
my $stdin;
my $request;

my $debug = "debug.txt";

open (DEBUG, ">$debug") or die "Can't open $debug : $!";

sub take_in_request_header(){
	do {
		$stdin = <STDIN>;
		$request .= $stdin;
	
	} while ($stdin =~ /\S/);

	print DEBUG "This line doesnt show $request\n";
	return $request;
	#print "Print the HTTP request in the browser \n$request \n";
}


sub  print_response_header() {
	print "HTTP/1.0 200 OK\n";
	if ($ENV{'CONTENT_TYPE}'} eq 'html'){
		print "Content-Type: html\n";
	}else{
		print "Content-Type: text/plain\n";
	}
	print  "Hello";
}


sub open_file_requested(){
	print DEBUG "In the file requested section";
	my $filepath = $ENV{'DOCUMENT_ROOT'}.$ENV{'FILE_REQUESTED'};	
	print DEBUG "I will try to open this file $filepath";
	#http://leguen.ca/soen229/tutorials/view/misc
	if (-r $filepath) {
		print DEBUG "Sucess\n\n";
		exec("cat $filepath");
	}else{
		print DEBUG "File Not Found : $filepath";
	}
system(cat $filepath);
}

# This prints a hash, just send the reference to the hash in a scalar ie
#  my $reference = \%somehash;
sub print_hash(){
	# using pass by reference http://perldoc.perl.org/perlreftut.html
	print DEBUG "In the print hash subroutine\n";
	my $argument = $_[0];
	my %hash = %{$argument};
	for my $key ( keys %hash ) {
        	my $value = $hash{$key};
	        print "$key => $value\n";
    	}
	print "\n";
}

sub print_to_log(){
	#http://www.netadmintools.com/art212.html
	my ($sec,$min,$hour,$mday,$mon,$year,$wday, $yday, $isdst)=localtime(time);
	printf LOGFILE "%4d-%02d-%02d %02d:%02d:%02d\n",$year+1900,$mon+1,$mday,$hour,$min,$sec;


}
sub content_type(){
	my @document = split(/\./,$ENV{'FILE_REQUESTED'});
	my $content_type = pop(@document);
	print DEBUG "This is the content type  found $content_type";	
	$ENV{'CONTEXT_TYPE'} = $content_type;
}

sub http_request_into_hash(){
	my $key;
	my $value;
	my @line;
	my %env_hash;
	
	print DEBUG "In the insert into ENV hash subroutine \n";
	print DEBUG "I will insert this \n@_";
	my @http_request_lines = split (/\n/,$_[0]);
	
	#Get rid of extra line at the end of the request
	my $garbage =pop(@http_request_lines);	
	#print "This will be thrown out $garbage ends here\n\n";

	#process the first line of the http request header
	my $request_method = shift(@http_request_lines);
	#print "this is the request method line $request_method";	
	my @request_method = split (/ /, $request_method);
	if ($request_method[0] =~ /^GET/) {
		$env_hash{'REQUEST_METHOD'} = 'GET';
	}elsif ($request_method[0] =~ /^POST/){
		$env_hash{'REQUEST_METHOD'} = 'POST';
	}else {
                $env_hash{'REQUEST_METHOD'} = 'Unknown';
	}
        my @query_string = split (/\?/,$request_method[1]);
	$env_hash{'FILE_REQUESTED'}  = $query_string[0];
	$env_hash{'QUERY_STRING'} = $query_string[1];
	
	my @url_variables = split(/&/,$query_string[1]);
	foreach (@url_variables){
		my @holder = split (/=/,$_);
		uc($holder[0]);
		my $user_key = "HTTP_".$holder[0];
		$env_hash{$user_key} = $holder[1];
	}#end each for user variables
	foreach (@http_request_lines){
		#split the request line into two sections using the : if there are extra : this could make a mistake
		$key ="";
		$value="";
		@line = split (/: /,$_);
		
		#if the first section starts with host
		if($line[0] =~ /^Host/){
			$key = "SERVER_NAME";
		}else{ 
		#for all other variables in the HTTP request
			$key = uc($line[0]);
			$_ =$key;	#put the key into $_
			s/-/_/g ;	#replace the - with _ in the $_ var
			$key = "HTTP_".$_; 	#add HTTP_ to the front
		}
		$value = $line[1];
		$env_hash{$key} = $value;
	}#end for each to go through http request lines
  	&print_hash(\%env_hash);
	%ENV = (%ENV, %env_hash);

	#extract the context type from the information in the Env hash
	&content_type();

}

1;
