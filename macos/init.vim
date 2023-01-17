set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox' " colourful nvim
Plug 'preservim/nerdtree' " project folder structure
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs' " auto pair
Plug 'tpope/vim-commentary' " commenting support
Plug 'vim-airline/vim-airline' " button status bar
Plug 'ludovicchabant/vim-gutentags' "tag helper
Plug 'bagrat/vim-buffet' "top tab/buffer/windows support
Plug 'dyng/ctrlsf.vim' "global search
Plug 'tpope/vim-surround' " surrounding characters
Plug 'tpope/vim-repeat' " . support
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } "markdown previewer
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-eunuch'
Plug 'jparise/vim-graphql' " graphql highlight support
Plug 'pantharshit00/vim-prisma' " prisma highlight support

" js, ts, jsx and tsx language highlight
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" code compliance check
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

call plug#end()

colorscheme gruvbox
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

" Key mapping for vim-buffet
noremap <Tab> :bn!<CR>
noremap <S-Tab> :bp!<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
noremap <C-t> :tabnew split<CR>

nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Key mapping for folding
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

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

set foldmethod=indent
set foldlevelstart=20

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Configuration for nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" COC configurations
let g:coc_node_path = '/usr/local/bin/node'
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

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
