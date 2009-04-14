Assignment 1 : MS-DOS command line interpreter
Course : SOEN229 System Software

Description : Simulates a MS-DOS command prompt in LINUX environment
Language : PERL


1. STARTING THE PROGRAM
===========================================================

Please start the program by typing the following in the linux command shell
while being in the directory where the program was extracted "

./msdos.pl

A welcome message and command prompt indicating current directory should
appear.


2. COMMANDS
===========================================================

The following is a list of commands that can be used in the MS-DOS command
line interpreter. All commands are NOT case sensitive.


	2.1 CLS : CLEAR SCREEN=============================

	Description : Clears the screen.
	
	Script called : cls.pl
	
	Execution : Type "CLS" then press enter.



	2.2 DIR : DISPLAY DIRECTORY========================

	Description : Display the content of the current working directory.
		      Also indicates the files' creation date and size.

	Script called : dir.pl
	
	Execution : Type "DIR" then press enter.



	2.3 TYPE : DISPLAY FILE CONTENT===================

	Description : Displays the whole content of a file or multiple files
		      on screen one after the other.

	Script called : type.pl

	Execution : Type "DIR [FILE1] [FILE2] [FILE3] ...." then press ENTER.
		    Replace [FILE1] [FILE2]..... by actual filenames in 
		    directory. Extensions must be included.

		    Example : type text1.txt dude.txt


	2.4 FIND : FIND CONTENT IN FILE==================

	Description : Finds a sequence of characters in a file and displays
		      the line on screen that contains that sequence.

	Script called : find.pl

	Execution : Type "FIND [STRING] [FILENAME]" the press ENTER.
		    [STRING] : Sequence of characters to find.
		    [FILENAME] : File to look for sequence.

		    Example : find ABC text1.txt

	
	2.5 EXIT : EXIT PROGRAM=========================

	Description : Terminates MS-DOS command line interpreter and returns
		      to LINUX shell.
	
	Script called : None. Interpreted directly by msdos.pl

	Execution : Type "EXIT" and press ENTER.



3. NOTES================================================

- type.pl and find.pl both support piping if used with the linux command
  shell. However, this feature is currently not supported by the MS-DOS 
  command line interpreter.



4. END COMMENTS=========================================

Thank you for using MS-DOS command prompt simulator.
Have a nice day =)



