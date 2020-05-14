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


all: weather_stats weather_stats_parallel

# programs
weather_stats:
	$(MAKE) --directory=src $@
	cp src/$@ .

weather_stats_parallel:
	$(MAKE) --directory=src $@
	cp src/$@ .


clean:
	$(MAKE) --directory=src $@
	$(RM) -f weather_stats


