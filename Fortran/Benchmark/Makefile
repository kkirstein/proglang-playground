# Makfile to compile benchmark.exe
#

FC  = /usr/bin/x86_64-w64-mingw32-gfortran
OPTS     = -O3 -Wall -fopenmp


# Targets
#
exe = benchmark.exe
shared = benchmark.dll

all: $(exe) $(shared)

LIBOBJ = color_map.o mandelbrot.o perfect_number.o fibonacci.o 
ALLOBJ = $(LIBOBJ) benchmark.o

$(shared): $(LIBOBJ)
	$(FC) $(OPTS) --shared -o $@ \
		-Wl,--out-implib=${shared}.a \
		-Wl,--export-all-symbols \
		-Wl,--enable-auto-import \
		$^ 

$(exe): $(ALLOBJ)
	$(FC) $(OPTS) -o $@ $^

clean:
	rm -f *.o
	rm -f *.mod

cleanall: clean
	rm -f $(exe) $(shared) $(shared).a

%.mod: %.o
	@touch $@

%.o: %.f95
	$(FC) $(OPTS) -c $< -o $@

%.o: %.f
	$(FC) $(OPTS) -c $< -o $@

