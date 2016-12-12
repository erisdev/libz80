all: opcodes

mktables: mktables.c

.PHONY: force
force: clean opcodes

.PHONY: opcodes
opcodes: mktables opcodes.lst mktables.spec
	./mktables
	cat opcodes_impl.c | grep "static void" | sed "s/)/);/g" >opcodes_decl.h

.PHONY: clean
clean:
	rm -f opcodes_impl.c opcodes_decl.h opcodes_table.h mktables
