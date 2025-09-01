
DYLAN	?= $${HOME}/dylan

.PHONY: build install test dist clean distclean

build:
	deft update
	deft build benchmark-app

install: build
	mkdir -p $(DYLAN)/bin
	mkdir -p $(DYLAN)/install/benchmark/bin
	mkdir -p $(DYLAN)/install/benchmark/lib
	cp _build/bin/benchmark-app $(DYLAN)/install/benchmark/bin/benchmark
	cp -r _build/lib/lib* $(DYLAN)/install/benchmark/lib/
	ln -s -f $$(realpath $(DYLAN)/install/benchmark/bin/benchmark) $(DYLAN)/bin/benchmark

test:
	deft update
	deft test

dist: distclean install

clean:
	rm -rf _packages
	rm -rf registry
	rm -rf _build
	rm -rf _test
	rm -rf *~

distclean: clean
	rm -rf $(DYLAN)/install/benchmark
	rm -f $(DYLAN)/bin/benchmark
