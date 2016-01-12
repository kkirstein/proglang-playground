# PerfectNumber.pm module to define different implementations 
# for find perfect numbers
#
# vim: ft=perl sw=4 ts=4
#

package PerfectNumber;
require Exporter;
@ISA = qw( Exporter );
@EXPORT_OK = qw( isperfect perfectnumbers );

use v5.16;
use strict;
use warnings;

# check for perfect number
sub isperfect {
	my $n = shift;
	my $sum = 0;
	for (my $i=1; $i<$n; $i++) {
		if ($n % $i == 0) { $sum += $i; }
	}

	return ($sum == $n);
}

# alternative recursive implementation
##sub isperfect_rec {
##	my $n = shift;
##	my $loop = sub {
##		my ($i, $sum) = @_;
##		if ($n % $i == 0) { __SUB__->($i+1, $sum+$i); }
##		elsif ($i == $n) { return ($sum == $n); }
##	   	else { __SUB__->($i+1, $sum); }
##	}
##
##	#return &$loop(1, 0);
##}

# collect perfect numbers until given limit
sub perfectnumbers {
	my $n = shift;
	my @perfect = ();

	for (my $i=1; $i<$n; $i++) {
		if( isperfect($i) ) { push @perfect, $i; }
	}

	return @perfect;
}

##sub perfectnumbers_rec {
##	my $n = shift;
##	my @perfect = ();
##
##	for (my $i=1; $i<$n; $i++) {
##		if( isperfect_rec($i) ) { push @perfect, $i; }
##	}
##
##	return @perfect;
##}

1;

