CC=clang
CFLAGS=-pedantic-errors -Wall -Wextra

BUILD=build

RANDU_BINARY=randu
RANDU_FILES=randu_examples.c

SCHEDULE_BINARY=schedule
SCHEDULE_FILES=scheduling.c

SINGLEARG_BINARY=singlearg
SINGLEARG_FILES=singlearg.c

MULTIPLEARGS_BINARY=multipleargs
MULTIPLEARGS_FILES=multipleargs.c


randu: run_randu
schedule: run_schedule
singlearg: run_singlearg
multipleargs: run_multipleargs


run_randu: build_randu
	./$(BUILD)/$(RANDU_BINARY)

run_schedule: build_schedule
	./$(BUILD)/$(SCHEDULE_BINARY)

run_singlearg: build_singlearg
	./$(BUILD)/$(SINGLEARG_BINARY)

run_multipleargs: build_multipleargs
	./$(BUILD)/$(MULTIPLEARGS_BINARY)


build_randu:
	$(CC) $(CFLAGS) $(RANDU_FILES) -o $(BUILD)/$(RANDU_BINARY)

build_schedule:
	$(CC) $(CFLAGS) $(SCHEDULE_FILES) -o $(BUILD)/$(SCHEDULE_BINARY)

build_singlearg:
	$(CC) $(CFLAGS) $(SINGLEARG_FILES) -o $(BUILD)/$(SINGLEARG_BINARY)

build_multipleargs:
	$(CC) $(CFLAGS) $(MULTIPLEARGS_FILES) -o $(BUILD)/$(MULTIPLEARGS_BINARY)


clean:
	rm -rf ./build/*
