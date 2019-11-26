#
# ~/.bash_profile
#

# If not running interactively, dont do anything
[[ $- != *i* ]] && return

# Shell behavior variables
# -------------
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

# Environment variables
# -------------
export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export EDITOR=vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Prompt
# -------------
PS1='\[\e[0;36m\][\u@\h \W]\$\[\e[0m\] '

# Aliases
# -------------
case "${OSTYPE}" in
  "darwin"*)
    ls_opts="-GF"
    la_opts="-a ${ls_opts}"
    ll_opts="-l -T ${ls_opts}"
    pkg_add="brew install"
    pkg_remove="brew uninstall"
    pkg_search="brew search"
    ;;
  "linux-gnu")
    ls_opts='-F --group-directories-first --time-style=+"%Y.%m.%d %H:%M" --color=auto'
    la_opts="-a ${ls_opts}"
    ll_opts="-l ${ls_opts}"
    os="$(grep '^ID=' /etc/os-release | cut -f2 -d"=")"
    ;;
  *)
    echo "Unsupported platform" >&2
    exit 1
    ;;
esac

alias ls="ls ${ls_opts}"
alias la="ls ${la_opts}"
alias ll="ls ${ll_opts}"
alias grep="grep --color=tty -d skip"
alias cp="cp -i"
alias df="df -h"
alias bashrc="vim ~/.bash_profile"
alias vimrc="vim ~/.vim/vimrc"
alias sb="source ~/.bash_profile"
alias cn="cd ~/notes"
alias cv="cd ~/.vim/pack/dist/start/nvlinks"

if [[ -n "${os}" ]]; then
  case "${os}" in
    "arch")
      pkg_add="sudo pacman -S"
      pkg_remove="sudo pacman -Rsn"
      pkg_search="pacman -Ss"
      ;;
    "fedora")
      pkg_add="sudo dnf install"
      pkg_remove="sudo dnf autoremove"
      pkg_search="dnf search"
      ;;
    "ubuntu"|"debian")
      pkg_add="sudo apt-get install"
      pkg_remove="sudo apt-get autoremove"
      pkg_search="apt-cache search"
      ;;
    *)
      echo "Unsupported OS" >&2
      exit 1
      ;;
  esac
fi

alias add="${pkg_add}"
alias remove="${pkg_remove}"
alias search="${pkg_search}"

# Functions
# -------------
# ex - archive extractor
# usage: ex <archive>
ex() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2|*.tbz2)
        tar xjf "$1"
        ;;
      *.tar.gz|*.tgz) 
        tar xzf "$1"
        ;;
      *.bz2)
        bunzip2 "$1"
        ;;
      *.rar)
        unrar x "$1"
        ;;
      *.gz)
        gunzip "$1"
        ;;
      *.tar)
        tar xf "$1"
        ;;
      *.zip)
        unzip "$1"
        ;;
      *.Z)
        uncompress "$1"
        ;;
      *.7z)
        7z x "$1"
        ;;
      *)
        echo "'$1' cannot be extracted via ex()"
        return 1
        ;;
    esac

  else
    echo "'$1' is not a valid file"
    return 1
  fi
}

# csource - compile and execute C source on the fly
# usage: csource <source_file>
csource() {
  if [[ -z "$1" ]]; then
    echo "Missing operand"
    return 1
  fi

  local output_path="$(
    echo "$1" | 
    sed -e "s/^.*\/\|^/\/tmp\//" | 
    sed -e "s/\.c$//"
  )"

  gcc "$1" -o "${output_path}" && "${output_path}";
  rm "${output_path}"

  return 0
}

# cl - cd and ls in one command
# usage: cl <directory>
cl() {
  local dir="$1"
  if [[ -z "$dir" ]]; then
    dir="${HOME}"
  fi
  if [[ -d "${dir}" || "${dir}" == "-" ]]; then
    cd "$dir"
    ls
  else
    echo "bash: cl: '${dir}': Directory not found"
    return 1
  fi
}

utime() {
  i=1
  
  while [[ ${i} -gt 0 ]]; do
    echo "${i} seconds"
    (i++)
    sleep 1
  done
}

# gitup - update local "production" branches with remote changes
gitup() {
  local wanted="master"
  local current="$(git rev-parse --abbrev-ref HEAD)"

  for branch in "dev" "master"; do
    git checkout "${branch}"
    git pull origin "${branch}"
  done

  if [[ "${current}" != "${wanted}" ]]; then
    git checkout "${wanted}"
  fi
}

# gitclean - remove branches that aren't needed any longer
# usage: gitclean (inside of a git repository)
gitclean() {
  declare -a branches="$(
    git branch | 
    sed 's/^[^a-zA-Z0-9]*//'g |
    egrep -v "^dev|^master"
  )"

  for branch in "${branches[@]}"; do
    git branch -d "${branch}"
  done
}

# gitready - clean up local git repository
gitready() {
  gitup
  gitclean
}

# gitpr - push current branch to remote to set up pull request
gitpr() {
  local current="$(git rev-parse --abbrev-ref HEAD)"

  if [[ "${current}" == "master" || "${current}" == "dev" ]]; then
    echo "ERROR: attempted to push directly to production branches"
    echo "Exiting"
    return 1
  fi

  git push origin "${current}"
}

