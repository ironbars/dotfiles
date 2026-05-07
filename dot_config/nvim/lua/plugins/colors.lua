return {
  {
    "romainl/Apprentice",
    branch = "fancylines-and-neovim",
    lazy = true,
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
    lazy = true,
    name = "nightfox",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    name = "solarized-osaka",
    config = function()
      require("solarized-osaka").setup({
        styles = {
          keywords = { italic = false },
          functions = {},
        },
      })
    end,
  },
  {
    "rakr/vim-one",
    lazy = true,
    name = "one",
  },
  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = true,
    name = "kanagawa-paper",
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    name = "kanagawa",
  },
  {
    "cocopon/iceberg.vim",
    lazy = true,
    name = "iceberg",
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    name = "nightfly",
  },
  {
    "Softmotions/vim-dark-frost-theme",
    lazy = true,
    name = "darkfrost",
  },
  {
    "catppuccin/nvim",
    lazy = true,
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
    lazy = true,
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
