#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    vendor.wifi.autochmod.sh \
    init.oppo.wifi.debug.sh \
    init.oppo.fingerprints.sh \
    init.oppo.bt.debug.sh \
    init.oppo.face.sh \
    swap_enable.sh \
    oppo-install-recovery.sh \
    init.oppo.face_calib.sh \
    engineer_vendor_shell.sh \

PRODUCT_PACKAGES += \
    fstab.mt6853 \
    init.aee.rc \
    multi_init.rc \
    init.ago.rc \
    init.oppo.reserve.rc \
    factory_init.rc \
    init.sensor_2_0.rc \
    meta_init.modem.rc \
    init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    init.connectivity.rc \
    factory_init.connectivity.rc \
    init.project.rc \
    init.mt6853.rc \
    factory_init.project.rc \
    meta_init.connectivity.rc \
    init.mt6853.usb.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6853:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6853

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/realme/RMX3092/RMX3092-vendor.mk)
