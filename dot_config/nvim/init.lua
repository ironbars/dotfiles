-- Basic configuration
-- -------------------
vim.opt.compatible = false
vim.opt.termguicolors = true
vim.cmd("syntax on")
vim.g.mapleader = ","
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.number = true

-- Indentation settings
-- --------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.cmd("filetype plugin indent on")

-- Search settings
-- ---------------
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.keymap.set("n", "<Leader>q", "<cmd>nohlsearch<CR>", {silent = true})

-- Extra key bindings
-- ------------------
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
-- edit and source init.lua on the fly
vim.keymap.set("n", "<Leader>ev", "<cmd>split $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>sv", "<cmd>source $MYVIMRC<CR>")

-- Syntax highlighting (for strange extenstions)
-- ---------------------------------------------
local filetypegroup = vim.api.nvim_create_augroup("filetypes", {clear = true})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.sage",
  group = filetypegroup,
  command = "set filetype=python",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.adoc",
  group = filetypegroup,
  command = "set filetype=asciidoc",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*bashrc*",
  group = filetypegroup,
  command = "set filetype=sh",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*bash_*",
  group = filetypegroup,
  command = "set filetype=sh",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.pp",
  group = filetypegroup,
  command = "set filetype=puppet",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "poetry.lock",
  group = filetypegroup,
  command = "set filetype=toml",
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = "*.md",
  group = filetypegroup,
  callback = function()
    local filepath = vim.fn.expand("%:p")
    local notes_dir = vim.fn.expand(vim.g.wiki_root)
    if filepath:sub(1, #notes_dir) == notes_dir then
      vim.cmd("WikiEnable")
    end
  end,
})

-- Plugins
-- -------
require("config.lazy")

-- GUI settings
-- ------------
if vim.g.neovide then
  vim.opt.guifont = "Inconsolata Nerd Font Mono:h16"
  vim.cmd("colorscheme solarized")

  local function paste()
    vim.api.nvim_paste(vim.fn.getreg('+'), true, -1)
  end

  vim.keymap.set({"n", "v"}, "<D-v>", '"+p', {desc = "Paste from system clipboard"})
  vim.keymap.set("i", "<D-v>", paste, {desc = "Paste in insert mode"})
  vim.keymap.set("c", "<D-v>", "<C-R>+", {desc = "Paste in command mode"})
end
