# ******************************************************************************** #
#       Copyright (c) 2015                                                         #
#       Lantiq Beteiligungs-GmbH & Co. KG                                          #
#       Lilienthalstrasse 15, 85579 Neubiberg, Germany                             #
#       For licensing information, see the file 'LICENSE' in the root folder of    #
#        this software module.                                                     #
# *******************************************************************************  #

PKG_NAME:= libugwhelper
bins := libugwhelper.so helper_test test_struct2list

libugwhelper.so_sources := $(wildcard *.c)
libugwhelper.so_cflags := -I./include/ 
libugwhelper.so_ldflags :=  -lhelper -lubox -lubus -lblobmsg_json -lscapi
	
helper_test_sources := $(wildcard test_util/test.c)
helper_test_cflags := -I./include/
helper_test_ldflags := -lhelper -lubox -lubus -lblobmsg_json -L./ -lugwhelper

test_struct2list_sources := $(wildcard test_util/test_struct2list.c)
test_struct2list_cflags := -I./include/
test_struct2list_ldflags := -lhelper -lubox -lubus -lblobmsg_json -L./ -lugwhelper


include make.inc
