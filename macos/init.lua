require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "json", "css", "tsx", "html" },
  -- sync_install = false,
  -- auto_install = true,,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- indent = {
  --   enable = true
  -- }
}

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "tsserver" },
}
require("lspconfig").tsserver.setup({})

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
