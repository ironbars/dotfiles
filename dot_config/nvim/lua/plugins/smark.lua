return {
  {
    "yutanagano/smark.nvim",
    ft = {"markdown", "text"},
    config = true,
    --config = function()
      --require("smark").setup()
      --vim.api.nvim_create_autocmd({"FileType", "VimEnter"}, {
        --pattern = {"markdown", "text"},
        --callback = function()
          --vim.schedule(function()
            --vim.notify("VimEnter ft=" .. vim.bo.filetype)
            --vim.notify("fo=" .. vim.o.formatoptions)
            --local ft = vim.bo.filetype
            --if ft == "markdown" or ft == "text" then
              --vim.opt_local.formatoptions:append("ro")
            --end
          --end)
        --end,
      --})
    --end,
  },
}
