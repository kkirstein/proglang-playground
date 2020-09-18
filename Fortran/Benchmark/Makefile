# Makefile for Benchmark project

all: benchmark

# programs
benchmark:
	$(MAKE) --directory=src $@
	cp src/$@ .


clean:
	$(MAKE) --directory=src $@
	$(RM) -f benchmark

.PHONY: benchmark clean

