return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local languages = {"go", "python", "lua", "yaml", "markdown"}
      require("nvim-treesitter").install(languages)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function() vim.treesitter.start() end,
      })
    end,
    lazy = false,
  },
}
