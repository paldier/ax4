include ../../../config.mk
include ../../../config.in

##### Package Info ###############################
#PKG_NAME:=system_fapi
#PKG_VERSION:=1.1.8.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -m 755 ./src/libsysfapi.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./src/libethfapi.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/

clean:
