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
      local registry = require("mason-registry")
      local lspconfig = require("mason-lspconfig")
      local lsp = require("lsp")
      local servers = lsp.get_servers()
      local ensure_installed = vim.tbl_keys(servers)
      local post_install_hooks = {}

      for _, server_name in ipairs(ensure_installed) do
        local config, post_install = lsp.make_config(server_name)
        vim.lsp.config(server_name, config)

        if post_install then
          post_install_hooks[server_name] = post_install
        end
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })

      for server_name, hook in pairs(post_install_hooks) do
        local pkg_name = lspconfig.get_mappings().lspconfig_to_package[server_name]
        local pkg = registry.get_package(pkg_name)
        if pkg:is_installed() then
          hook(pkg)
        end
      end
    end
  },
}
