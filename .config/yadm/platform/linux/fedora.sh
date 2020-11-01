MYADM_CHECK_INSTALLED_CMD=(dnf info installed)
MYADM_INSTALL_CMD=(sudo dnf install -y)
MYADM_OS_PKGS=("ncompress" "p7zip-plugins" "bzip2")


myadm_pkg_mgr_prep() {
  sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-30.noarch.rpm
  sudo dnf install -y \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-30.noarch.rpm
} 
