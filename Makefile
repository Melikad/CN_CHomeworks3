CC = g++ -pthread
BUILD_DIR = build
SRC_DIR = src
INCLUDE_DIR = include
CONFIGURATION_DIR = configuration
CFLAGS = -std=c++11 -Wall -Werror -I$(INCLUDE_DIR)

PC_A_SensitivityList = \
	$(SRC_DIR)/pc_A.cpp \

PC_B_SensitivityList = \
	$(SRC_DIR)/pc_B.cpp \

Router_SensitivityList = \
	$(SRC_DIR)/router.cpp \

# Driver_SensitivityList = \
# 	$(SRC_DIR)/driver.cpp \

all: $(BUILD_DIR) r.out b.out a.out 

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# d.out : $(BUILD_DIR)/d.o $(OBJECTS)
# 	$(CC) -o d.out $(BUILD_DIR)/d.o $(OBJECTS)

a.out : $(BUILD_DIR)/a.o $(OBJECTS)
	$(CC) -o a.out $(BUILD_DIR)/a.o $(OBJECTS)

b.out : $(BUILD_DIR)/b.o $(OBJECTS)
	$(CC) -o b.out $(BUILD_DIR)/b.o $(OBJECTS)

r.out : $(BUILD_DIR)/r.o $(OBJECTS)
	$(CC) -o r.out $(BUILD_DIR)/r.o $(OBJECTS)

# $(BUILD_DIR)/d.o: $(driver_SensitivityList)
# 	$(CC) -c $(SRC_DIR)/driver.cpp -o $(BUILD_DIR)/d.o

$(BUILD_DIR)/a.o: $(PC_A_SensitivityList)
	$(CC) -c $(SRC_DIR)/pc_A.cpp -o $(BUILD_DIR)/a.o

$(BUILD_DIR)/b.o: $(PC_B_SensitivityList)
	$(CC) -c $(SRC_DIR)/pc_B.cpp -o $(BUILD_DIR)/b.o

$(BUILD_DIR)/r.o: $(Router_SensitivityList)
	$(CC) -c $(SRC_DIR)/router.cpp -o $(BUILD_DIR)/r.o

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) *.o *.out *.txt