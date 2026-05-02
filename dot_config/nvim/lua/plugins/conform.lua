return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          markdown = {"prettierd"},
        },
        format_on_save = {
          timeout = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
