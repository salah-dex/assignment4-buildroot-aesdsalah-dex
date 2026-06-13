
##############################################################
#
# AESD-ASSIGNMENTS
#
# Use your latest code to cross compile an aesdsocket application for the target by running make from the server subdirectory.

# Install your aesdsocket executable to /usr/bin

# Install your aesdsocket-start-stop script to /etc/init.d/S99aesdsocket
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 5 git contents
AESD_ASSIGNMENTS_VERSION = 5378a5eea9bf888e9c053c7bc43d2fcbdd0e2a93
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:salah-dex/assignment5-aesdsalah-dex.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
