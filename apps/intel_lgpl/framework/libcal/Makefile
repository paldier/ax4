include ../../config.mk
include ../../config.in

##### Package Info ############################### 
#PKG_NAME:=libcal
#PKG_VERSION:=1.1.10.1
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc
	install -m 755 ./src/*.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./src/test_sample/caltest $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin/
	install -m 755 ./src/test_sample/*.txt $(TARGETDIR)/$(VENDOR_PATH)/etc/
	
clean:
