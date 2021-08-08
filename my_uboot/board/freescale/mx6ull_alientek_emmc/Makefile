# (C) Copyright 2015 Freescale Semiconductor, Inc.
#
# 添加开发板对应的板级文件夹，是该目录下的整个文件夹的修改
# 本文件为修改的makefile
#
# SPDX-License-Identifier:	GPL-2.0+
#

obj-y  := mx6ull_alientek_emmc.o

extra-$(CONFIG_USE_PLUGIN) :=  plugin.bin
$(obj)/plugin.bin: $(obj)/plugin.o
	$(OBJCOPY) -O binary --gap-fill 0xff $< $@
