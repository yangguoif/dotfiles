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

-- Configuration for telescope
-- Put file_name at the beginning of picker results.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then return tail end
  return string.format("%s\t\t%s", tail, parent)
end

require("telescope").setup {
  pickers = {
    find_files = {
      path_display = filenameFirst,
    }
  }
}
