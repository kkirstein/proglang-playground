# Makfile to compile benchmark.exe
#

uname_s := $(shell uname -s)
ifeq ($(uname_s),Linux)
	FC = caf
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


FCFLAGS	= -O3 -Wall -fPIC

LIBOBJ = mod_io.o mod_array.o mod_parallel.o

all: weather_stats weather_stats_parallel

.SUFFIXES: .f90 .o

# general rule
.f90.o:
	$(FC) $(FCFLAGS) -c $<

%.o: %.mod


# programs
weather_stats: weather_stats.f90 $(LIBOBJ)
	$(FC) $(FCFLAGS) -Wno-uninitialized -o $@ $^

weather_stats_parallel: weather_stats_parallel.f90 $(LIBOBJ)
	$(FC) $(FCFLAGS) -Wno-uninitialized -o $@ $^

check_tiles: check_tiles.f90 mod_parallel.o
	$(FC) $(FCFLAGS) -Wno-uninitialized -o $@ $^


# modules
#mod_alloc.o: mod_alloc.f90
mod_array.o: mod_array.f90
mod_io.o: mod_io.f90
mod_parallel.o: mod_parallel.f90


clean:
	$(RM) -f *.o
	$(RM) -f *.mod
	$(RM) -f weather_stats


