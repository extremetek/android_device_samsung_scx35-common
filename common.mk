# Copyright (C) 2014 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/scx35-common

# Inherit from AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Bluetooth config
BLUETOOTH_CONFIGS := \
	$(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
	$(foreach f,$(BLUETOOTH_CONFIGS),$(f):system/etc/bluetooth/$(notdir $(f)))

# Keylayouts
KEYLAYOUTS := \
	$(LOCAL_PATH)/keylayout/sec_touchscreen.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUTS),$(f):system/usr/keylayout/$(notdir $(f)))

# Media config
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/configs/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_codecs_performance.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni

# HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	gralloc.sc8830 \
	hwcomposer.sc8830 \
	sprd_gsp.sc8830 \
	libmemoryheapion \
	libion_sprd

# Codecs
PRODUCT_PACKAGES += \
	libcolorformat_switcher \
	libstagefrighthw \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default

# Audio
PRODUCT_PACKAGES += \
	audio.primary.sc8830 \
	libaudio-resampler \
	libatchannel_wrapper

AUDIO_CONFIGS := \
	$(LOCAL_PATH)/configs/audio/audio_hw.xml \
	$(LOCAL_PATH)/configs/audio/audio_para \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio/codec_pga.xml \
	$(LOCAL_PATH)/configs/audio/tiny_hw.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/etc/$(notdir $(f))) \

# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim

# FM radio
PRODUCT_PACKAGES += \
	fm.sc8830

# GPS
GPS_CONFIGS := \
	$(LOCAL_PATH)/configs/gps/gps.xml \

PRODUCT_COPY_FILES += \
	$(foreach f,$(GPS_CONFIGS),$(f):system/etc/$(notdir $(f)))

# Wifi
PRODUCT_PACKAGES += \
	macloader

# PowerHAL
PRODUCT_PACKAGES += \
	power.sc8830

WIFI_CONFIGS := \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/nvram_net.txt

PRODUCT_COPY_FILES += \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))

# Rootdir files
ROOTDIR_FILES := \
	$(LOCAL_PATH)/rootdir/init.board.rc \
	$(LOCAL_PATH)/rootdir/init.wifi.rc \
	$(LOCAL_PATH)/rootdir/fstab.sc8830

PRODUCT_COPY_FILES += \
	$(foreach f,$(ROOTDIR_FILES),$(f):root/$(notdir $(f)))

# System init .rc files
SYSTEM_INIT_RC_FILES := \
	device/samsung/scx30g_v2-common/system/etc/init/at_distributor.rc \
	device/samsung/scx30g_v2-common/system/etc/init/chown_service.rc \
	device/samsung/scx30g_v2-common/system/etc/init/data.rc \
	device/samsung/scx30g_v2-common/system/etc/init/dns.rc \
	device/samsung/scx30g_v2-common/system/etc/init/engpc.rc \
	device/samsung/scx30g_v2-common/system/etc/init/gpsd.rc \
	device/samsung/scx30g_v2-common/system/etc/init/hostapd.rc \
	device/samsung/scx30g_v2-common/system/etc/init/kill_phone.rc \
	device/samsung/scx30g_v2-common/system/etc/init/macloader.rc \
	device/samsung/scx30g_v2-common/system/etc/init/mediacodec.rc \
	device/samsung/scx30g_v2-common/system/etc/init/mediaserver.rc \
	device/samsung/scx30g_v2-common/system/etc/init/modem_control.rc \
	device/samsung/scx30g_v2-common/system/etc/init/modemd.rc \
	device/samsung/scx30g_v2-common/system/etc/init/nvitemd.rc \
	device/samsung/scx30g_v2-common/system/etc/init/p2p_supplicant.rc \
	device/samsung/scx30g_v2-common/system/etc/init/phoneserver.rc \
	device/samsung/scx30g_v2-common/system/etc/init/refnotify.rc \
	device/samsung/scx30g_v2-common/system/etc/init/rild.rc \
	device/samsung/scx30g_v2-common/system/etc/init/set_mac.rc \
	device/samsung/scx30g_v2-common/system/etc/init/smd_symlink.rc \
	device/samsung/scx30g_v2-common/system/etc/init/swap.rc \
	device/samsung/scx30g_v2-common/system/etc/init/wpa_supplicant.rc \

PRODUCT_COPY_FILES += \
	$(foreach f,$(SYSTEM_INIT_RC_FILES),$(f):system/etc/init/$(notdir $(f)))

# Permissions
PERMISSIONS_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.midi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSIONS_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.fw.dex2oat_thread_count=4 \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
