include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=ntgrcli
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install:
	install -d $(TARGETDIR)/usr/bin
	install -m 755 ./src/ntgrcli $(TARGETDIR)/usr/bin/
	install -m 755 ./src/wpsledd/wpsledd $(TARGETDIR)/usr/bin/	
	install -m 755 ./src/tmledflashd/tmledflashd $(TARGETDIR)/usr/bin/	
	install -m 755 ./src/ntgrselfled/ntgrselfled $(TARGETDIR)/usr/bin/
	install -m 755 ./src/ntgrspeedtest/ntgrspeedtest $(TARGETDIR)/usr/bin/

clean:
