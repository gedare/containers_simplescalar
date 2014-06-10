
CC = gcc
CFLAGS = -g -finstrument-functions

all: simpletest.i386
	

simpletest.i386: simpletest.c ../../tools/etrace-2.1/src/ptrace.c
	$(CC) $(CFLAGS) -g -o simpletest.i386 simpletest.c ../../tools/etrace-2.1/src/ptrace.c -static

run:
	touch TRACE ;
	./simpletest.i386
	../../tools/etrace-2.1/src/etrace simpletest.i386
	rm -f TRACE

clean:
	rm -f simpletest.i386 TRACE
