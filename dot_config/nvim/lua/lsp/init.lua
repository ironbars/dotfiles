local M = {}

function M.get_servers()
  return require("lsp.servers")
end

function M.make_capabilities()
  local base = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")

  if ok then
    return vim.tbl_deep_extend("force", base, cmp_lsp.default_capabilities())
  end
  return base
end

function M.make_config(server_name)
  local servers = M.get_servers()
  local override = servers[server_name]
  local base = { capabilities = M.make_capabilities() }

  if type(override) == "table" then
    return vim.tbl_deep_extend("force", base, override)
  end

  return base
end

return M
