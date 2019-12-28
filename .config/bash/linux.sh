ls_opts='-F --group-directories-first --time-style=+"%Y.%m.%d %H:%M" --color=auto'
la_opts="-a ${ls_opts}"
ll_opts="-l ${ls_opts}"
os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"
# Remove quotes if present
os="${os#\"}"
os="${os%\"}"

source ~/.config/bash/"${os}".sh > /dev/null 2>&1

if [[ $? -ne 0 ]]; then
  echo "Unsupported OS" >&2
  return
fi
