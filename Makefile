PREFIX = $(CONDA_PREFIX)
GCC = $(PREFIX)/bin/gcc
CFLAGS  = -g -Wall -std=gnu99 -I../ -I$(PREFIX)/include
LDFLAGS = -L$(PREFIX)/lib -Wl,-rpath,$(PREFIX)/lib
LIBS = -lm -lgsl -lgslcblas -lfftw3
MAKE = /usr/bin/make

all : korb.o

korb : korb-dlink
	$(GCC) $(CFLAGS) -o korb korb.o $(LDFLAGS) $(LIBS)

korb-dlink : korb.c 
	$(GCC) $(CFLAGS) -DLINK_DEFAULT -O3 -c -o korb.o korb.c

korb.o : korb.c 
	$(GCC) $(CFLAGS) -O3 -c -o korb.o korb.c

example : example.o korb.o
	$(GCC) $(CFLAGS) -o example example.o korb.o $(LDFLAGS) $(LIBS)

example.o : example.c 
	$(GCC) $(CFLAGS) -O0 -c -o example.o example.c

clean :
	rm -rf example korb
	rm -rf *.o

.PHONY : clean all korb-dlink