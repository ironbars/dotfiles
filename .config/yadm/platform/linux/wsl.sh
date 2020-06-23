post_bootstrap() {
  patch ~/.vim/vimrc "${MYADM_DIR}"/lib/vimrc-rg.patch
  patch "${MYADM_VIM_PLUGIN_DIR}"/notational-fzf-vim/plugin/notational_fzf.vim \
    "${MYADM_DIR}"/lib/nfv-rg.patch
}
