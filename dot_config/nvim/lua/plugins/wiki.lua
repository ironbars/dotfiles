return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.g.wiki_root = vim.fn.resolve(vim.fn.expand("~/notes"))
      vim.g.wiki_filetypes = {"md"}
      vim.g.wiki_link_style = "wiki"
      vim.g.wiki_tag_scan_num_lines = "all"
    end,
    config = function()
      vim.api.nvim_exec2([[
        let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
        let s:tag_parser.re_match = '\v%(^|\s)::[a-zA-Z0-9_-]+'
        let s:tag_parser.re_findstart = '\v%(^|\s)::\zs[a-zA-Z0-9_-]+$'
        let s:tag_parser.re_parse = '\v::\zs[a-zA-Z0-9_-]+'
        let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"::". v:val'))}
        let g:wiki_tag_parsers = [s:tag_parser]
      ]], {})
    end,
    lazy = false,
  }
}
