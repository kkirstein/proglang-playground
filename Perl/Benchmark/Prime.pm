# Prime.pm module to perform prime decomposition
# 
#
# vim: ft=perl sw=4 ts=4
#

package Prime;
require Exporter;
@ISA = qw( Exporter );
@EXPORT_OK = qw( primedecomp );

#use v5.16;
use strict;
use warnings;

# perform prime decomposition
sub primedecomp {
	my $n = shift;
	my $remain = $n;
	my @result;
	for (my $i=2; $i<sqrt($n); $i++) {
		if( $remain % $i == 0 ) {
			push @result, $i;
			$remain /= $i;
		}
	}

	return @result;
}


1;

