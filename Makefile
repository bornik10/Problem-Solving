# Set the compiler
CC = gcc
# Set the compiler flags
CFLAGS = -std=c11 -Wall -Wextra -Wpedantic

# Get the names of all C files in the directory
CSRC ?= $(wildcard *.c)
EXECUTABLE = $(patsubst %.c,%,$(CSRC))

# Build rules
all: $(EXECUTABLE)

$(EXECUTABLE): %: %.c
	$(CC) $(CFLAGS) -o $@ $<

run_%: %
	./$<

clean:
	rm -f $(EXECUTABLE)

.PHONY: all clean
