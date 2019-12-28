MYADM_OS_VIM_PLUGINS=(
  "https://github.com/alok/notational-fzf-vim.git"
  "https://github.com/ironbars/nvlinks.git"
)


myadm_check_linux() {
  local os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"
  os="${os%\"}"
  os="${os#\"}"

  source "${MYADM_DIR}"/platform/linux/"${os}".sh > /dev/null 2>&1

  if [[ $? -ne 0 ]]; then
    die "Unsupported OS"
  fi
}
