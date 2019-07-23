include ../../../config.mk
include ../../../config.in

##### Package Info ############################### 
#PKG_NAME:=libugwhelper
#PKG_VERSION:=1.4.1.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src
#PKG_BUILD_DEPENDS:=

all: 

install:
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc/
	install -d $(TARGETDIR)/etc/
	install -m 755 ./src/libugwhelper.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./src/helper_test $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin/
	install -m 755 ./files/syslog-ng.conf $(TARGETDIR)/$(VENDOR_PATH)/etc/
	install -m 755 ./files/profile_logs.sh $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	./files/gen_notify_defs.sh ./src/include/ugw_notify_defs.h $(TARGETDIR)/$(VENDOR_PATH)/etc/ugw_notify_defs.sh
	./files/gen_notify_defs.sh ./src/include/ugw_notify_defs.h $(TARGETDIR)/etc/ugw_notify_defs.sh

clean:
