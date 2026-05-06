return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-d>"] = "preview_scrolling_down",
              ["<C-u>"] = "preview_scrolling_up",
              ["<C-f>"] = "results_scrolling_down",
              ["<C-b>"] = "results_scrolling_up",
            },
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },
}
