# Remember, we are assuming the inability/aversion to install additional  
# packages, so we don't want much to happen here
# The check installed command may be useful in the future, so I'm leaving  
# it here for now
# MYADM_CHECK_INSTALLED_CMD=(yum list installed)

# This workaround is here because I can't unset the common pkgs varaiable; 
# it's read only.  I could change that, but I don't want to.
MYADM_CHECK_INSTALLED_CMD=(/bin/true)
MYADM_INSTALL_CMD=(sudo yum install)
MYADM_OS_PKGS=()

_USER_BIN_PATH="${HOME}"/.local/bin
_FZF_INSTALL_PATH="${HOME}"/.local/fzf
_FZF_URL="https://github.com/junegunn/fzf.git"
_RG_VERSION=11.0.2
_RG_TARBALL="ripgrep-${_RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
_RG_INSTALL_PATH="${rg_tarball%%.*}"
_RG_URL="https://github.com/BurntSushi/ripgrep/releases/download/${_RG_VERSION}/${_RG_TARBALL}"


_install_fzf() {
  git clone --depth 1 "${_FZF_URL}" "${_FZF_INSTALL_PATH}"
  (cd "${_FZF_INSTALL_PATH}" && ./install --bin)
  ln -s "${_FZF_INSTALL_PATH}"/bin/fzf "${_USER_BIN_PATH}"/fzf
}


_install_ripgrep() {
  curl -L -O "${_RG_URL}"
  tar xzf "${_RG_TARBALL}"
  cp "${_RG_INSTALL_PATH}"/rg "${_USER_BIN_PATH}"
  rm "${_RG_TARBALL}"
  rm -rf "${_RG_INSTALL_PATH}"
}


myadm_pkg_mgr_prep() {
  yellow_echo "WARNING: No packages will be installed system-wide."
  yellow_echo "Installing fzf and ripgrep for current user."
  unset MYADM_OS_VIM_PLUGINS

  [[ ! -d "${_USER_BIN_PATH}" ]] && mkdir -p "${_USER_BIN_PATH}"

  _install_fzf
  _install_ripgrep
}
