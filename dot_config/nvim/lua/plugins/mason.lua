local lsp = require("lsp")
local servers = lsp.get_servers()

return {
  {
    "mason-org/mason.nvim",
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local ensure_installed = vim.tbl_keys(servers)
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
      for _, server_name in ipairs(ensure_installed) do
        local config = lsp.make_config(server_name)
        vim.lsp.config(server_name, config)
      end
    end
  },
}
