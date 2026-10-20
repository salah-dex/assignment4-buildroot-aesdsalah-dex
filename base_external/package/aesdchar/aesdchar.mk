### AESD CHAR DRIVER
# This package builds the aesdchar kernel module and installs it to the target rootfs
AESDCHAR_SITE = git@github.com:salah-dex/assignment8-aesdsalah-dex-.git
AESDCHAR_VERSION = 9da610b049ad6e572369c74e7105e837d6ac8d69
AESDCHAR_SITE_METHOD = git
AESDCHAR_LICENSE = GPL-2.0
AESDCHAR_LICENSE_FILES = COPYING


AESDCHAR_MODULE_SUBDIRS = aesd-char-driver

#install the aesdchar kernel module to /lib/modules/<kernel-version>/kernel/drivers/char
#install the kernel module loading script to /etc/init.d/S99aesdchar
define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/kernel/drivers/char/aesdchar.ko
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/load_aesdchar
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/unload_aesdchar
endef

#use kernel-module infrastructure
$(eval $(kernel-module))
#use package infrastructure
$(eval $(generic-package))