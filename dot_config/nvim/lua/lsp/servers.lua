return {
  gopls = true,
  pylsp = true,
  bashls = true,
  yamlls = true,
  powershell_es = true,
  marksman = true,
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          library = {
            vim.env.VIMRUNTIME,
            vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
          },
          checkThirdParty = false,
        },
        diagnostics = {
          globals = { "vim" }
        },
        telemetry = { enable = false },
      },
    },
  },
}
