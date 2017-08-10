" CONFIG

set autoread   " Automatically reload files
set autowrite  " Automatically :write before running commands
set mouse=a    " Fix mouse scrolling
set smartcase  " Search case insensitive unless search has uppercase
set confirm    " Not sold on this, but rails vim offer autocomplete if this is on

" Trying this config out from dotfiles, with the intent of getting autoread
" working the way I expect it to
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" vim-test config
let test#strategy = "neovim"
let g:test#javascript#jasmine#file_pattern = '\v^ahdslfkjhaldfkjhlspec/.*adsfklhjasfdspec\.(js|jsx|coffee)$'
let g:test#javascript#jest#file_pattern = '\v^spec/.*spec\.(js|jsx|coffee)$'

" Deoplete
let g:deoplete#enable_at_startup = 1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Run Neomake (syntax checking and others) on current file for every write and
" open
autocmd! BufWritePost,BufEnter * Neomake

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif


" KEYMAPS

" Leader
let mapleader = " "

" Save current file
map <Leader>w :w<CR>

" vim-test mappings
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
" For some reason autowrite doesn't work here
nnoremap <silent> <leader>l :w\|:TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Clear search highlight
nnoremap <silent> <leader>c :nohlsearch<CR>

" Remote pry debuggin
nnoremap <leader>p :new\|:call termopen('pry-remote')\|:startinsert<CR>

" Rubocop and eslint autofix
autocmd FileType javascript map <buffer> <leader>r :NeomakeSh!eslint --fix %<CR>:sleep 1<CR>:e<CR>
autocmd FileType ruby map <buffer> <leader>r :NeomakeSh!rubocop --auto-correct %<CR>:sleep 1<CR>:e<CR>


" COLOR TWEAKS

" Use a light gray color
highlight ColorColumn ctermbg=8
highlight Search ctermbg=8


" PLUGINS

call plug#begin('~/.local/share/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'

Plug 'itchyny/lightline.vim'

Plug 'neomake/neomake'

Plug 'janko-m/vim-test'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }

Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
