PROG=bin/xsh
SRCS=src/xsh.c
OBJS=$(SRCS:.c=.o)

CFLAGS=-Wall -Werror -g -pedantic
LDFLAGS=-lreadline
PREFIX ?= /usr/local/
INSTALL=install

all: $(PROG)

$(PROG): $(OBJS)
	mkdir -p bin
	$(CC) $^ -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) -c $^ -o $@ $(CFLAGS)

.PHONY: clean install

install: $(PROG)
	$(INSTALL) $(PROG) $(PREFIX)/bin/ -m 755

clean:
	rm -f $(OBJS) $(PROG)
