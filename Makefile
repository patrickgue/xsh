PROG=bin/xsh
SRCS=src/xsh.c
OBJS=$(SRCS:.c=.o)

CFLAGS=-Wall -Werror -g -pedantic
LDFLAGS=-lreadline

all: $(PROG)

$(PROG): $(OBJS)
	mkdir -p bin
	$(CC) $^ -o $@ $(LDFLAGS)

%.o: %.c
	$(CC) -c $^ -o $@ $(CFLAGS)

.PHONY: clean
clean:
	rm -f $(OBJS) $(PROG)
