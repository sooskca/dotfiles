" bindings/insert.vim - My insert mode bindings for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" jk|kj - Escape
inoremap jk <esc>
inoremap kj <esc>

" <TAB> Expands
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
