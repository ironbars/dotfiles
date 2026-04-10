return {
  {
    dir = "~/make/envy.nvim",
    name = "envy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("envy").setup({
        search_dirs = {"~/notes"},
        keymap = "<Leader>en",
      })
    end,
  },
}
