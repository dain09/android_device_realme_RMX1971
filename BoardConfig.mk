#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/RMX1971

#==============================
# Build Flags & Tweaks
#==============================
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
TARGET_USES_ION := true
TARGET_LTO_GLOBAL_THIN := true
# تعطيل voice_processing من QCOM العادي
TARGET_EXCLUDES_AUDIO_EFFECTS := true
# استخدم إصدار CAF فقط للصوت
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_CAF_AUDIOHAL := true

# تعطيل تأثيرات الصوت القديمة
TARGET_EXCLUDES_AUDIO_EFFECTS := true

# تحديد مسار HAL الصوت لاستخدام CAF
AUDIO_HARDWARE := audio.a2dp.default audio.primary.sdm710 audio.r_submix.default audio.usb.default
AUDIO_HAL_DIR := hardware/qcom-caf/sdm845/audio/hal

#==============================
# Architecture
#==============================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a75
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

#==============================
# Platform & Bootloader
#==============================
TARGET_BOARD_PLATFORM := sdm710
TARGET_BOOTLOADER_BOARD_NAME := sdm710
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := RMX1971,RMX1971CN

#==============================
# Kernel
#==============================
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0xA90000 \
    androidboot.hardware=qcom \
    androidboot.console=ttyMSM0 \
    msm_rtb.filter=0x237 \
    ehci-hcd.park=3 \
    lpm_levels.sleep_disabled=1 \
    service_locator.enable=1 \
    androidboot.configfs=true \
    androidboot.usbcontroller=a600000.dwc3 \
    swiotlb=1 \
    loop.max_part=7 \
    kpti=off \
    androidboot.init_fatal_reboot_target=recovery \
    cgroup_disable=pressure

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_SOURCE := kernel/realme/sdm710
TARGET_KERNEL_CONFIG := sdm670-perf_defconfig
TARGET_KERNEL_APPEND_DTB := false

# Clang Toolchain
TARGET_KERNEL_CLANG_VERSION := 13.0.1
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/clang-toolchain
TARGET_KERNEL_LLVM_BINUTILS := true
TARGET_KERNEL_ADDITIONAL_FLAGS += \
    LLVM=1 \
    LLVM_IAS=1 \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

#==============================
# Partitions
#==============================
AB_OTA_UPDATER := false

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4096000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114898743296
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_ODMIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_ODM := odm

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

#==============================
# Display
#==============================
TARGET_SCREEN_DENSITY := 420
TARGET_HAS_HDR_DISPLAY := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_DISABLED_UBWC := true

#==============================
# Audio
#==============================
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

#==============================
# Wi-Fi
#==============================
BOARD_WLAN_DEVICE := qcwcn
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

#==============================
# Power
#==============================
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

#==============================
# Root FS
#==============================
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/bt_firmware:/bt_firmware \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware

#==============================
# Recovery
#==============================
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

#==============================
# Properties
#==============================
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

#==============================
# HIDL & Compatibility
#==============================
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    vendor/lineage/config/device_framework_matrix.xml

DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

#==============================
# Security
#==============================
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

#==============================
# RIL
#==============================
ENABLE_VENDOR_RIL_SERVICE := true

#==============================
# Sepolicy
#==============================
include device/qcom/sepolicy_vndr/SEPolicy.mk
include device/lineage/sepolicy/libperfmgr/sepolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

BOARD_SEPOLICY_M4DEFS += \
    persist_camera_prop=vendor_persist_camera_prop

#==============================
# Releasetools
#==============================
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)
