# Makfile to compile benchmark.exe
#

uname_s := $(shell uname -s)
ifeq ($(uname_s),Linux)
	FC = gfortran
	SHARED_FLAGS = -shared -fPIC
	EXE_EXT =
	SHARED_EXT = .so
else
	FC  = /usr/bin/x86_64-w64-mingw32-gfortran
	SHARED_FLAGS = --shared \
		-Wl,--out-implib=${shared}.a \
		-Wl,--export-all-symbols \
		-Wl,--enable-auto-import
	EXE_EXT = .exe
	SHARED_EXT = .dll
endif

FCFLAGS	= -O3 -Wall -fopenmp -fPIC
OBJS = mandelbrot.o perfect_number.o fibonacci.o


.PHONY: all clean
.SUFFIXES: .f90 .o

all: benchmark

# general rules
.f90.o:
	$(FC) $(FCFLAGS) -c $<

%.o: %.mod


# modules
fibonacci.o: fibonacci.f90
mandelbrot.o: mandelbrot.f90
perfect_number.o: perfect_number.f90
primes.o: primes.f90

# programs
benchmark: benchmark.f90 $(OBJS)
	$(FC) $(FCFLAGS) -cpp $^ -o $@

clean:
	rm -f *.o
	rm -f *.mod
	rm -f benchmark$(EXE_EXT)

