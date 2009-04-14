#!/usr/bin/perl -w
#
use strict;

use Getopt::Std;

my %options = ();
getopts("il", \%options);


my @allFiles = glob("*");  	#glob gets the name of all files in the present directory
for (my $i=0; $i<@allFiles; $i++) {
	print $allFiles[$i]."\n";
}
print "\n";

#####################################################
#



sub longList(){


my $filename = "listdirectory.pl";
my ($dev, $ino, $mode, $nlink, $uid1, $gid1,
  $rdev, $size, $atime, $mtime, $ctime, $blksize, $blocks) = lstat($filename);

my ($username, $passwd1, $uid, $groupid) = getpwuid($uid1);


print "The owner of the file is: ".$username."\n";

my ($groupname, $passwd, $gid, $members) = getpwuid($gid1);
print "The file belongs to the group: ".$groupname."\n";

my $mod_date = localtime($mtime);
print $mod_date."\n";

my ( $sec, $min, $hour, $mday, $month, $year, $wday, $yday, $isdst ) = localtime($mtime);
}
