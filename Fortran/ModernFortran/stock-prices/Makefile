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


# Targets
#
exe = stock_gain$(EXE_EXT)

all: $(exe)

LIBOBJ = mod_array.o mod_io.o mod_alloc.o
ALLOBJ = $(LIBOBJ) stock_gain.o

$(shared): $(LIBOBJ)
	$(FC) $(FFLAGS) $(SHARED_FLAGS) -o $@ $^

$(exe): $(ALLOBJ)
	$(FC) $(FFLAGS) -o $@ $^

clean:
	rm -f *.o
	rm -f *.mod
	rm -f $(exe)
	rm -f $(shared)

cleanall: clean
	rm -f $(exe) $(shared) $(shared).a

%.mod: %.o
	@touch $@

%.o: %.f95
	$(FC) $(FFLAGS) -c $< -o $@

%.o: %.f
	$(FC) $(FFLAGS) -c $< -o $@
