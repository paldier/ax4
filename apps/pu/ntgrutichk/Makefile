include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=ntgrutichk
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/usr/bin
	install -d $(TARGETDIR)/etc/init.d
	install -m 755 ./src/ntgrutichk $(TARGETDIR)/usr/bin/
	install -m 755 ./files/ntgrutichk $(TARGETDIR)/etc/init.d/

clean:
