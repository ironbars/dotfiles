return {
  "chrisgrieser/nvim-origami",
  dependencies = {"lewis6991/gitsigns.nvim"},
  event = "VeryLazy",
  opts = {},
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
  config = true,
}
