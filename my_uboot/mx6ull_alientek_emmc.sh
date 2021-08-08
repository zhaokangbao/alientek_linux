#!/bin/bash

# ARCH设置uboot编译的架构，本次编译的arm架构
# CROSS_COMPILE设置交叉编译器的前缀
# 上面的两个都是uboot顶层makefile的变量

# 使用distclean参数清理工程
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
# 配置uboot，因为uboot适应不同的板子，所以需要设置一下本次使用的版本的默认配置
# 根据默认配置中的信息写入配置项到.config文件，这个文件是新生成的
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- mx6ull_alientek_emmc_defconfig
# V=1 选项表示打印出编译的详细过程
# -j12 表示使用12核编译
# 编译完成生成u-boot.bin文件，但是不能直接烧写进入芯片，需要添加头部信息
# uboot编译最后会通过/tools/mkimage软件添加头部信息，生成u-boot.imx文件，烧写该文件
make V=1 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j12