#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_APPLE_SNOWCASTLE := true

# Inherit from mainline/common
include device/mainline/common/BoardConfigMainlineCommon.mk

# A/B
AB_OTA_UPDATER := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Boot parameters
BOARD_KERNEL_CMDLINE := \
    $(MAINLINE_COMMON_ANDROIDBOOT_PARAMS) \
    $(MAINLINE_COMMON_KERNEL_PARAMS) \
    androidboot.hardware=snowcastle \
    androidboot.partition_map=nvme0n1p1,base \
    androidboot.use_tmpfs_userdata=1 \
    androidboot.verifiedbootstate=orange \
    console=tty0

# Display
TARGET_SCREEN_DENSITY := 400

# Filesystem
BOARD_EROFS_BLOCKSIZE := 16384
BOARD_F2FS_BLOCKSIZE := 16384
BOARD_ROOT_EXTRA_FOLDERS := apfs
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
TARGET_BOOTS_16K := true

ifneq ($(wildcard device/apple/snowcastle-kernel/Image.gz-dtb),)
$(warning Using prebuilt kernel)
TARGET_PREBUILT_KERNEL := device/apple/snowcastle-kernel/Image.gz-dtb
else
$(warning Using source-built kernel)
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_SOURCE := kernel/apple

TARGET_KERNEL_CONFIG := \
    defconfig

TARGET_KERNEL_CONFIG_EXT := \
    kernel/mainline/configs/fragments/y/arm64/gki_pre.config \
    kernel/mainline/configs/fragments/y/arm64/gki.config \
    kernel/mainline/configs/fragments/y/arm64/gki_post.config \
    kernel/mainline/configs/fragments/y/arm64/pagesize-16k.config \
    kernel/mainline/configs/fragments/y/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config \
    $(DEVICE_PATH)/kconfigs/iphone.config
endif

# OTA
TARGET_SKIP_OTA_PACKAGE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 67108864
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 67108864

# Platform
TARGET_BOARD_PLATFORM := snowcastle

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/configs/fstab.snowcastle

# VINTF
DEVICE_MANIFEST_FILE := \
    $(DEVICE_PATH)/configs/manifest.xml
