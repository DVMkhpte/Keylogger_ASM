SRC=src/*
OBJ=build/keylogger.o
BIN=bin/keylogger

all: $(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	ld -o $@ $^

build/%.o: src/%.asm
	mkdir -p build
	nasm -f elf64 -g -o $@ $<

run:
	./bin/keylogger

clean:
	rm -rf build/* bin/* logs/*