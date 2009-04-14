#!/usr/bin/perl

require "arrays.pl"; 
@arr = ("a", "b", "c");
&arrays::printArr(\@arr);

@arr = ("Hello", "World");
&arrays::printArr(\@arr);
