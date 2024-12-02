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

BUG1_NAME=bug1
BUG1_BINARY=$(BUILD)/$(BUG1_NAME)
BUG1_FILES=$(BUG1_NAME).c

BUG2_NAME=bug2
BUG2_BINARY=$(BUILD)/$(BUG2_NAME)
BUG2_FILES=$(BUG2_NAME).c

BUG3_NAME=bug3
BUG3_BINARY=$(BUILD)/$(BUG3_NAME)
BUG3_FILES=$(BUG3_NAME).c

BUG4_NAME=bug4
BUG4_BINARY=$(BUILD)/$(BUG4_NAME)
BUG4_FILES=$(BUG4_NAME).c

BUG5_NAME=bug5
BUG5_BINARY=$(BUILD)/$(BUG5_NAME)
BUG5_FILES=$(BUG5_NAME).c

BUG6_NAME=bug6
BUG6_BINARY=$(BUILD)/$(BUG6_NAME)
BUG6_FILES=$(BUG6_NAME).c

MUTEX_EXAMPLE_NAME=mutex_example
MUTEX_EXAMPLE_FILES=mutex_example.c

CONDVAR_EXAMPLE_NAME=condvar_example
CONDVAR_EXAMPLE_FILES=condvar_example.c


randu: run_randu
schedule: run_schedule
singlearg: run_singlearg
multipleargs: run_multipleargs
mutex_example: run_mutex_example
condvar_example: build_condvar_example
	clear
	./$(BUILD)/$(CONDVAR_EXAMPLE_NAME)

$(BUG1_NAME): build_$(BUG1_NAME)
	clear
	./$(BUG1_BINARY)

$(BUG2_NAME): run_$(BUG2_NAME)
$(BUG3_NAME): run_$(BUG3_NAME)

$(BUG4_NAME): build_$(BUG4_NAME)
	clear
	./$(BUG4_BINARY)

$(BUG5_NAME): run_$(BUG5_NAME)
$(BUG6_NAME): build_$(BUG6_NAME)
	clear
	./$(BUG6_BINARY)


run_randu: build_randu
	clear
	./$(BUILD)/$(RANDU_BINARY)

run_schedule: build_schedule
	clear
	./$(BUILD)/$(SCHEDULE_BINARY)

run_singlearg: build_singlearg
	clear
	./$(BUILD)/$(SINGLEARG_BINARY)

run_multipleargs: build_multipleargs
	clear
	./$(BUILD)/$(MULTIPLEARGS_BINARY)

run_mutex_example: build_mutex_example
	clear
	./$(BUILD)/$(MUTEX_EXAMPLE_NAME)

run_$(BUG2_NAME): build_$(BUG2_NAME)
	clear
	./$(BUG2_BINARY)

run_$(BUG3_NAME): build_$(BUG3_NAME)
	clear
	./$(BUG3_BINARY)

run_$(BUG5_NAME): build_$(BUG5_NAME)
	clear
	./$(BUG5_BINARY)


build_randu:
	$(CC) $(CFLAGS) $(RANDU_FILES) -o $(BUILD)/$(RANDU_BINARY)

build_schedule:
	$(CC) $(CFLAGS) $(SCHEDULE_FILES) -o $(BUILD)/$(SCHEDULE_BINARY)

build_singlearg:
	$(CC) $(CFLAGS) $(SINGLEARG_FILES) -o $(BUILD)/$(SINGLEARG_BINARY)

build_multipleargs:
	$(CC) $(CFLAGS) $(MULTIPLEARGS_FILES) -o $(BUILD)/$(MULTIPLEARGS_BINARY)

build_mutex_example:
	$(CC) $(CFLAGS) $(MUTEX_EXAMPLE_FILES) -o $(BUILD)/$(MUTEX_EXAMPLE_NAME)

build_condvar_example:
	$(CC) $(CFLAGS) $(CONDVAR_EXAMPLE_FILES) -o $(BUILD)/$(CONDVAR_EXAMPLE_NAME)

build_$(BUG1_NAME):
	$(CC) $(CFLAGS) $(BUG1_FILES) -o $(BUG1_BINARY)

build_$(BUG2_NAME):
	$(CC) $(CFLAGS) $(BUG2_FILES) -o $(BUG2_BINARY)

build_$(BUG3_NAME):
	$(CC) $(CFLAGS) $(BUG3_FILES) -o $(BUG3_BINARY)

build_$(BUG4_NAME):
	$(CC) $(CFLAGS) $(BUG4_FILES) -o $(BUG4_BINARY)

build_$(BUG5_NAME):
	$(CC) $(CFLAGS) $(BUG5_FILES) -o $(BUG5_BINARY)

build_$(BUG6_NAME):
	$(CC) $(CFLAGS) $(BUG6_FILES) -o $(BUG6_BINARY)


clean:
	rm -rf ./build/*
