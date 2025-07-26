SRC=src/*
OBJ=build/keylogger.o
BIN=bin/keylogger

all: $(BIN)

$(BIN): $(OBJ)
	mkdir -p bin
	ld -o $@ $^

build/%.o: src/%.asm
	mkdir -p build
	mkdir -p logs
	nasm -f elf64 -g -o $@ $<

run:
	mkdir -p logs
	./bin/keylogger

clean:
	rm -rf build/* bin/* logs/*