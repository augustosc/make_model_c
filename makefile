
TARGET ?= main
BUILD_DIR ?= build
SRC_DIRS ?= srcs
SRC_EXT := c
MKDIR_P ?= mkdir -p

# busca sources em srcs e subdiretorios
SRCS :=$(shell find $(SRC_DIRS) -type f -name *.$(SRC_EXT) )

# define objects
OBJS := $(patsubst $(SRC_DIRS)/%,$(BUILD_DIR)/%,$(SRCS:.$(SRC_EXT)=.o))

# busca includes em srcs e subdiretorios
INC_DIRS := $(shell find $(SRC_DIRS) -type d)

# prepara as include-flags
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

# prepara as flags do compilador 
CFLAGS ?= $(INC_FLAGS) -Wall

# Linking
$(BUILD_DIR)/$(TARGET):$(OBJS)
	@echo "Linking ..."
	@echo "gcc $^ -o $@";gcc $^ -o $@

# Compiling 
$(BUILD_DIR)/%.o:$(SRC_DIRS)/%.c
	@mkdir -p $(dir $@)
	@echo "compiling ... $@"
	@echo "gcc $(CFLAGS) -c -o $@ $< ";gcc $(CFLAGS) -c -o $@ $< 

.PHONY: clean vars run

clean:
	-rm -r $(BUILD_DIR)

run:
	./$(BUILD_DIR)/$(TARGET)

vars:
	@echo "SRCS...: $(SRCS)"
	@echo "OBJS...: $(OBJS)"
	@echo "INC_DIRS...: $(INC_DIRS)"
	@echo "INC_FLAGS...: $(INC_FLAGS)"
	@echo "CFLAGS...: $(CFLAGS)"