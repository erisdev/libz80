PREFIX = /usr/local
SOURCES = z80.c
OBJS = z80.o
FLAGS = -fPIC -Wall

force: clean all

.PHONY: all
all: libz80.so

.PHONY: codegen
codegen:
	make -C codegen

libz80.so: $(OBJS)
	gcc $(FLAGS) -shared -o libz80.so $(OBJS)

z80.o: z80.c z80.h codegen

.PHONY: install
install:
	install -m 666 libz80.so $(PREFIX)/lib
	install -m 666 z80.h $(PREFIX)/include

.PHONY: clean
clean:
	rm -f *.o *.so core
	cd codegen && make clean

.PHONY: realclean
realclean: clean
	rm -rf doc

.PHONY: doc
doc:	*.h *.c
	doxygen
