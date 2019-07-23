include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=remote_user_conf
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
	install -d $(TARGETDIR)/usr/bin
	install -m 755 ./src/remote_user_conf $(TARGETDIR)/usr/bin/
	
clean:
