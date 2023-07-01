#!/bin/bash

nasm -f elf64 -g -F DWARF input64.s
ld -e _start -o input64 input64.o
./input64

