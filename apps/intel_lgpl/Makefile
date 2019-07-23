
#include $(TOPDIR)/include/host.mk
#include config.mk


#
# Paths
#

SUBDIRS := 
SUBDIRS_KERNEL_MODULE := 

SUBDIRS += framework/libcal framework/libscapi system/system_service/fapi_system framework/csd framework/helper/libhelper framework/helper/libugwhelper



all: flag_check
	for i in ${SUBDIRS}; do \
		(cd $$i; make) || exit 1; \
	done
	for i in ${PRJ_SUBDIRS}; do \
		(cd ../../project/pu/$$i; make) || exit 1; \
	done

flag_check:
	@if [ '$(VIDEO_STREAMING_QOS)' = y ] && [ '$(CONFIG_TREND_IQOS)' = y ]; then \
		echo "Not support VIDEO_STREAMING_QOS + CONFIG_TREND_IQOS for now"; \
		exit 1; \
	fi

install:
	for i in ${SUBDIRS}; do \
		(cd $$i; make install) || exit 1; \
	done
	for i in ${PRJ_SUBDIRS}; do \
		(cd ../../project/pu/$$i; make install) || exit 1; \
	done	

clean:
	for i in ${SUBDIRS}; do \
		(cd $$i; make clean); \
	done

.PHONY: $(SUBDIRS) install clean
