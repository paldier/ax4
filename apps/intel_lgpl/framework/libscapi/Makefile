include ../../config.mk
include ../../config.in

##### Package Info ############################### 
#PKG_NAME:=libscapi
#PKG_VERSION:=1.5.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/usr/lib
	install -d $(TARGETDIR)/usr/sbin
	install -m 755 ./src/mem $(TARGETDIR)/usr/sbin/ 
	install -m 755 ./src/utils/scapiutil $(TARGETDIR)/usr/sbin/ 
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc/
	install -m 755 ./src/interfaces.cfg $(TARGETDIR)/$(VENDOR_PATH)/etc/
	install -m 755 ./src/*.so $(TARGETDIR)/usr/lib

clean:
