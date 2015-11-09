# Paths and settings
TARGET_PRODUCT = vbox86tp
ANDROID_ROOT   = /home/android/aosp/android
# ANDROID_ROOT   = /media/xyz/aosp/android-4.4.4_r2
BIONIC_LIBC    = $(ANDROID_ROOT)/bionic/libc
PRODUCT_OUT    = $(ANDROID_ROOT)/out/target/product/$(TARGET_PRODUCT)
CROSS_COMPILE  = \
    $(ANDROID_ROOT)/prebuilts/gcc/linux-x86/x86/i686-linux-android-4.7/bin/i686-linux-android-
#    $(ANDROID_ROOT)/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/bin/x86_64-linux-android-
KDIR           = $(PRODUCT_OUT)/obj/KERNEL_OBJ/usr

# Tool names
AS            = $(CROSS_COMPILE)as
AR            = $(CROSS_COMPILE)ar
CC            = $(CROSS_COMPILE)gcc
CPP           = $(CC) -E
LD            = $(CROSS_COMPILE)ld
NM            = $(CROSS_COMPILE)nm
OBJCOPY       = $(CROSS_COMPILE)objcopy
OBJDUMP       = $(CROSS_COMPILE)objdump
RANLIB        = $(CROSS_COMPILE)ranlib
READELF       = $(CROSS_COMPILE)readelf
SIZE          = $(CROSS_COMPILE)size
STRINGS       = $(CROSS_COMPILE)strings
STRIP         = $(CROSS_COMPILE)strip

export AS AR CC CPP LD NM OBJCOPY OBJDUMP RANLIB READELF \
         SIZE STRINGS STRIP

# Build settings
CFLAGS        = -O2 -Wall -fno-short-enums
HEADER_OPS    = -I$(BIONIC_LIBC)/arch-x86/include \
                -I$(BIONIC_LIBC)/kernel/common \
                -I$(BIONIC_LIBC)/kernel/arch-x86 \
                -I$(PRODUCT_OUT)/obj/KERNEL_OBJ/usr/include \
                -I$(BIONIC_LIBC)/include \
                -I$(ANDROID_ROOT)/kernel/include
                
LDFLAGS       = -nostdlib -Wl,-dynamic-linker,/system/bin/linker \
                $(PRODUCT_OUT)/obj/lib/crtbegin_dynamic.o \
                $(PRODUCT_OUT)/obj/lib/crtend_android.o \
                -L$(PRODUCT_OUT)/obj/lib -lc -ldl
