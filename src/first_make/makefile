# first_make

# $^ 依赖不重复
# $@ 目标全称
# @ 不显示执行命令
# - 失败了也继续执行
# c++    -c -o first_make.o first_make.cpp -I../../test_gcc/src/ 
# CXXFLAGS：自动推到
# .PHONY: 伪目标

TARGET=first_make
LIBS=-lpthread
OBJS=first_make.o xdata.o
CXXFLAGS=-I../test_gcc/
SRCS=first_make.cpp xdata.cpp
all:depend $(TARGET)
depend:
	@$(CXX) $(CXXFLAGS) -MM $(SRCS) > .depend

-include .depend

$(TARGET): $(OBJS)
	@# -@rm test
	@echo "开始编译$(TARGET)："
	@$(CXX) $^ -o $@ $(LIBS)
	@echo "编译成功，开始运行$(TARGET)，结果："
	@./$(TARGET)
clean:
	@$(RM) $(TARGET) $(OBJS)
.PHONY:clean *clean depend all
