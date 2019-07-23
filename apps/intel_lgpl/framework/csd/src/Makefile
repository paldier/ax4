# ******************************************************************************** #
#       Copyright (c) 2015                                                         #
#       Lantiq Beteiligungs-GmbH & Co. KG                                          #
#       Lilienthalstrasse 15, 85579 Neubiberg, Germany                             #
#       For licensing information, see the file 'LICENSE' in the root folder of    #
#        this software module.                                                     #
# *******************************************************************************  #

PKG_NAME:= csd

CFLAGS := $(filter-out -DPACKAGE_ID=\"csd\" -DLOGGING_ID="csd",$(CFLAGS))
opt_no_flags := -Wcast-qual

bins := capi/libcapi.so csd capi/test_api/capitest capi/test_api/csdutil

libcapi.so_sources := $(wildcard capi/*.c)
libcapi.so_cflags := -I./capi/include/ -DPACKAGE_ID=\"CAPI\" -DLOGGING_ID="capi"
libcapi.so_ldflags :=  -lubox -lubus -lugwhelper -lhelper

csd_sources := $(wildcard *.c)
csd_cflags := -I./include/ -I./capi/include/ -DPACKAGE_ID=\"CSD\" -DLOGGING_ID="csd"
csd_ldflags := -Lcapi/ -lcapi -lezxml -lblobmsg_json -lubox -lubus -lugwhelper -lpthread -lhelper -lscapi

capitest_sources := $(wildcard capi/test_api/capitest.c)
capitest_ldflags := -Lcapi/ -lcapi -lezxml -lblobmsg_json -lubox -lubus -lugwhelper -lhelper -lscapi
capitest_cflags := -I./include/ -I./capi/include/ -DPACKAGE_ID=\"capitest\" -DLOGGING_ID="capitest"

csdutil_sources := $(wildcard capi/test_api/csd_util.c)
csdutil_ldflags := -Lcapi/ -lcapi -lezxml -lblobmsg_json -lubox -lubus -lscapi
csdutil_cflags := -I./include/ -I./capi/include/ -DPACKAGE_ID=\"csdutil\" -DLOGGING_ID="csdutil"



include make.inc
