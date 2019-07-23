include ../config.mk
include ../config.in

###### Package Info ############################### 
#PKG_NAME:=libBF
#PKG_VERSION:=2018-10-24
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
##PKG_RELEASE=$(PKG_SOURCE_VERSION)
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#
##PKG_SOURCE:=./src/
#MAKE_PATH:=src
##PKG_SOURCE_PROTO:=git
##PKG_SOURCE_URL:=http://git.openwrt.org/project/libubox.git
##PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
##PKG_SOURCE_VERSION:=10429bccd0dc5d204635e110a7a8fae7b80d16cb
##PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
##PKG_MIRROR_MD5SUM:=xxx
##CMAKE_INSTALL:=1
#
#PKG_LICENSE:=GPL-2.0
#PKG_LICENSE_FILES:=

all: 

install:
	install -d $(TARGETDIR)/usr/lib/
	install -d $(TARGETDIR)/usr/include
	install -m 755 ./src/libBF.so $(TARGETDIR)/usr/lib/
	install ./src/*.h $(TARGETDIR)/usr/include/

clean:
