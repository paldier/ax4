include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=ntgr_ra_dce
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
	install -d $(TARGETDIR)/etc/ra_rae/
	install -d $(TARGETDIR)/etc/init.d
	install -d $(TARGETDIR)/usr/bin
	install -m 755 ./src/ntgr_ra_dce $(TARGETDIR)/usr/bin/
	install -m 755 ./files/ntgr_ra_dce $(TARGETDIR)/etc/init.d/
	install ./files/rae.tgz.enc $(TARGETDIR)/etc/ra_rae/
	install ./files/rae_prod.tgz.enc $(TARGETDIR)/etc/ra_rae/
	
clean:
