.PHONY: opcodes
opcodes: opcodes_impl.c

mktables: mktables.c

opcodes_impl.c: mktables opcodes.lst mktables.spec
	./mktables

.PHONY: clean
clean:
	rm -f opcodes_impl.c opcodes_decl.h opcodes_table.h mktables
