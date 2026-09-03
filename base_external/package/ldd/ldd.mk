################################################################################
#
# ldd Makefile
#
################################################################################
LDD_VERSION = 50d1484c8d0d34fa0345d2188b6a5397463cc741
LDD_SITE = git@github.com:salah-dex/assignment7-aesdsalah-dex-part2.git
LDD_SITE_METHOD = git
LDD_LICENSE = GPL-2.0
LDD_LICENSE_FILES = COPYING

# Specify the subdirectories containing kernel modules
LDD_MODULE_SUBDIRS = scull misc-modules

# Use kernel-module infrastructure
$(eval $(kernel-module))
# Use  Generic package infrastructure
$(eval $(generic-package))