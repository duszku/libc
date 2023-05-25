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
	@for f in ${OUTS} ; do LD_LIBRARY_PATH=../lib ./$$f ; done

clean:
	rm -f ${TESTDIR}/*
