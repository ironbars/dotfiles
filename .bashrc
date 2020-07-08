#
# ~/.bashrc
#

# If not running interactively, dont do anything
[[ $- != *i* ]] && return

# Source common definitons
source ~/.config/bash/common.sh

# Check for supported platform and OS
case "${OSTYPE}" in
  "darwin"*)
    source ~/.config/bash/darwin.sh
    ;;
  "linux-gnu")
    source ~/.config/bash/linux.sh
    ;;
  *)
    echo "Unsupported platform" >&2
    return
    ;;
esac

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
export PATH="${HOME}/.local/bin:${PATH}"
export HISTSIZE=10000
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL=ignoreboth
export EDITOR=vim
export FZF_DEFAULT_COMMAND="rg ${fzf_rg_opts[@]}"

# Prompt
# -------------
PS1="\[${prompt_color}\][\u@\h \W]\$\[${prompt_color_reset}\] "

# Aliases
# -------------
alias ls="ls ${ls_opts}"
alias la="ls ${la_opts}"
alias ll="ls ${ll_opts}"
alias grep="grep --color=tty -d skip"
alias cp="cp -i"
alias df="df -h"
alias gpom="git push origin master"
alias gpll="git pull origin master"
alias bashrc="vim ~/.bashrc"
alias inputrc="vim ~/.config/bash/inputrc"
alias vimrc="vim ~/.vim/vimrc"
alias sb="source ~/.bashrc"
alias add="${pkg_add}"
alias remove="${pkg_remove}"
alias search="${pkg_search}"

# Functions
# -------------
# ex - archive extractor
# usage: ex <archive>
ex() {
  local archive="$1"

  if [[ -f "${archive}" ]]; then
    case "${archive}" in
      *.tar.bz2|*.tbz2)
        tar xjf "${archive}"
        ;;
      *.tar.gz|*.tgz) 
        tar xzf "${archive}"
        ;;
      *.tar.xz)
        tar xJf "${archive}"
        ;;
      *.bz2)
        bunzip2 "${archive}"
        ;;
      *.rar)
        unrar x "${archive}"
        ;;
      *.gz)
        gunzip "${archive}"
        ;;
      *.tar)
        tar xf "${archive}"
        ;;
      *.zip)
        unzip "${archive}"
        ;;
      *.Z)
        uncompress "${archive}"
        ;;
      *.7z)
        7z x "${archive}"
        ;;
      *)
        echo "'${archive}' cannot be extracted via ex()"
        return 1
        ;;
    esac

  else
    echo "'${archive}' is not a valid file"
    return 1
  fi
}

# csource - compile and execute C source on the fly
# usage: csource <source_file>
csource() {
  local src_file="$1"

  if [[ -z "${src_file}" ]]; then
    echo "Missing operand"
    return 1
  fi

  local output_path="${src_file/*\//\/tmp\/}"
  output_path="${output_path%.*}"

  gcc "${src_file}" -o "${output_path}" && "${output_path}"
  rm "${output_path}"

  return 0
}

# cl - cd and ls in one command
# usage: cl <directory>
cl() {
  local dir="$1"

  if [[ -z "${dir}" ]]; then
    dir="${HOME}"
  fi

  if [[ -d "${dir}" || "${dir}" = "-" ]]; then
    cd "$dir"
    ls
  else
    echo "bash: cl: '${dir}': Directory not found"
    return 1
  fi
}

utime() {
  i=1
  
  while  (( i > 0 )); do
    echo "${i} seconds"
    (i++)
    sleep 1
  done
}

# gitup - update local "production" branches with remote changes
gitup() {
  local wanted="master"
  local current
  
  current="$(git rev-parse --abbrev-ref HEAD)"

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
  local branches

  branches=($(
    git branch | 
    sed 's/^[^a-zA-Z0-9]*//'g |
    egrep -v "^dev|^master"
  ))

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
  local current

  current="$(git rev-parse --abbrev-ref HEAD)"
  
  if [[ "${current}" = "master" || "${current}" = "dev" ]]; then
    echo "ERROR: attempted to push directly to production branches"
    echo "Exiting"
    return 1
  fi

  git push origin "${current}"
}

# hide - move file to a hidden location for temporary security
hide() {
  local hiding_place="${HOME}/.fbn/"
  local secret="$1"

  if [[ ! -d "${hiding_place}" ]]; then
    mkdir -p "${hiding_place}"
    chmod 700 "${hiding_place}"
  fi

  mv "${secret}" "${hiding_place}"
}

# Here, you want to put functions that vary not only from computer types, but  
# different contexts.  For example, utility functions that you may need for  
# work at one company may differ from those you need at another, and may differ
# still from home machines.  Source these additional definitions, if necessary.

[[ -f ~/.config/bash/current.sh ]] && source ~/.config/bash/current.sh
