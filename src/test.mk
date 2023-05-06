#test.mk

LDIR:=$(shell pwd)
LLS:=$(shell ls)
TEST:=$(shell echo 111>222)
OUT:=out
INIT:=$(shell if [ ! -d $(OUT) ]; then mkdir $(OUT); fi;)
test:
	@-echo -n $(INIT)
	@echo $(LDIR)
	@echo $(LLS)