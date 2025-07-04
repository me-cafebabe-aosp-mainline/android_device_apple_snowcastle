#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_mini_phone.mk)

# Inherit from device
$(call inherit-product, device/apple/snowcastle/device.mk)

PRODUCT_NAME := lineage_snowcastle
PRODUCT_DEVICE := snowcastle
PRODUCT_BRAND := Apple
PRODUCT_MANUFACTURER := Apple
PRODUCT_MODEL := snowcastle
