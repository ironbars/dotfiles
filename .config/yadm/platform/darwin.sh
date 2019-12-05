MYADM_CHECK_INSTALLED_CMD="brew ls --versions"
MYADM_INSTALL_CMD="brew install"
MYADM_OS_PKGS=("vim" "xz")
MYADM_OS_VIM_PLUGINS=()


myadm_pkg_mgr_prep() {
  command -v brew > /dev/null 2>&1

  # This should never be the case, but why tempt fate?
  if [[ $? -ne 0 ]]; then
    yellow_echo "WARNING: Homebrew not installed"
    yellow_echo "--> Installing Homebrew"

    /usr/bin/ruby -e "$(
      curl -fsSL \
      https://raw.githubusercontent.com/Homebrew/install/master/install
    )"
  fi
}
