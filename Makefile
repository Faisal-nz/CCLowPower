GO_EASY_ON_ME = 1
DEBUG = 0
TARGET = iphone:latest
ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCLowPower
CCLowPower_FILES = Tweak.xm
CCLowPower_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk