-- Plugins
-- -------
vim.g.mapleader = ","
require("config.lazy")

-- Basic configuration
-- -------------------
vim.opt.termguicolors = true
vim.cmd("syntax on")
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.number = true

-- Default indentation settings
-- --------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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
-- easy movement
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
-- edit and source init.lua on the fly
vim.keymap.set("n", "<Leader>ev", "<cmd>split $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>sv", "<cmd>source $MYVIMRC<CR>")
-- quick uppercase word
vim.keymap.set("i", "<C-u>", "<esc>viwUea")

-- Syntax highlighting (for strange extenstions)
-- ---------------------------------------------
local filetypegroup = vim.api.nvim_create_augroup("filetypes", {clear = true})
local ft_mappings = {
  ["*.sage"] = "python",
  ["*.adoc"] = "asciidoc",
  ["*bashrc*"] = "sh",
  ["*base_*"] = "sh",
  ["*.pp"] = "puppet",
  ["poetry.lock"] = "toml",
  ["*.plist"] = "xml",
}
for pattern, ft in pairs(ft_mappings) do
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = pattern,
    group = filetypegroup,
    command = "set filetype=" .. ft,
  })
end

-- GUI settings
-- ------------
if vim.g.neovide then
  vim.opt.guifont = "Inconsolata Nerd Font Mono:h16"
  vim.cmd("colorscheme kanagawa-paper")

  local function paste()
    vim.api.nvim_paste(vim.fn.getreg('+'), true, -1)
  end

  local function envy()
    if vim.bo.modified then
      vim.cmd("w")
    end
    vim.cmd("%bd")
    require("envy").open()
  end

  vim.keymap.set({"n", "v"}, "<D-v>", '"+p', {desc = "Paste from system clipboard"})
  vim.keymap.set("i", "<D-v>", paste, {desc = "Paste in insert mode"})
  vim.keymap.set("c", "<D-v>", "<C-R>+", {desc = "Paste in command mode"})
  vim.keymap.set("n", "<Leader>en", envy, {desc = "Open envy.nvim"})
end
