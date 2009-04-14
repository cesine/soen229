#!/usr/bin/perl -w
use strict;
my $stdin;
my $request;


####### print some stuff so that the page will appear
        print "HTTP/1.0 200 OK\n";
        print "Content-Type: text/plain\n";

######## loop to read the request into a variable and print it out
	do {
		$stdin = <STDIN>;
		$request .= $stdin;
	} while ($stdin =~ /\S/);

	print "This line wont appear $request \n";
	print "Print the HTTP request in the browser \n$request \n";

