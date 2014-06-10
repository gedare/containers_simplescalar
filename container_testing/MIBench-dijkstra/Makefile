CC1=/home/gica/crosstool.original/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc
CC2=/home/gica/crosstool.32byte/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc
CC3=/home/gica/crosstool.64byte/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc
CCOLGA=/home/gica/crosstool.olga/gcc-3.3-glibc-2.3.2/arm-unknown-linux-gnu/bin/arm-unknown-linux-gnu-gcc
CFLAGS=--static

all:  dijkstra_large dijkstra_small  dijkstra_large_cachenops dijkstra_small_cachenops dijkstra_large_cachenops64 dijkstra_small_cachenops64 dijkstra_large_olga dijkstra_small_olga 

dijkstra_large: dijkstra_large.c Makefile
	$(CC1) $(CFLAGS) dijkstra_large.c -o dijkstra_large.arm 

dijkstra_small: dijkstra_small.c Makefile
	$(CC1) $(CFLAGS) dijkstra_small.c -o dijkstra_small.arm

dijkstra_large_cachenops: dijkstra_large.c Makefile
	$(CC2) $(CFLAGS) dijkstra_large.c -o dijkstra_large_cachenops.arm 

dijkstra_small_cachenops: dijkstra_small.c Makefile
	$(CC2) $(CFLAGS) dijkstra_small.c -o dijkstra_small_cachenops.arm

dijkstra_large_cachenops64: dijkstra_large.c Makefile
	$(CC3) $(CFLAGS) dijkstra_large.c -o dijkstra_large_cachenops64.arm 

dijkstra_small_cachenops64: dijkstra_small.c Makefile
	$(CC3) $(CFLAGS) dijkstra_small.c -o dijkstra_small_cachenops64.arm	

dijkstra_large_olga: dijkstra_large.c Makefile
	$(CCOLGA) $(CFLAGS) dijkstra_large.c -o dijkstra_large_olga.arm 

dijkstra_small_olga: dijkstra_small.c Makefile
	$(CCOLGA) $(CFLAGS) dijkstra_small.c -o dijkstra_small_olga.arm
	
clean:
	rm -rf *.arm
