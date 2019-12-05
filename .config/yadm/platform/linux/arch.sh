MYADM_CHECK_INSTALLED_CMD="pacman -Qi"
MYADM_INSTALL_CMD="sudo pacman --noconfirm -S"
# Although I would like to only install things that make my system usable
# with my current configs, Arch needs some additional things installed to
# make the system usable at all
MYADM_OS_PKGS=("man-db" "man-pages" "python" "ruby" "p7zip")


myadm_pkg_mgr_prep() {
  sudo pacman -Fy
}
