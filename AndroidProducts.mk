#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/lineage_iPhone.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += lineage_iPhone-$(build_type)))
