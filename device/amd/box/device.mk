#
# Copyright (C) 2026 Android TV ROM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device identifier
PRODUCT_NAME := box
PRODUCT_DEVICE := box
PRODUCT_BRAND := Android
PRODUCT_MODEL := Android TV Box
PRODUCT_MANUFACTURER := AMD

# Android TV
PRODUCT_CHARACTERISTICS := tv,nosdcard
PRODUCT_IS_ATV := true

# Overlays
DEVICE_PACKAGE_OVERLAYS := device/amd/box/overlay

# WiFi
PRODUCT_PACKAGES += \
    wpa_supplicant \
    wpa_supplicant.conf \
    hostapd \
    dhcpcd \
    libnl

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default \
    audio.a2dp.default \
    libbt-hci \
    bt_stack.conf \
    bt_did.conf \
    libbt-vendor

# Audio
PRODUCT_PACKAGES += \
    audio.primary.box \
    audio.r_submix.default \
    audio.usb.default \
    tinymix \
    tinyplay \
    tinycap \
    tinypcminfo

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libGLES_mali

# Media
PRODUCT_PACKAGES += \
    libmediaplayerservice \
    libffmpeg

# System UI
PRODUCT_PACKAGES += \
    TvSettings \
    TvProvider \
    LeanbackLauncher

# Key layouts
PRODUCT_COPY_FILES += \
    device/amd/box/keylayout/Vendor_045e_Product_028b.kl:system/usr/keylayout/Vendor_045e_Product_028b.kl \
    device/amd/box/keylayout/Vendor_045e_Product_028b.kcm:system/usr/keychars/Vendor_045e_Product_028b.kcm

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Init scripts
PRODUCT_COPY_FILES += \
    device/amd/box/init.box.rc:root/init.box.rc \
    device/amd/box/init.box.usb.rc:root/init.box.usb.rc \
    device/amd/box/ueventd.box.rc:root/ueventd.box.rc \
    device/amd/box/fstab.box:root/fstab.box

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320 \
    ro.opengles.version=196608 \
    hwui.render_dirty_regions=false \
    ro.zygote.disable_gl_preload=true \
    persist.sys.dun.override=0 \
    ro.build.product=box \
    ro.build.device=box

# WiFi properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Bluetooth properties
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.enable_timeout_ms=1200000 \
    ro.bluetooth.dun_supported=true \
    ro.bluetooth.hfp.ver=1.6

# Media codecs
PRODUCT_COPY_FILES += \
    device/amd/box/media_codecs.xml:system/etc/media_codecs.xml \
    device/amd/box/media_profiles.xml:system/etc/media_profiles.xml

# SELinux
PRODUCT_SEPOLICY += device/amd/box/sepolicy

# OTA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.rollingback=1

$(call inherit-product-if-exists, vendor/amd/box-vendor.mk)