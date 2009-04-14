#!/usr/bin/perl -w
#
#This is a very patchy server script
#Cesine
#Soen 229
#Sample Solution Programming Project
#
#
#Style: http://perldoc.perl.org/perlstyle.html
#v1.0


use strict;
require "process_http_request.pl";
##Global variables
my $stdin;
my $request;
$ENV{'DOCUMENT_ROOT'} = '/www/home/v/v_cook/teaching/soen229/assignment3/solution';

############# Main ##################

my $log_filename = "log.txt";
#http://perldoc.perl.org/functions/open.html
open (LOGFILE, ">> $log_filename") or die "Can't open $log_filename :$!";

#&process_http_request::print_response_header();

$request = &process_http_request::take_in_request_header();

&process_http_request::http_request_into_hash($request);

&process_http_request::print_response_header();

&process_http_request::open_file_requested();

&process_http_request::print_to_log();


close LOGFILE;
