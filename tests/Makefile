CC=gcc

CFLAGS=-Wall -O0 #-nostdlib -ffreestanding
LDFLAGS=-L../lib
LIBS=-lmyc -lcriterion

TESTDIR=bin

SRCS=$(wildcard *.c)
OUTS=$(patsubst %.c, ${TESTDIR}/%, ${SRCS})

.PHONY: all

all: clean ${OUTS} run

${TESTDIR}:
	mkdir $@

${TESTDIR}/%: %.c ${TESTDIR}
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ $< ${LIBS}

run: ${OUTS}
	@echo
	@echo "Running tests..."
	@./run.sh

clean:
	rm -f ${TESTDIR}/*
