CC=clang
TEST=test
BIN=$(TEST)
CFLAGS=-arch arm64

# LIBS=-llua -llualib  -framework OpenGL -I/opt/local/include
LIBS=-llua -ldl -lm -I/Users/castlelecs/.luaver/lua/5.1/include/ -L/Users/castlelecs/.luaver/lua/5.1/lib/

run: test
	./test test.lua

build:
	$(CC) -shared $(CFLAGS) test.c -o pthread.so -fPIC $(LIBS)

test: test.c
	clear
	$(CC) $(CFLAGS) test.c -o $(BIN) $(LIBS)

clean:
	rm -f $(BIN) rm pthread.so
