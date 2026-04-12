return {
  {
    "romainl/Apprentice",
    branch = "fancylines-and-neovim",
    lazy = false,
    name = "apprentice",
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    name = "nord",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord")
    end,
  },
  {
    "jnurmine/Zenburn",
    lazy = false,
    name = "zenburn",
  },
  {
    "altercation/vim-colors-solarized",
    lazy = false,
    name = "solarized",
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    name = "tokyodark",
  },
}
