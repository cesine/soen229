#!/usr/bin/perl -w
#http://www.tutorialspoint.com/perl/perl_lstat.htm
$filename = "test.txt";
($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
    $atime,$mtime,$ctime,$blksize,$blocks)
                = lstat($filename);
printf "File is %s,\n size is %s,\n permissions are decoded here %04o, here it is undecoded %s, mtime %s\n",
$filename, $size, $mode & 07777, $mode,
scalar localtime $mtime;
