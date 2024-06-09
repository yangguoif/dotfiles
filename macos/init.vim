set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" folder tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
" fzf
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'jiangmiao/auto-pairs' " auto pair
Plug 'tpope/vim-commentary' " commenting support
Plug 'suy/vim-context-commentstring' " context aware commenting
Plug 'vim-airline/vim-airline' " bottom status bar
Plug 'ludovicchabant/vim-gutentags' "tag helper
Plug 'bagrat/vim-buffet' "top tab/buffer/windows support
Plug 'tpope/vim-surround' " surrounding characters
Plug 'tpope/vim-repeat' " . support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } "markdown previewer
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-eunuch' " UNIX shell commands in vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlight
" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-test/vim-test' " test runner
call plug#end()

" Colour scheme
colorscheme catppuccin-mocha
let g:airline_theme = 'catppuccin'

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
syntax on

map <C-S-h> gT
map <C-S-l> gt
map <C-S-t> <C-w>T

" Mapping // to multiple selecting, can be followed with c-g-n
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"set colorcolumn=80
set number relativenumber
set nowrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set mouse=a
set hidden
set wrap linebreak
set buftype=

set foldmethod=indent
set foldlevelstart=20
set autoindent

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" visible white spaces
set listchars=eol:¬,tab:»\ ,space:.
set list

" Configuration for nvim-tree
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

" Key mapping for vim-buffet
noremap <Tab> :bn!<CR>
noremap <S-Tab> :bp!<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

" Configuration for telescope fzf
nnoremap tf <cmd>Telescope find_files<cr>
nnoremap ts <cmd>Telescope live_grep<cr>
nnoremap tr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" Configuration for definition search
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>

" Key mapping for folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Configuration for vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Configuration for gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/specs/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.tmp',
      \ '*.cache',
      \ ]


lua require('init')

" Configuration for fzf
"nmap <C-F>f <Plug>CtrlSFPrompt
"vmap <C-F>f <Plug>CtrlSFVwordPath
"vmap <C-F>F <Plug>CtrlSFVwordExec
"nmap <C-F>n <Plug>CtrlSFCwordPath
"nmap <C-F>p <Plug>CtrlSFPwordPath
"nnoremap <C-F>o :CtrlSFOpen<CR>
"nnoremap <C-F>t :CtrlSFToggle<CR>
"inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Configuration for nerdtree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>
" let NERDTreeShowHidden=1

" Other plugins
" Plug 'github/copilot.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf.vim'
" Plug 'dyng/ctrlsf.vim' "global search
