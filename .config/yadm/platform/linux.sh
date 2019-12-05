MYADM_OS_VIM_PLUGINS=(
  "https://github.com/alok/notational-fzf-vim.git"
  "https://github.com/ironbars/nvlinks.git"
)


myadm_check_linux() {
  os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"

  case "${os}" in
    "arch")
      source "${MYADM_DIR}"/platform/linux/arch.sh
      ;;
    "fedora")
      source "${MYADM_DIR}"/platform/linux/fedora.sh
      ;;
    *)
      die "Unsupported OS"
      ;;
  esac
}
