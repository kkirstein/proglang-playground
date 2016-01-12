#! /usr/bin/perl
#
# vim: ft=perl sw=4 ts=4

use strict;
use warnings;
use Benchmark qw( :hireswallclock );
#use Time::HiRes qw(time);

use Fib qw( fibIter fibRec );
use PerfectNumber qw( perfectnumbers );
use Prime qw( primedecomp );
use Mandelbrot qw( plot_bw plot_rgb );

# benchmark Fibonacci series
# ==========================
our $val1 = 35;
our $val2 = 1000;
our ($res1, $res2, $res3);
print "Fibonacci series:\n";
timethis( 3, '$res1 = fibRec($val1)', "fibRec($val1)" );
timethese( 0, {
	"fibIter($val1)" => '$res2 = fibIter($val1)',
	"fibIter($val2)" => '$res3 = fibIter($val2)' });

print "\n";
print "fibRec($val1) = $res1" . "\n";
print "fibIter($val1) = $res2" . "\n";
print "fibIter($val2) = $res3" . "\n";
print "\n-----------------------------\n\n";

# benchmark perfect numbers
# =========================
our $limit = 10000;
our @pn;
print "Perfect numbers:\n";
timethis( 5, '@pn = perfectnumbers($limit)', "perfectnumbers($limit)" );

print "\n";
print "perfectnumbers($limit) = (" . join( ", ", @pn ) . ")\n";
print "\n-----------------------------\n\n";

# benchmark prime decomposition
# =============================
our $in = 111_111_111_111;
our @primes;
print "Prime decomposition:\n";
timethis( 0, '@primes = primedecomp($in)', "primedecomp($in)" );

print "\n";
print "primedecomp($in) = (" . join( ", ", @primes ) . ")\n";
print "\n-----------------------------\n\n";

# benchmark Mandelbrot set
# ========================
our $outfile = "mandelbrot.pgm";
our $outfile2 = "mandelbrot_rgb.pgm";
print "Calculate Mandelbrot set:\n";
#timethis( 1, 'plot_bw( $outfile, 180, 120, -0.5, 0.0, 4.0/180)', "plot( 180, 120)" );
#timethis( 1, 'plot_rgb( $outfile2, 180, 120, -0.5, 0.0, 4.0/180)', "plot_rgb( 180, 120)" );
#timethis( 1, 'plot_rgb( $outfile2, 640, 480, -0.5, 0.0, 4.0/640)', "plot_rgb( 640, 480)" );
timethese( 0, {
		"plot_bw(180, 120) " => 'plot_bw( $outfile, 180, 120, -0.5, 0.0, 4.0/180)', 
		"plot_rgb(180, 120)" => 'plot_rgb( $outfile2, 180, 120, -0.5, 0.0, 4.0/180)',
		"plot_rgb(640, 480)" => 'plot_rgb( $outfile2, 640, 480, -0.5, 0.0, 4.0/640)' });

print "\n-----------------------------\n\n";

