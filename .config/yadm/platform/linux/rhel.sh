# Remember, we are assuming the inability/aversion to install additional  
# packages, so we don't want much to happen here
# The check installed command may be useful in the future, so I'm leaving  
# it here for now
# MYADM_CHECK_INSTALLED_CMD=(yum list installed)

MYADM_INSTALL_CMD=(sudo yum install)

source "${MYADM_DIR}"/platform/linux/server.sh
