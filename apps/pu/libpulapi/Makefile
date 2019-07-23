include ../config.mk
include ../config.in

##### Package Info ############################### 
#PKG_NAME:=libpulapi
#PKG_VERSION:=1.0.0
#PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_DEFAULT_CUSTOM_SOURCE_DIR:=$(shell pwd)/src

all: 

install: 
#	install -d $(TARGETDIR)/lib
#	install -m 755 libnvram.so $(TARGETDIR)/lib
#	$(STRIP) $(TARGETDIR)/lib/libnvram.so
#	install -D param $(TARGETDIR)/usr/sbin/param
#	$(STRIP) $(TARGETDIR)/usr/sbin/param
#	cp -f param nvram
#	install -D nvram $(TARGETDIR)/usr/sbin/nvram
#	cd $(TARGETDIR)/usr/sbin && ln -sf param readycloud_nvram
#	echo "test :$(INSTALLDIR)"
#	echo "test :TARGETDIR=$(TARGETDIR)"
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin
	install -d $(TARGETDIR)/$(VENDOR_PATH)/usr/lib
	install -d $(TARGETDIR)/$(VENDOR_PATH)/etc
	install -d $(TARGETDIR)/etc/hotplug.d/iface
	install -d $(TARGETDIR)/etc/openvpn
	install -d $(TARGETDIR)/etc/openvpn/def_keys
	install -d $(TARGETDIR)/etc/openvpn/keys
	install -d $(TARGETDIR)/etc/dqos
	install -d $(TARGETDIR)/usr/sbin
	install -d $(TARGETDIR)/etc/wave_cal
	install -d $(TARGETDIR)/etc/easy-rsa
	install -m 755 ./src/*.so $(TARGETDIR)/$(VENDOR_PATH)/usr/lib/
	install -m 755 ./files/60-iface-uptime $(TARGETDIR)/etc/hotplug.d/iface/
	install ./files/openvpn/def_keys/*.* $(TARGETDIR)/etc/openvpn/def_keys/
	install -m 755 ./files/openvpn/tun_up.sh $(TARGETDIR)/etc/openvpn/
	install -m 755 ./files/openvpn/tap_up.sh $(TARGETDIR)/etc/openvpn/
	install -m 755 ./files/openvpn/tun_down.sh $(TARGETDIR)/etc/openvpn/
	install -m 755 ./files/openvpn/tap_down.sh $(TARGETDIR)/etc/openvpn/
	install -m 755 ./files/openvpn/gen_keys/genkeys $(TARGETDIR)/etc/easy-rsa/
	install -m 755 ./files/80-update-vlan $(TARGETDIR)/etc/hotplug.d/iface/
	install -m 755 ./files/email/mail $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin/
	install ./files/dqos/dqosrules $(TARGETDIR)/etc/dqos
	install -m 755 ./files/dqos/ookla $(TARGETDIR)/$(VENDOR_PATH)/usr/sbin/
	install -m 755 ./files/90-update-readycloud $(TARGETDIR)/etc/hotplug.d/iface/
	install -m 755 ./files/ntgr_factorycfg.sh $(TARGETDIR)/usr/sbin/
	install -m 755 ./files/resetLedBlink.sh $(TARGETDIR)/usr/sbin/
	install ./files/wave_cal/default.tar.gz $(TARGETDIR)/etc/wave_cal	
clean:
