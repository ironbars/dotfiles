# Environment variables
# ---------------------
export GOPATH="${HOME}/.local/go"
export PATH="${GOPATH}/bin:${HOME}/bin:${HOME}/.local/bin:${PATH}"
export HISTSIZE=10000
export EDITOR=vim
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS_FILE="${HOME}/.config/fzf/config"

# Prompt
# ------
PS1="${prmpt}"

# Aliases
# -------
alias ls="ls ${ls_opts}"
alias la="ls -a ${ls_opts}"
alias ll="ls -l ${ls_opts}"
alias lal="ls -al ${ls_opts}"
alias grep="grep --color=tty -d skip"
alias shrc="vim ~/.config/shell/common.sh"
alias src="source ${shellrc}"
alias vimrc="vim ~/.config/vim/vimrc"
alias vimrt="cd ~/.config/vim/pack/dist/start"
alias add="${pkg_add}"
alias remove="${pkg_remove}"
alias search="${pkg_search}"
alias che="chezmoi"
alias chea="chezmoi apply"
alias chedit="chezmoi edit"
alias checd="chezmoi cd"
alias chexec="chezmoi execute-template"
alias chect="chezmoi edit-config-template"
alias cvimrc="chezmoi edit ~/.config/vim/vimrc"
alias cshrc="chezmoi edit ~/.config/shell/common.sh"

# Functions
# ---------
extr() {
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
        printf '"%s" cannot be extracted via extr()\n' "${archive}" >&2
        return 1
        ;;
    esac

  else
    printf '"%s" is not a valid file\n' "${archive}" >&2
    return 1
  fi
}


cl() {
  local dir="${1:-$HOME}"

  cd "${dir}" && ls
}


gitup() {
  local wanted="main"
  local current
  
  current="$(git rev-parse --abbrev-ref HEAD)"

  for branch in "dev" "main"; do
    git checkout "${branch}"
    git pull origin "${branch}"
  done

  if [[ "${current}" != "${wanted}" ]]; then
    git checkout "${wanted}"
  fi
}


gitclean() {
  local branches

  IFS=$'\n' read -r -d '' -a branches < <(git branch --format='%(refname:short)' | grep -v '^master$')

  for branch in "${branches[@]}"; do
    git branch -d "${branch}"
  done
}


gitready() {
  gitup && gitclean
}


gitpr() {
  local current

  current="$(git rev-parse --abbrev-ref HEAD)"
  
  if [[ "${current}" = "main" || "${current}" = "master" ]]; then
    printf "ERROR: attempted to push directly to production branches; exiting\n"
    return 1
  fi

  git push origin "${current}"
}
