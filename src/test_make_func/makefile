TARGET=test_make_func
SRC:=$(wildcard *.cpp *.c)
OBJS=$(patsubst %.cpp,%.o,$(SRC))
$(TARGET):$(OBJS)
	$(CXX) $^ -o $(TARGET)
#all:
	#echo $(SRC)
