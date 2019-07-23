include ../../config.mk
include ../../config.in

##### Package Info ############################### 
#PKG_NAME:=csd
#PKG_VERSION:=1.5.0.5
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/$(VENDOR_PATH)/config
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc/csd
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -d $(TARGETDIR)/usr/sbin
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc/csd/
	install -d $(TARGETDIR)/etc/init.d
	install -m 755 ./src/capi/libcapi.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./src/csd $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -m 755 ./src/capi/test_api/capitest $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -m 755 ./src/capi/test_api/csdutil $(TARGETDIR)/usr/sbin
	install -m 755 ./files/csd $(TARGETDIR)/etc/init.d/

clean:
