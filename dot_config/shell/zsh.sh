# Shell behavior variables
# ------------------------
setopt nocaseglob
setopt globdots
setopt appendhistory
setopt sharehistory
setopt histignorespace
setopt incappendhistory
setopt aliases
setopt histexpiredupsfirst
setopt kshglob

bindkey -e

# Environment variables
# ---------------------
export HISTFILE="~/.zsh_history"
export SAVEHIST=8000
