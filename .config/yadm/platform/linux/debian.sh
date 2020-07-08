# Older versions of Debian and Ubuntu don't have some of the packages that I 
# want in official repos.  Since I have provisions for installing these  
# applications without a package manger already, I'll just leverage what I've 
# already written.
_can_use_pkg_mgr() {
  local os
  local version
  
  os="$(basename "$0")"
  os="${os%.*}"
  version="$(grep '^VERSION_ID=' /etc/os-release)"
  version="${version#*=}"
  version="${version%\"}"
  version="${version#\"}"
  major_version="${version%%.*}"

  if [[ "${os}" = "ubuntu" ]]; then
    if (( major_version < 19 )); then
      # We'll consider this a failure and eventually fall back on our server 
      # install
      return 1
    fi
  else # Should only ever be Debian in this case
    if (( major_version < 10 )); then
      # Fall back to server install
      return 1
    fi
  fi

  return 0
}
    

myadm_pkg_mgr_prep() {
  sudo apt-get update
}


# MYADM_CHECK_INSTALLED_CMD=(dpkg -s)
MYADM_INSTALL_CMD=(sudo apt-get install)

# Check for WSL
if [[ "$(uname -r)" = *Microsoft ]]; then
  source "${MYADM_DIR}/platform/linux/wsl.sh"
fi

if ! _can_use_pkg_mgr; then
  source "${MYADM_DIR}/platform/linux/server.sh"
  return
fi

MYADM_CHECK_INSTALLED_CMD=(dpkg -s)
MYADM_OS_PKGS=()
