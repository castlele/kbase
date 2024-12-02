CC=clang
CFLAGS=-Wall -Werror -g -v

FRAMEWORKS=-framework Foundation
LIBS=-lobjc
LDFLAGS=$(FRAMEWORKS) $(LIBS)

BINARY=atomicnonatomic
INCLUDE=-I./
SRC=main.m

run: build
	clear
	./$(BINARY)

build:
	clear
	$(CC) $(CFLAGS) $(LDFLAGS) $(INCLUDE) $(SRC) -o $(BINARY)

clean:
	clear
	rm $(BINARY)

