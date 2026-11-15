CC       = gcc
CODE_DIR = src/shell_code
TEST_DIR = src/shell_tests
BUILD    = build
CFLAGS   = -Wall -Wextra -g -I$(CODE_DIR)

TARGET   = pewpewshell
TEST     = pewpewshell_test

LIB_SRCS  = $(filter-out $(CODE_DIR)/pewpewshell_main.c, $(wildcard $(CODE_DIR)/*.c))
LIB_OBJS  = $(patsubst $(CODE_DIR)/%.c, $(BUILD)/%.o, $(LIB_SRCS))
TEST_SRCS = $(wildcard $(TEST_DIR)/*.c)
TEST_OBJS = $(patsubst $(TEST_DIR)/%.c, $(BUILD)/%.o, $(TEST_SRCS))
HEADERS   = $(wildcard $(CODE_DIR)/*.h)

$(TARGET): $(BUILD)/pewpewshell_main.o $(LIB_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(TEST): $(TEST_OBJS) $(LIB_OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD)/%.o: $(CODE_DIR)/%.c $(HEADERS) | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/%.o: $(TEST_DIR)/%.c $(HEADERS) | $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD):
	mkdir -p $(BUILD)

test: $(TEST)
	./$(TEST)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD) $(TARGET) $(TEST)

.PHONY: clean run test
