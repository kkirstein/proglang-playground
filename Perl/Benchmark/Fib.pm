# Fib.pm module to define different implementations 
# for Fibonacci series
#
# vim: ft=perl sw=4 ts=4
#

package Fib;
require Exporter;
@ISA = qw( Exporter );
@EXPORT_OK = qw( fibIter fibRec );

use v5.16;
use strict;
use warnings;

# iterative version
sub fibIter {
    my $n = shift;
    if ($n < 2) {
        return $n;
    }
    my $fibPrev = 1;
    my $fib = 1;
    for (2..$n-1) {
        ($fibPrev, $fib) = ($fib, $fib + $fibPrev);
    }
    return $fib;
}

# recursive version
sub fibRec {
    my $n = shift;
    return $n <= 2 ? 1 : __SUB__->($n-1) + __SUB__->($n-2);
}

1;
