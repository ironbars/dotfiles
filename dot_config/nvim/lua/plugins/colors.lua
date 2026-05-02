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
    "EdenEast/nightfox.nvim",
    lazy = false,
    name = "nightfox",
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
    "rakr/vim-one",
    lazy = false,
    name = "one",
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
    "cocopon/iceberg.vim",
    lazy = false,
    name = "iceberg",
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    name = "nightfly",
  },
  {
    "Softmotions/vim-dark-frost-theme",
    lazy = false,
    name = "darkfrost",
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catpuccin",
    config = function()
      require("catppuccin").setup({
        styles = {
          conditionals = {},
        },
      })
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        italic = {
          strings = false,
        },
      })
    end,
  },
}
