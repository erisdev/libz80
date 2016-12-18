PREFIX = /usr/local
SOURCES = z80.c
OBJS = z80.o
FLAGS = -fPIC -Wall

.PHONY: all
all: libz80.so

.PHONY: codegen
codegen:
	$(MAKE) -C codegen

libz80.so: $(OBJS)
	gcc $(FLAGS) -shared -o libz80.so $(OBJS)

z80.o: z80.c z80.h | codegen

.PHONY: install
install:
	$(INSTALL) -m 644 libz80.so $(PREFIX)/lib
	$(INSTALL) -m 644 z80.h $(PREFIX)/include

.PHONY: clean
clean:
	$(RM) *.o *.so core
	$(MAKE) -C codegen clean

.PHONY: realclean
realclean: clean
	$(RM) -r doc

.PHONY: doc
doc:	*.h *.c
	doxygen
