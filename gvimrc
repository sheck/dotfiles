" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif

" Get off my lawn, macvim edition
nnoremap <ScrollWheelUp> :echoe "Use k"<CR>
nnoremap <ScrollWheelDown> :echoe "Use j"<CR>

" Proper font
set guifont=Monaco:h14
