# Mandelbrot.pm module to calculate Mandelbrot set
# 
#
# vim: ft=perl sw=4 ts=4
#

package Mandelbrot;
require Exporter;
@ISA = qw( Exporter );
@EXPORT_OK = qw( plot_bw plot_rgb  coord);

use strict;
use warnings;

#use PDL;

#use Math::Complex;

# global vars (constant)
#our $width = 4.0;
our $nmax = 100;
our $rmax = 2.0;
our $colormax = 255;
my @colormap = (
	"0 0 0", "0 0 252", "64 0 252", "124 0 252", "188 0 252",
  	"252 0 252", "252 0 188", "252 0 124", "252 0 64", "252 0 0",
   	"252 64 0", "252 124 0", "252 188 0", "252 252 0", "188 252 0",
   	"124 252 0", "64 252 0", "0 252 0", "0 252 64", "0 252 124",
   	"0 252 188", "0 252 252", "0 188 252", "0 124 252", "0 64 252",
   	"124 124 252", "156 124 252", "188 124 252", "220 124 252", "252 124 252",
   	"252 124 220", "252 124 188", "252 124 156", "252 124 124", "252 156 124",
   	"252 188 124", "252 220 124", "252 252 124", "220 252 124", "188 252 124",
   	"156 252 124", "124 252 124", "124 252 156", "124 252 188", "124 252 220",
   	"124 252 252", "124 220 252", "124 188 252", "124 156 252", "180 180 252",
   	"196 180 252", "216 180 252", "232 180 252", "252 180 252", "252 180 232",
   	"252 180 216", "252 180 196", "252 180 180", "252 196 180", "252 216 180",
   	"252 232 180", "252 252 180", "232 252 180", "216 252 180", "196 252 180",
   	"180 252 180", "180 252 196", "180 252 216", "180 252 232", "180 252 252",
   	"180 232 252", "180 216 252", "180 196 252", "0 0 112", "28 0 112",
   	"56 0 112", "84 0 112", "112 0 112", "112 0 84", "112 0 56",
   	"112 0 28", "112 0 0", "112 28 0", "112 56 0", "112 84 0",
   	"112 112 0", "84 112 0", "56 112 0", "28 112 0", "0 112 0",
   	"0 112 28", "0 112 56", "0 112 84", "0 112 112", "0 84 112",
   	"0 56 112", "0 28 112", "56 56 112", "68 56 112", "84 56 112",
   	"96 56 112", "112 56 112", "112 56 96", "112 56 84", "112 56 68",
   	"112 56 56", "112 68 56", "112 84 56", "112 96 56", "112 112 56",
   	"96 112 56", "84 112 56", "68 112 56", "56 112 56", "56 112 68",
   	"56 112 84", "56 112 96", "56 112 112", "56 96 112", "56 84 112",
   	"56 68 112", "80 80 112", "88 80 112", "96 80 112", "104 80 112",
   	"112 80 112", "112 80 104", "112 80 96", "112 80 88", "112 80 80",
   	"112 88 80", "112 96 80", "112 104 80", "112 112 80", "104 112 80",
   	"96 112 80", "88 112 80", "80 112 80", "80 112 88", "80 112 96",
   	"80 112 104", "80 112 112", "80 104 112", "80 96 112", "80 88 112",
   	"0 0 64", "16 0 64", "32 0 64", "48 0 64", "64 0 64", "64 0 48",
   	"64 0 32", "64 0 16", "64 0 0", "64 16 0", "64 32 0", "64 48 0",
   	"64 64 0", "48 64 0", "32 64 0", "16 64 0", "0 64 0", "0 64 16",
   	"0 64 32", "0 64 48", "0 64 64", "0 48 64", "0 32 64", "0 16 64",
   	"32 32 64", "40 32 64", "48 32 64", "56 32 64", "64 32 64",
   	"64 32 56", "64 32 48", "64 32 40", "64 32 32", "64 40 32",
   	"64 48 32", "64 56 32", "64 64 32", "56 64 32", "48 64 32",
   	"40 64 32", "32 64 32", "32 64 40", "32 64 48", "32 64 56",
   	"32 64 64", "32 56 64", "32 48 64", "32 40 64", "44 44 64",
   	"48 44 64", "52 44 64", "60 44 64", "64 44 64", "64 44 60",
   	"64 44 52", "64 44 48", "64 44 44", "64 48 44", "64 52 44",
   	"64 60 44", "64 64 44", "60 64 44", "52 64 44", "48 64 44",
   	"44 64 44", "44 64 48", "44 64 52", "44 64 60", "44 64 64",
   	"44 60 64", "44 52 64", "44 48 64");

