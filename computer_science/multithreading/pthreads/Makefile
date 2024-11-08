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

BUG2_NAME=bug2
BUG2_BINARY=$(BUILD)/$(BUG2_NAME)
BUG2_FILES=$(BUG2_NAME).c

BUG3_NAME=bug3
BUG3_BINARY=$(BUILD)/$(BUG3_NAME)
BUG3_FILES=$(BUG3_NAME).c

BUG5_NAME=bug5
BUG5_BINARY=$(BUILD)/$(BUG5_NAME)
BUG5_FILES=$(BUG5_NAME).c

randu: run_randu
schedule: run_schedule
singlearg: run_singlearg
multipleargs: run_multipleargs
$(BUG2_NAME): run_$(BUG2_NAME)
$(BUG3_NAME): run_$(BUG3_NAME)
$(BUG5_NAME): run_$(BUG5_NAME)


run_randu: build_randu
	./$(BUILD)/$(RANDU_BINARY)

run_schedule: build_schedule
	./$(BUILD)/$(SCHEDULE_BINARY)

run_singlearg: build_singlearg
	./$(BUILD)/$(SINGLEARG_BINARY)

run_multipleargs: build_multipleargs
	./$(BUILD)/$(MULTIPLEARGS_BINARY)

run_$(BUG2_NAME): build_$(BUG2_NAME)
	./$(BUG2_BINARY)

run_$(BUG3_NAME): build_$(BUG3_NAME)
	./$(BUG3_BINARY)

run_$(BUG5_NAME): build_$(BUG5_NAME)
	./$(BUG5_BINARY)


build_randu:
	$(CC) $(CFLAGS) $(RANDU_FILES) -o $(BUILD)/$(RANDU_BINARY)

build_schedule:
	$(CC) $(CFLAGS) $(SCHEDULE_FILES) -o $(BUILD)/$(SCHEDULE_BINARY)

build_singlearg:
	$(CC) $(CFLAGS) $(SINGLEARG_FILES) -o $(BUILD)/$(SINGLEARG_BINARY)

build_multipleargs:
	$(CC) $(CFLAGS) $(MULTIPLEARGS_FILES) -o $(BUILD)/$(MULTIPLEARGS_BINARY)

build_$(BUG2_NAME):
	$(CC) $(CFLAGS) $(BUG2_FILES) -o $(BUG2_BINARY)

build_$(BUG3_NAME):
	$(CC) $(CFLAGS) $(BUG3_FILES) -o $(BUG3_BINARY)

build_$(BUG5_NAME):
	$(CC) $(CFLAGS) $(BUG5_FILES) -o $(BUG5_BINARY)


clean:
	rm -rf ./build/*
