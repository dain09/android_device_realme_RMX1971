#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
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
# CRITICAL FIX: Add 'wlan' namespace to resolve hostapd build error.
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    bootable/deprecated-ota \
    vendor/qcom/opensource/usb/etc \
    hardware/qcom-caf/sdm845 \
    hardware/qcom-caf/wlan \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/qcom-caf/common/libqti-perfd-client \
    hardware/nxp

# Dexpreopt configuration for faster boot
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt

# Disable APEX compression for some devices
OVERRIDE_PRODUCT_COMPRESSED_APEX := false
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := true

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
    libaudio-resampler \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener \
    libcirrusspkrprot \
    libspkrprot \
    libhdmiedid \
    liba2dpoffload \
    libexthwplugin \
    libhfp \
    libbatterylistener \
    libsndmonitor \
    tinymix


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
    gralloc.sdm710 \
    hwcomposer.qcom \
    libvulkan \
    vendor.qti.hardware.memtrack-service \
    vendor.qti.hardware.display.allocator@1.0-service

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
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    qti-telephony-utils-prd \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_BOOT_JARS += telephony-ext

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
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    WifiOverlay \
    TetheringConfigOverlay \
    wpa_supplicant \
    wpa_supplicant.conf \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    firmware_wlan_mac.bin_symlink

# --- Ramdisk ---
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.RealmeParts.rc \
    init.oppo.rc \
    init.oppo.display.rc \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.power.rc \
    init.qti.chg_policy.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc \
    usb_compositions.conf

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
    $(LOCAL_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/audio/usbv2_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usbv2_audio_policy_configuration.xml \
    $(AUDIO_CONFIG_DIR)/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(AUDIO_CONFIG_DIR)/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(AUDIO_CONFIG_DIR)/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_i2s.xml \
    $(AUDIO_CONFIG_DIR)/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_ODM)/etc/sound_trigger_platform_info.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml

# --- Media ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml

# --- Permissions & Other Configs ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

#========================================
# Overlays
#========================================
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *
