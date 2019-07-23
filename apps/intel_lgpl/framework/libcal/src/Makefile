# ******************************************************************************** #
#       Copyright (c) 2015                                                         #
#       Lantiq Beteiligungs-GmbH & Co. KG                                          #
#       Lilienthalstrasse 15, 85579 Neubiberg, Germany                             #
#       For licensing information, see the file 'LICENSE' in the root folder of    #
#        this software module.                                                     #
# *******************************************************************************  #

PKG_NAME := libcal

bins := libcal.so test_sample/caltest

libcal.so_sources := $(wildcard *.c)
libcal.so_ldflags := -lcapi -lubox -lubus -lhelper -lugwhelper -lblobmsg_json

caltest_sources := $(wildcard test_sample/*.c)
caltest_cflags := -I./
caltest_ldflags := -L./ -lcal -lcapi -lhelper  -lugwhelper -lezxml -lubox -lubus -lblobmsg_json

include make.inc
