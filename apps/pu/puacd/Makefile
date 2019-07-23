include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=puacd
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
	install -d $(TARGETDIR)/etc/init.d
	install -d $(TARGETDIR)/usr/sbin
	install -m 755 ./src/puacd $(TARGETDIR)/usr/sbin/
	cp -f ./files/puacd $(TARGETDIR)/etc/init.d/
	
clean:
