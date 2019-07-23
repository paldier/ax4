# ******************************************************************************** #
#       Copyright (c) 2015                                                         #
#       Lantiq Beteiligungs-GmbH & Co. KG                                          #
#       Lilienthalstrasse 15, 85579 Neubiberg, Germany                             #
#       For licensing information, see the file 'LICENSE' in the root folder of    #
#        this software module.                                                     #
# *******************************************************************************  #

CFLAGS += -I./include -fPIC 
LDFLAGS+= -lezxml -lubox -lubus

LIB  := libcapi.so
BIN  := test_api/capitest
HDRS := $(wildcard ./include/*.h)
OBJS := $(patsubst %.c, %.o, $(wildcard *.c))
DEPS := $(patsubst %.c, %.d, $(wildcard *.c))

%.d: %.c $(HDRS)
	$(CC) -MM $(CFLAGS) $< > $@
	$(CC) -MM $(CFLAGS) $< | sed s/\\.o/.d/ >> $@

%.o: %.c
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

all:  $(DEPS) $(LIB) $(BIN)

$(LIB): $(OBJS)
	$(CC) -shared $(OBJS) $(LDFLAGS) -o $@

$(BIN): $(BIN).o
	$(CC) $< -lcapi -L./ -o $@

clean:
	rm -f *.o *.d *.so $(BIN) $(BIN).o

-include $(DEPS)
