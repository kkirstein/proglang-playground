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


FFLAGS	= -O3 -Wall -fopenmp -fPIC

LIBOBJ = mod_array.o mod_io.o mod_alloc.o

all: stock_gain

.SUFFIXES: .f90 .o

# general rule
.f90.o:
	$(FC) $(FFLAGS) -c $<

%.o: %.mod


# programs
stock_gain: stock_gain.f90 $(LIBOBJ)
	$(FC) $(FFLAGS) -o $@ $^

# modules
mod_alloc.o: mod_alloc.f90
mod_array.o: mod_array.f90
mod_io.o: mod_io.f90 mod_alloc.o


clean:
	rm -f *.o
	rm -f *.mod
	rm -f stock_gain


