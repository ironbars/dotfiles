# Anything in this file can be overridden by setting or altering the variable  
# in the file sourced for the specific OS.  Think of these as overridable 
# defaults
prompt_color="$(tput setaf 6)"
prompt_color_reset="$(tput sgr 0)"
fzf_rg_opts=(--files --no-ignore --hidden --follow --glob "!.git/*")
