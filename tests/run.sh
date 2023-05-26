#!/bin/sh

BIN=./bin

for f in ${BIN}/*
do
        LD_LIBRARY_PATH=../lib $f                   \
                && echo "[SUCCESS] `basename $f`"   \
                || echo "[FAILED]  `basename $f`"
done
