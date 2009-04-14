#!/usr/bin/perl
# My first Perl; Hello World
$name = "me myself";
print "Hell-O " .$name ."texst\n";#ok
@allFiles = glob("*");
for($i=0; $i<@allFiles; $i++) {
	print $allFiles[$1]."\n";
}
print "Fin\n";
#
#second script Cat file opener (grep)
$filename = $ARGV[0];
open("IN","<".$filename);
while ($line = <IN>) {
	if($line =~ /Hell/) {
		print $line;
	}
	else {
	print "Better chance next time\n";
	}
}
print "fin2\n";
#fin 2e script
#
