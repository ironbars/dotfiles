pkg_add="sudo apt-get install"
pkg_remove="sudo apt-get autoremove"
pkg_search="apt-cache search"

# This is necessary due to some weirdness with WSL 1 and Rust.  
if [[ "$(uname -r)" = *Microsoft ]]; then
  source ~/.config/bash/wsl.sh
fi
