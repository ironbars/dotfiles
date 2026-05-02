return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.g.wiki_root = vim.fn.resolve(vim.fn.expand("~/notes"))
      vim.g.wiki_filetypes = {"md"}
      vim.g.wiki_link_style = "wiki"
    end,
    lazy = false,
  }
}
