# Initialise device config
$(call inherit-product, device/samsung/zerofltexx/full_zerofltexx.mk)

# Enhanced NFC
# $(call inherit-product, vendor/gzosp/config/nfc_enhanced.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/gzosp/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="zerofltexx" \
    TARGET_DEVICE="zeroflte"

PRODUCT_NAME := gzosp_zerofltexx
PRODUCT_DEVICE := zerofltexx
