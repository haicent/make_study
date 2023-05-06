# TARGET=xserver
# OBJS=xserver.o
# CXXFLAGS=-std=gnu++11 -I../xthread -I../xcom
# LDFLAGS=-L../xthread -L../xcom
# LIBS=-lxthread -lpthread -lxcom
# # env LD_LIBRARY_PATH
# $(TARGET): $(OBJS)
# 	$(CXX) $^ -o $@ $(LDFLAGS) $(LIBS)
# clean:
# 	$(RM) $(TARGET) $(OBJS)
# .PHONY:clean

# xserver makefile

include ../makefile.mk
CXXFLAGS:=$(CXXFLAGS)  -I../xthread -I../xcom
LDLIBS:=$(LDLIBS) -lxthread -lxcom 