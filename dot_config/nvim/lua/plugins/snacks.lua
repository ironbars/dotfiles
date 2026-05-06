return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    config = function()
      local opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = true },
        indent = { enabled = false },
        input = { enabled = false },
        picker = {
          sources = {
            explorer = {
              win = {
                list = {
                  keys = {
                    ["<space>"] = "confirm",
                  },
                },
              },
            },
          },
        },
      }
      require("snacks").setup(opts)
      vim.keymap.set("n", "<leader>et", function()
        local explorer = Snacks.picker.get({source = "explorer"})[1]
        if not explorer then
          Snacks.picker.explorer()
        elseif explorer:is_focused() then
          explorer:close()
        else
          explorer:focus()
        end
      end, {desc = "Toggle file explorer"})
    end,
  }
}
