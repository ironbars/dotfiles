return {
  {
    "ironbars/envy.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("envy").setup({
        search_dirs = {"~/notes"},
        keymap = "<Leader>en",
        path_display = "full",
      })
    end,
  },
}
