#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Main product definition for Realme 5 Pro (RMX1971)
#

#========================================
# Feature Flags & Theming
#========================================
# Set boot animation resolution to 1080p
TARGET_BOOT_ANIMATION_RES := 1080

# Enable LineageOS Quick Tap feature (double tap on back)
TARGET_SUPPORTS_QUICK_TAP := true


#========================================
# Product Inheritance
#========================================
# Inherit device-specific configurations first from device.mk.
# This is the most important part, containing all our device-specific definitions.
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit common LineageOS configurations for a full phone experience.
# This must come AFTER device.mk to allow our device to override common settings.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)


#========================================
# Product Identity
#========================================
# These values define the device's identity in the system.
PRODUCT_DEVICE := RMX1971
PRODUCT_NAME := lineage_RMX1971
PRODUCT_BRAND := realme
PRODUCT_MANUFACTURER := realme

# TWEAK: Set a user-friendly model name that appears in "About phone".
PRODUCT_MODEL := Realme 5 Pro

# This is required for Google Mobile Services (GMS) to work correctly.
PRODUCT_GMS_CLIENTID_BASE := android-oppo


#========================================
# Build Properties Override
#========================================
# Spoof build fingerprint and description to match the stock firmware.
# CRITICAL: This helps pass SafetyNet and makes banking/DRM apps work.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="RMX1971-user 11 RKQ1.201217.002 1623376276806 release-keys" \
    BuildFingerprint=realme/RMX1971/RMX1971:11/RKQ1.201217.002/1623376276806:user/release-keys

#========================================
# Build Signing
#========================================
# Sign the build with release keys.
# Make sure you have your keys located at vendor/lineage-priv/keys/releasekey
# or the build will use the default insecure test keys.
#PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/releasekey
