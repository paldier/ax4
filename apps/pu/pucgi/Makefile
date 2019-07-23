include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=pucgi
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
	install -d $(TARGETDIR)/etc/init.d
	install -d $(TARGETDIR)/opt/vendor/www2/
	install -d $(TARGETDIR)/opt/vendor/www2/cgi
	install -m 755 ./src/pucgi $(TARGETDIR)/opt/vendor/www2/cgi/ 
	install -m 755 ./src/others/pucgid $(TARGETDIR)/opt/vendor/www2/cgi/
	install -m 755 ./src/others/traffic-control $(TARGETDIR)/opt/vendor/www2/cgi/
	install ./files/www2.tgz $(TARGETDIR)/opt/vendor/www2/    
	install ./files/www2-lang.tgz $(TARGETDIR)/opt/vendor/www2/
	install ./files/www2-tnc.tgz $(TARGETDIR)/opt/vendor/www2/
	install ./files/lighttpd4.conf $(TARGETDIR)/opt/vendor/www2/
	install ./files/lighttpd5.conf $(TARGETDIR)/opt/vendor/www2/
	install -m 755 ./files/lighttpd4 $(TARGETDIR)/etc/init.d/    
	install -m 755 ./files/lighttpd5 $(TARGETDIR)/etc/init.d/    
	install -m 755 ./files/pucgid $(TARGETDIR)/etc/init.d/
	install -m 755 ./files/openvpn1 $(TARGETDIR)/etc/init.d/
	install -m 755 ./files/openvpn2 $(TARGETDIR)/etc/init.d/
	
clean:
