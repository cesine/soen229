#!/usr/bin/perl 
# if you want all output ot go though a pager like less or more



$pager = $ENV{PAGER} || 'usr/bin/less'; 	#XXX; might not exist
open(STDOUT), "| $pager");
