#http://leguen.ca/soen229/tutorials/view/building-larger-scripts
package arrays;

sub printArr() {
	if(ref($_[0]) ne "ARRAY") {
		die("Array reference expected.");
	}
	foreach $element (@{$_[0]}) {
		print $element." ";
	}
	print "\n";
}

sub flip() {
	if(ref($_[0]) ne "ARRAY") {
		die("Array reference expected.");
	}
	return reverse @{$_[0]};
}

sub contains() {
	if(ref($_[0]) ne "ARRAY") {
		die("Array reference expected.");
	}
	foreach $element (@{$_[0]}) {
		if($_[0]==$_[1] || $_[0] eq $_[1]) {
			return true;
		}
	}
	return false;
}

1;	# so you can use it successfully with the 
	# .require. keyword, a script must
	# end with with a statement which
	# evaluates to true.
	# I don.t make the rules.
