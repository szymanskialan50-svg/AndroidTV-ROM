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

# Platform
TARGET_BOARD_PLATFORM := amd
TARGET_BOOTLOADER_BOARD_NAME := box

# Architecture
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_CPU_ABI := x86_64
TARGET_CPU_ABI2 := x86
TARGET_CPU_VARIANT := generic

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS0,115200n8 earlyprintk=ttyS0,115200n8 androidboot.hardware=box androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_ARCH := x86_64
TARGET_KERNEL_SOURCE := kernel/google/goldfish
TARGET_KERNEL_CONFIG := goldfish_defconfig

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5368709120
BOARD_FLASH_BLOCK_SIZE := 131072

# Filesystem
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := device/amd/box/recovery.fstab

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/amd/box/egl.cfg
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/amd/box/bluetooth

# WiFi
BOARD_WLAN_DEVICE := realtek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl

# SELinux
BOARD_SEPOLICY_DIRS := device/amd/box/sepolicy

# Properties
TARGET_SYSTEM_PROP := device/amd/box/system.prop

# Enable dex-preoptimization
WITH_DEXPREOPT := true
DONT_DEXPREOPT_PREBUILTS := true

# Build
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_RADIO := true