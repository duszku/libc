AS=nasm
FLAGS=-f elf64

SRC=src
OUT=obj

SRCS=$(wildcard ${SRC}/*.s)
OUTS=$(patsubst ${SRC}/%.s, ${OUT}/%.o, ${SRCS})

.PHONY: all

all: clean ${OUTS}

${OUT}/%.o: ${SRC}/%.s ${OUT}
	${AS} ${FLAGS} -o $@ $<

clean:
	rm -f ${OUT}/*

${OUT}:
	mkdir ${OUT}