# check whether we are inside set
sub isinside {
	my $c0 = shift;
	my $z = cplx( 0, 0 );
	for( my $n=0; $n<$nmax; $n++) {
		$z = $z * $z + $c0;
		if( abs($z) > $rmax ) { return 1; }
	}

	return 0;
}
sub isinside_xy {
	my ($x0, $y0) = @_;
	my ($x, $y) = (0.0, 0.0);
	for( my $n=0; $n<$nmax; $n++ ) {
		($x, $y) = ($x**2-$y**2 + $x0, 2*$x*$y + $y0);
		if( sqrt($x**2 + $y**2) > $rmax ) { return $n+1; }
	}

	return 0;
}


# select color value upon inside check
sub colorvalue_bw {
	my $val = shift;
	return $val ? $colormax : 0;
}
sub colorvalue_rgb {
	my $val = shift;
	return $val ? $colormap[$val] : "0 0 0";
}

# calculate pixel value
sub pixel_bw {
	my ($x, $y, $xoffset, $yoffset, $pixelsize) =  @_;
	#return colorvalue(isinside( cplx( $xoffset + $x*$pixelsize, $yoffset - $y*$pixelsize )));
	return colorvalue_bw(isinside_xy( $xoffset + $x*$pixelsize, $yoffset - $y*$pixelsize ));
}
sub pixel_rgb {
	my ($x, $y, $xoffset, $yoffset, $pixelsize) =  @_;
	#return colorvalue(isinside( cplx( $xoffset + $x*$pixelsize, $yoffset - $y*$pixelsize )));
	return colorvalue_rgb(isinside_xy( $xoffset + $x*$pixelsize, $yoffset - $y*$pixelsize ));
}

# PDl approach:
# generate coordinate piddle
##sub coord {
##	my ($xsize, $ysize, $xcenter, $ycenter, $pixelsize) = @_;
##
##	my $xmin = $xcenter - 0.5 * $pixelsize * ($xsize+1);
##	my $xmax = $xmin + $pixelsize * ($xsize+1); 
##	my $ymin = $ycenter + 0.5 * $pixelsize * ($ysize+1);
##	my $ymax = $ymin - $pixelsize * ($xsize+1);
##	my $x = zeros($xsize, $ysize)->xlinvals($xmin, $xmax);
##	my $y = zeros($xsize, $ysize)->ylinvals($ymin, $ymax);
##
##	return ($x, $y);
##}


# generate plot and write to pgm file
sub plot_bw {
	my ($pgm, $xmax, $ymax, $xcenter, $ycenter, $pixelsize) = @_;

	open FILE, ">", $pgm or die "Could open file: " . $!;
	# write PGM header
	print FILE "P2\n";
	print FILE $xmax . "\n";
	print FILE $ymax . "\n";
	print FILE $colormax . "\n";

	# calculate coordinate offset
	my $xoffset = $xcenter - 0.5 * $pixelsize * ($xmax+1);
	my $yoffset = $ycenter + 0.5 * $pixelsize * ($ymax+1);
	# loop over coordinates
	for (my $y=1; $y<=$ymax; $y++) {
		for (my $x=1; $x<=$xmax; $x++) {
			print FILE pixel_bw( $x, $y, $xoffset, $yoffset, $pixelsize ) . "\n";
		}
	}

	close FILE;
}
sub plot_rgb {
	my ($pgm, $xmax, $ymax, $xcenter, $ycenter, $pixelsize) = @_;

	open FILE, ">", $pgm or die "Could open file: " . $!;
	# write PGM header
	print FILE "P3\n";
	print FILE $xmax . "\n";
	print FILE $ymax . "\n";
	print FILE $colormax . "\n";

	# calculate coordinate offset
	my $xoffset = $xcenter - 0.5 * $pixelsize * ($xmax+1);
	my $yoffset = $ycenter + 0.5 * $pixelsize * ($ymax+1);
	# loop over coordinates
	for (my $y=1; $y<=$ymax; $y++) {
		for (my $x=1; $x<=$xmax; $x++) {
			print FILE pixel_rgb( $x, $y, $xoffset, $yoffset, $pixelsize ) . "\n";
		}
	}

	close FILE;
}

1;
