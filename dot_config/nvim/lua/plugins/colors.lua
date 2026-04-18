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
    priority = 1000,
    name = "nord",
    config = function()
      vim.cmd("colorscheme nord")
    end
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
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    name = "solarized-osaka",
    config = function()
      require("solarized-osaka").setup({
        styles = {
          keywords = {},
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
    "embark-theme/vim",
    lazy = false,
    name = "embark",
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
    "Domeee/mosel.nvim",
    lazy = false,
    name = "mosel",
  },
}
