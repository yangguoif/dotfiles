-- Mason LSP setup
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "tsserver", "lua_ls" },
}
require("lspconfig").tsserver.setup({})
require("lspconfig").lua_ls.setup({})

-- Syntax highlight setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "json", "css", "tsx", "html", "lua" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- indent = {
  --   enable = true
  -- }
}

require("nvim-tree").setup({})
require("nvim-autopairs").setup {}
require('nvim-ts-autotag').setup({})
