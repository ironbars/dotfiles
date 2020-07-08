readonly _RED="$(tput setaf 1)"
readonly _YELLOW="$(tput setaf 3)"
readonly _NC="$(tput sgr 0)"


die() {
  echo "$@" >&2
  exit 1
}


red_echo() {
  echo "${_RED}$@${_NC}"
}


yellow_echo() {
  echo "${_YELLOW}$@${_NC}"
}


myadm_check_installed_pkgs() {
  pkgs=("$@")

  for pkg in "${pkgs[@]}"; do
    "${MYADM_CHECK_INSTALLED_CMD[@]}" "${pkg}" > /dev/null 2>&1

    if (( $? != 0 )); then
      MYADM_PKGS_TO_INSTALL+=("${pkg}")
    fi
  done
}
