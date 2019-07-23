# ******************************************************************************** #
#       Copyright (c) 2015                                                         #
#       Lantiq Beteiligungs-GmbH & Co. KG                                          #
#       Lilienthalstrasse 15, 85579 Neubiberg, Germany                             #
#       For licensing information, see the file 'LICENSE' in the root folder of    #
#        this software module.                                                     #
# *******************************************************************************  #

PKG_NAME := libscapi

bins := libscapi.so mem utils/scapiutil

CFLAGS += -Wno-unused-function

libscapi.so_sources := $(wildcard *.c)
libscapi.so_cflags := -std=gnu11 -I./include -DMEM_DEBUG

scapiutil := utils/scapiutil.c
scapiutil_ldflags := -L./ -lscapi
scapiutil_cflags := -I./include/

include make.inc
