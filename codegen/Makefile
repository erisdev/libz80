.PHONY: all
all: opcodes

mktables: mktables.c

.PHONY: force
force: clean opcodes

.PHONY: opcodes
opcodes: mktables opcodes.lst mktables.spec
	./mktables

.PHONY: clean
clean:
	rm -f opcodes_impl.c opcodes_decl.h opcodes_table.h mktables
