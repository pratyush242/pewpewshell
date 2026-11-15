CC      = gcc
CFLAGS  = -Wall -Wextra -g
TARGET  = pewpewshell
TEST    = pewpewshell_test

LIB_SRCS = $(filter-out pewpewshell_main.c %_test.c, $(wildcard *.c))
LIB_OBJS = $(LIB_SRCS:.c=.o)

$(TARGET): pewpewshell_main.o $(LIB_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(TEST): pewpewshell_utils_test.o $(LIB_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c $(wildcard *.h)
	$(CC) $(CFLAGS) -c $<

test: $(TEST)
	./$(TEST)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f *.o $(TARGET) $(TEST)

.PHONY: clean run test
