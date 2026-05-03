return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    tag = "3.40.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>", {silent = true})
    end,
  },
}
