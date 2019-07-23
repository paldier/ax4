include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=libsoapnvram
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -d $(TARGETDIR)/usr/sbin
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -m 755 ./src/libnvram.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./src/utils/readycloud_nvram $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin

clean:
