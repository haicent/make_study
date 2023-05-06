# test install makefile

TARGET:=test_install
OBJS:=test_install.o
CC:=g++
# make install OUT=../
OUT:=/usr/local
STARTSH:=start_$(TARGET)
STOPSH:=stop_$(TARGET)

# $(1) is $(TARGET)
# $(2) is $(OUT)/bin/ 
# $(3) param1
# $(4) param2
# $(n) param n...
define Install
	@echo "begin install $(1)"
	-mkdir -p $(2)
	sudo cp $(1) $(2)

	@echo "make start shell"
	echo "nohup $(1) $(3) $(4) $(5) $(6) &" > $(STARTSH)
	chmod +x $(STARTSH)
	@echo "end make start shell"

	@echo "make stop shell"
	echo "killall $(TARGET)" > $(STOPSH)
	chmod +x $(STOPSH)
	@echo "end make stop shell"

	@echo "$(1) install success!"
endef

# start_test_install
# nohup test_install 3 &

# stop_test_install
# killall test_install

$(TARGET):$(OBJS)

clean:
	$(RM) $(TARGET) $(OBJS) $(STARTSH) $(STOPSH)

install:$(TARGET)
	$(call Install,$(TARGET),$(OUT)/bin/,5)
#	@echo "begin install $(TARGET)"
#	mkdir -p $(OUT)/bin/
#	cp $(TARGET)  $(OUT)/bin/
#	@echo "$(TARGET) install success!"

.PHONY: install clean