#! /usr/bin/perl
# MS-DOS Command prompt interface simulator for Linux
# Note : Although individual command scripts supports piping, 
# 	 This command line interpreter does not.

$version = "v1.0";



#STARTING SCREEN============================================================
system(clear);	#Clear screen
print "MS-DOS Command prompt simulator $version\n";


#COMMAND PROMPT SIMULATION==================================================

use Cwd;  #import Perl 'Current Working Directory' libraries;
$exit = 0; #Initialize exit value.


while ($exit != 1){
#displays current directory and waits for command to be entered
	
	&disp_Dir();	#Call display directory subroutine
	$doscmdstr = lc <>;   #User input command, converts to lowercase letters
	@doscmd = split(" ", $doscmdstr); #Splits user command into an array

	#DIR COMMAND-------------------------------------------------------
	if ($doscmd[0] eq "dir") {
		system("/usr/bin/perl dir.pl");
	}
	
	#CLS COMMAND-------------------------------------------------------
	elsif ($doscmd[0] eq "cls"){
		system("/usr/bin/perl cls.pl");
	}
	
	#TYPE COMMAND------------------------------------------------------
        elsif ($doscmd[0] eq "find"){
		$param = &para_cat(@doscmd);
                system("/usr/bin/perl find.pl$param");
        }
	
	#FIND COMMAND------------------------------------------------------
        elsif ($doscmd[0] eq "type"){
		$param = &para_cat(@doscmd);
                system("/usr/bin/perl type.pl$param");
        }
	
	#EXIT COMMAND------------------------------------------------------
	elsif ($doscmd[0] eq "exit"){
		print "Thank you for using MS-DOS prompt simulator $version\n";
		print "Exiting.\n\n";
		$exit = 1;
	}
	
	#UNRECOGNIZED COMMANDS---------------------------------------------
	else {
		print "\'$doscmd[0]\' is not a recognized command. \n\n";
	}

}

exit();#Properly exit perl program


#SUBROUTINES================================================================

sub para_cat(){ #Parameter concatenation. Concatenates strings in an array.
	$parastring = ""; #Initialize strting to return

	for ($i = 1 ; $i < @_; $i++){
		$parastring = $parastring . " " . $_[$i];
	}	#Add every element of the array to parastring seperates

	return $parastring;

}




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
