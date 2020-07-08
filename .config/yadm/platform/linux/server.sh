# These functions and settings are for when:
# 1. we don't want to install anything system-wide
# 2. we can't install anything system-wide
# 3. we want to install packages not available in OS repositories
#
# This includes servers (e.g. when at work) and older versions of Ubuntu and 
# Debian.  

# This workaround is here because I can't unset the common pkgs varaiable; 
# it's read only.  I could change that, but I don't want to.
MYADM_CHECK_INSTALLED_CMD=(/bin/true)
MYADM_OS_PKGS=()

_USER_BIN_PATH="${HOME}/.local/bin"
_FZF_INSTALL_PATH="${HOME}/.local/fzf"
_FZF_URL="https://github.com/junegunn/fzf.git"
_RG_VERSION=11.0.2
_RG_TARBALL="ripgrep-${_RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
_RG_INSTALL_PATH="${_RG_TARBALL%%.tar.gz}"
_RG_URL="https://github.com/BurntSushi/ripgrep/releases/download/${_RG_VERSION}/${_RG_TARBALL}"


_install_fzf() {
  git clone --depth 1 "${_FZF_URL}" "${_FZF_INSTALL_PATH}"
  (cd "${_FZF_INSTALL_PATH}" && ./install --bin)
  ln -s "${_FZF_INSTALL_PATH}/bin/fzf" "${_USER_BIN_PATH}/fzf"
}


_install_ripgrep() {
  curl -L -O "${_RG_URL}"
  tar xzf "${_RG_TARBALL}"
  cp "${_RG_INSTALL_PATH}/rg" "${_USER_BIN_PATH}"
  rm "${_RG_TARBALL}"
  rm -rf "${_RG_INSTALL_PATH}"
}


_user_install_pkgs() {
  yellow_echo "Installing packages for current user."

  [[ ! -d "${_USER_BIN_PATH}" ]] && mkdir -p "${_USER_BIN_PATH}"

  _install_fzf
  _install_ripgrep
}


myadm_pkg_mgr_prep() {
  yellow_echo "WARNING: No packages will be installed system-wide."
  unset MYADM_OS_VIM_PLUGINS

  _user_install_pkgs
}
