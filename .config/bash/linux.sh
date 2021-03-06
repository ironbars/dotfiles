ls_opts='-F --group-directories-first --time-style=+"%Y.%m.%d %H:%M" --color=auto'
la_opts="-a ${ls_opts}"
ll_opts="-l ${ls_opts}"
os="$(grep '^ID=' /etc/os-release)"
os="${os#*=}"
# Remove quotes if present
os="${os#\"}"
os="${os%\"}"

source "${HOME}/.config/bash/${os}.sh" > /dev/null 2>&1

if (( $? != 0 )); then
  echo "Unsupported OS" >&2
  return
fi
