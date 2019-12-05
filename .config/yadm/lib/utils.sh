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
  check_installed_cmd="$1"
  shift
  pkgs=("$@")

  for pkg in "${pkgs[@]}"; do
    "${check_installed_cmd}" "${pkg}" > /dev/null 2>&1

    [[ $? -ne 0 ]] && MYADM_PKGS_TO_INSTALL+=("${pkg}")
  done
}