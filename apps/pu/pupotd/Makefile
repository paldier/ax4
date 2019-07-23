include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=pupotd
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/etc/init.d
	install -d $(TARGETDIR)/usr/sbin
	install -m 755 ./src/pupotd $(TARGETDIR)/usr/sbin/    
	install -m 755 ./files/pupotd $(TARGETDIR)/etc/init.d/

clean:
