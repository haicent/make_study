# makefile.mk
ifndef TARGET
# /Users/fy/work/make_learn/src/test_include
TARGET:=$(notdir $(shell pwd))
endif

# 运行时，加载的动态链接库
LD_LIBRARY_PATH:=$(dir $(shell pwd))xcom:$(dir $(shell pwd))xthread
EXPORT_LD_LIBRARY_PATH:=export DYLD_LIBRARY_PATH=$(LD_LIBRARY_PATH)\nexport LD_LIBRARY_PATH=$(LD_LIBRARY_PATH)\n
# g++ -c 编译 自动推导
CXXFLAGS:=-I../../include -std=gnu++20
# 链接 可用于自动推导
LDFLAGS:=-L../xcom -L../xthread
# 链接库 用于自动推导
LDLIBS:=-lpthread
# 安装输出路径
OUT:=/usr/local


SRCS:=$(wildcard *.cpp *.cc *.c) #test_include.cpp testcpp.cc testc.c
OBJS:=$(patsubst %.cpp,%.o,$(SRCS)) #test_include.o testcpp.cc testc.c
OBJS:=$(patsubst %.cc,%.o,$(OBJS))
OBJS:=$(patsubst %.c,%.o,$(OBJS)) #test_include.o testcpp.o testc.o


# 区分静态库、动态库、执行程序
ifeq ($(LIBTYPE),.so)# 动态库 $(strip v)去掉空格
	TARGET:=lib$(strip $(TARGET)).so
	LDFLAGS:=$(LDFLAGS) -shared -fPIC
endif

ifeq ($(LIBTYPE),.a)# 动态库 $(strip v)去掉空格
	TARGET:=lib$(strip $(TARGET)).a
endif


# $(1) is $(TARGET)
# $(2) is $(OUT)/bin/ 
# $(3) param1
# $(4) param2
# $(n) param n...
define Install
	@echo "begin install $(1)"
	-mkdir -p $(2)
	cp $(1) $(2)
	@echo "$(1) install success!"
endef

STARTSH:=start_$(TARGET)
STOPSH:=stop_$(TARGET)

# $(1) TARGET, $(2) OUT, $(3) PARAM
define InstallSh
	@echo "make start shell"
#	echo "$(EXPORT_LD_LIBRARY_PATH)\n$(1) $(3) $(4) $(5) $(6)" > $(STARTSH)
	echo "$(1) $(3) $(4) $(5) $(6)" > $(STARTSH)
	chmod +x $(STARTSH)
	mv $(STARTSH) $(2)
	@echo "end make start shell"

	@echo "make stop shell"
	echo "killall $(TARGET)" > $(STOPSH)
	chmod +x $(STOPSH)
	mv $(STOPSH) $(2)
	@echo "end make stop shell"
endef

all:depend $(TARGET)
depend:
	@$(CXX) $(CXXFLAGS) -MM $(SRCS) > .depend

-include .depend

$(TARGET):$(OBJS)
ifeq ($(LIBTYPE),.a)
	$(AR) -cvr $@ $^
else
# so和可执行文件，都走这里
	$(CXX) $(LDFLAGS) $^ -o $@ $(LDLIBS)
endif


install:$(TARGET)
ifdef LIBTYPE
	$(call Install,$(TARGET),$(OUT)/lib)
	$(call Install,*.hpp,$(OUT)/include)
else
	$(call Install,$(TARGET),$(OUT)/bin)
	$(call InstallSh,$(TARGET),$(OUT)/bin)
endif

uninstall:clean
ifndef LIBTYPE
	-$(STOPSH)
	$(RM) $(OUT)/bin/$(TARGET)
	$(RM) $(OUT)/bin/$(STOPSH)
	$(RM) $(OUT)/bin/$(STARTSH)
else
	$(RM) $(OUT)/lib/$(TARGET)
#   $(RM) $(OUT)/include/$(STOPSH)
endif

#rm -r test.o test
run:
	@./$(TARGET)

clean:
	$(RM) $(OBJS) $(TARGET) .depend

.PHONY: clean uninstall install all depend #伪目标 没有对应的文件

