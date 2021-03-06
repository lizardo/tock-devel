# Exports rules to build `main.o`, to be linked with platform specific code to
# compile a binary image. For convenience,Also exposes rules to 

CORE_SOURCES=$(call rwildcard,$(SRC_DIR)main/,*.rs)
MAIN_DEPS=$(BUILD_DIR)/libcore.rlib $(BUILD_DIR)/libsupport.rlib $(CORE_SOURCES)
MAIN_DEPS+=$(BUILD_DIR)/libplatform.rlib $(BUILD_DIR)/libprocess.rlib

$(BUILD_DIR)/main.o: $(MAIN_DEPS)
	@echo "Building $@"
	@$(RUSTC) $(RUSTC_FLAGS) -C lto --emit obj -o $@ $(SRC_DIR)main/main.rs

$(BUILD_DIR)/main.S: $(MAIN_DEPS)
	@echo "Building $@"
	@$(RUSTC) $(RUSTC_FLAGS) -C lto --emit asm -o $@ $(SRC_DIR)main/main.rs

$(BUILD_DIR)/main.ir: $(MAIN_DEPS)
	@echo "Building $@"
	@$(RUSTC) $(RUSTC_FLAGS) -C lto --emit llvm-ir -o $@ $(SRC_DIR)main/main.rs

