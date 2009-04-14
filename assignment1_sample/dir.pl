#! /usr/bin/perl
#Directory listing command for MS-DOS command prompt simulator

use File::stat;		#Needed to display time
use Time::localtime;	#Needed to display time
use Cwd;		#Use Current Working directory library

$totalsize = 0;
@allFiles = glob("*");


#======================================================================
#This section displays information to mimick MS-DOS dir
#Information is totally arbitrary and does not reflect current system
print "\n";
print " Volume in drive C is MS-DOSIM\n";
print " Volume Serial Number is 0000-0000\n";
print " Directory of ";
&disp_Dir();
print "\n\n";

print ctime(localtime)."  \t.\n";
print ctime(localtime)."  \t..\n";


#DISPLAY DIRECTORIES====================================================

for($i=0; $i<@allFiles; $i++){	#For all files in current directory
	$file = @allFiles[$i];			#import file
	$filesize = -s $file;			#get file size
	$totalsize = $totalsize + $filesize;  	#add filesize to total file size
	print ctime(stat($file)->mtime)."  ".$filesize."\t".$file."\n";
}	#Print line with creation Date, fize size and file name


print "              Total size  $totalsize bytes";

print "\n\n";	




#SUBROUTINES=============================================================


sub disp_Dir() { #displays current directory path... DOS style /w backslash =)
	$cur_dir = cwd();			
	@cur_dir = split("/", $cur_dir);	#remove slash
	
	print "C:";				#Sim. printed drive reference
	
	
	foreach my $dir_bit (@cur_dir) {	#print directory with backslash
		
		if ($dir_bit eq ''){		#This condition test is needed
			print $dir_bit;		#in order to properly display
		}				#directories without displaying
		else{				#two backslashes in a row when
			print "\\";		#an array item has a empty 
			print $dir_bit;		#string.(i.e. $cur_dir[0])
		}
	}
	print '>';
}	
