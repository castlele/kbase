CC=clang
CFLAGS=-pedantic-errors -Wall -Wextra

BUILD=build

RANDU_BINARY=randu
RANDU_FILES=randu_examples.c

randu: run_randu

run_randu: build_randu
	./$(BUILD)/$(RANDU_BINARY)

build_randu:
	$(CC) $(CFLAGS) $(RANDU_FILES) -o $(BUILD)/$(RANDU_BINARY)

clean:
	rm -rf ./build/*
