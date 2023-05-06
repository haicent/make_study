# TARGET=libxcom
# OBJS=xcom.o

# ifeq ($(STATIC),0)
# # 静态库
# TARGET:=$(TARGET).a
# $(TARGET):$(OBJS)
# 	$(AR) -cvr $@ $^
# else
# # 动态库
# TARGET:=$(TARGET).so
# LDFLAGS=-shared
# CXXFLAGS=-fPIC -std=gnu++11 
# $(TARGET):$(OBJS)
# 	$(CXX) $(LDFLAGS) $^ -o $@
# endif

# clean:
# 	$(RM) $(TARGET) $(OBJS)
# .PHONY:clean


# xcom makefile

# 静态
ifeq ($(STATIC),1)
LIBTYPE:=.a
else
LIBTYPE:=.so
endif

include ../makefile.mk