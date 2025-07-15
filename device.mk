#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Core device configuration for Realme 5 Pro (RMX1971)
#

#========================================
# Platform & Inheritance
#========================================
PRODUCT_BOARD_PLATFORM := sdm845
PRODUCT_USES_QCOM_HARDWARE := true

# Set product launch API level (Pie)
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)

# Inherit from base AOSP product definitions
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from proprietary vendor blobs
$(call inherit-product, vendor/realme/RMX1971/RMX1971-vendor.mk)

# Inherit from common Qualcomm CAF configurations
$(call inherit-product, hardware/qcom-caf/common/common.mk)


#========================================
# Soong & Build System Configs
#========================================
# Use our custom init library
$(call soong_config_set,libinit,vendor_init_lib,//$(LOCAL_PATH):libinit_RMX1971)

# Soong namespaces for HALs and other modules
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/sdm845 \
    vendor/qcom/opensource/usb/etc \
    hardware/lineage/interfaces/power-libperfmgr

# Dexpreopt configuration for faster boot
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt

# Disable APEX compression for some devices
OVERRIDE_PRODUCT_COMPRESSED_APEX := false


#========================================
# Packages - Device Features & HALs
#========================================
# ANT+
PRODUCT_PACKAGES += AntHalService-Soong

# --- Audio ---
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    audio.r_submix.default \
    audio.usbv2.default \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio-impl \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    tinymix

# CRITICAL: Path to local Dolby blobs - Corrected paths based on your screenshots.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/dolby/DolbySound/DolbySound.apk:$(TARGET_COPY_OUT_PRODUCT)/priv-app/DolbySound/DolbySound.apk \
    $(LOCAL_PATH)/vendor/dolby/proprietary/vendor/lib/soundfx/libswdap.so:$(TARGET_COPY_OUT_PRODUCT)/lib/libswdap.so \
    $(LOCAL_PATH)/vendor/dolby/proprietary/vendor/lib64/soundfx/libswdap.so:$(TARGET_COPY_OUT_PRODUCT)/lib64/libswdap.so \
    $(LOCAL_PATH)/vendor/dolby/configs/dax/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml

PRODUCT_PACKAGES += \
    DolbySound \
    libswdap

# --- Biometrics ---
PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.1-service.RMX1971

# --- Camera ---
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64

# --- Display & Graphics ---
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    vendor.qti.hardware.display.allocator@1.0-service \
    gralloc.sdm710 \
    hwcomposer.qcom \
    libvulkan \
    vendor.qti.hardware.memtrack-service

# --- DRM ---
PRODUCT_PACKAGES += android.hardware.drm-service.clearkey

# --- FM Radio ---
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# --- Lights ---
PRODUCT_PACKAGES += android.hardware.light-service.lineage

# --- LineageOS Features ---
PRODUCT_PACKAGES += \
    RealmeDoze \
    RealmeParts \
    vendor.lineage.health-service.default \
    vendor.lineage.livedisplay@2.0-service-sdm \
    QuickAccessWallet

# --- Power & Performance ---
PRODUCT_PACKAGES += \
    android.hardware.power-service.lineage-libperfmgr \
    libqti-perfd-client \
    vendor.qti.hardware.perf@2.0.vendor \
    libsuspend

# --- Sensors ---
PRODUCT_PACKAGES += android.hardware.sensors@2.0-service.multihal.RMX1971

# --- Telephony ---
PRODUCT_PACKAGES += \
    ims-ext-common \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

# --- Thermal ---
PRODUCT_PACKAGES += android.hardware.thermal-service.qti

# --- USB ---
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service.dual_role_usb \
    android.hardware.usb.gadget-service.qti

# --- Vibrator ---
PRODUCT_PACKAGES += vendor.qti.hardware.vibrator.service

# --- Wi-Fi ---
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    WifiOverlay \
    TetheringConfigOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    firmware_wlan_mac.bin_symlink


#========================================
# Files & Configurations to Copy
#========================================
# --- Audio ---
AUDIO_CONFIG_DIR := hardware/qcom-caf/sm8350/audio/configs/sdm710
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_ODM)/etc/mixer_paths.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    $(AUDIO_CONFIG_DIR)/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_platform_info.xml

# --- Component Overrides ---
PRODUCT_COPY_FILES += $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# --- GPS ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf

# --- Input ---
PRODUCT_COPY_FILES += $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# --- Media ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml

# --- Permissions ---
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    $(LOCAL_PATH)/configs/permissions/privapp_whitelist_org.device.Realmeparts.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp_whitelist_org.device.Realmeparts.xml

# --- Power & Thermal ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# --- Ramdisk ---
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.sh \
    init.target.rc \
    ueventd.qcom.rc

# --- Wi-Fi ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini


#========================================
# Overlays
#========================================
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# We are enforcing RRO targets for all packages
PRODUCT_ENFORCE_RRO_TARGETS := *
