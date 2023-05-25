AS=nasm
CC=gcc
AFLAGS=-f elf64
LFLAGS=-shared -z noexecstack

SRC=src
OBJ=obj
OUT=lib

SRCS=$(wildcard ${SRC}/*.s)
OBJS=$(patsubst ${SRC}/%.s, ${OBJ}/%.o, ${SRCS})

.PHONY: all libso

all: clean ${OBJS} libso

${OBJ}/%.o: ${SRC}/%.s ${OBJ}
	${AS} ${AFLAGS} -o $@ $<

libso: ${OBJS} ${OUT}
	${CC} ${LFLAGS} -o ${OUT}/libmyc.so ${OBJS}

clean:
	rm -f ${OBJ}/* ${OUT}/*

${OBJ}:
	mkdir ${OBJ}

${OUT}:
	mkdir ${OUT}
