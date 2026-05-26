return {
  gopls = true,
  bashls = true,
  yamlls = true,
  powershell_es = true,
  marksman = true,
  pylsp = {
    plugins = {
      ruff = {
        enabled = true,
      },
    },
    post_install = function(pkg)
      local pip = pkg:get_install_path() .. "/venv/bin/pip"
      vim.fn.system({ pip, "show", "python-lsp-ruff" })

      if vim.v.shell_error ~= 0 then
        vim.fn.jobstart({ pip, "install", "python-lsp-ruff" })
      end
    end
  },
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
