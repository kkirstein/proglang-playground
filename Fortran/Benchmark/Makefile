# Makfile to compile benchmark.exe
#

FORTRAN  = /usr/bin/x86_64-w64-mingw32-gfortran
OPTS     = -O3

.SUFFIXES: .o .f .f95


# Targets
#
BENCHMARK = benchmark.exe

all: $(BENCHMARK)

ALLOBJ = benchmark.o fibonacci.o

$(BENCHMARK): $(ALLOBJ)
	$(FORTRAN) $(OPTS) -o $@ $^

clean:
	rm -f *.o

cleanall: clean
	rm -f $(BENCHMARK)

.f95.o: 
	$(FORTRAN) $(OPTS) -c $< -o $@

.f.o: 
	$(FORTRAN) $(OPTS) -c $< -o $@

