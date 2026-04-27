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
  },
  {
    "jnurmine/Zenburn",
    lazy = false,
    name = "zenburn",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    name = "solarized-osaka",
    config = function()
      require("solarized-osaka").setup({
        styles = {
          keywords = {italic = false},
          functions = {},
        },
      })
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    name = "tokyodark",
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    name = "kanagawa-paper",
  },
  {
    "rose-pine/neovim",
    lazy = false,
    name = "rose-pine",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catpuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        styles = {
          conditionals = {},
        },
      })
      vim.cmd("colorscheme catppuccin-macchiato")
    end
  },
}
