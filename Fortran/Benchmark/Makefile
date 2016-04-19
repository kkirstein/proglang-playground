# Makfile to compile benchmark.exe
#

FORTRAN  = /usr/bin/x86_64-w64-mingw32-gfortran
OPTS     = -O3 -Wall -fopenmp


# Targets
#
BENCHMARK = benchmark.exe

all: $(BENCHMARK)

ALLOBJ = mandelbrot.o perfect_number.o fibonacci.o benchmark.o

$(BENCHMARK): $(ALLOBJ)
	$(FORTRAN) $(OPTS) -o $@ $^

clean:
	rm -f *.o
	rm -f *.mod

cleanall: clean
	rm -f $(BENCHMARK)

%.mod: %.o
	@touch $@

%.o: %.f95
	$(FORTRAN) $(OPTS) -c $< -o $@

%.o: %.f
	$(FORTRAN) $(OPTS) -c $< -o $@

