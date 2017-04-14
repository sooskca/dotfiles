let NERDTreeShowHidden=1

let NERDTreeQuitOnOpen=0

let NERDTreeShowLineNumbers=1

let NERDTreeChDirMode=0

let NERDTreeIgnore=['\.git','\.hg']

nnoremap <F2> :NERDTreeToggle<CR>

nnoremap <F3> :NERDTreeFind<CR>

let g:NERDTreeWinSize=40

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

" Single-click to toggle directory nodes, double-click to open non-directory
" nodes.
let g:NERDTreeMouseMode=2

if has('autocmd')
  augroup settings-plugin-nerdtree
    autocmd!

    " Shows at startup (if a directory is opened)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " Tries to select last file
    autocmd User NERDTreeInit call functions#attempt_select_last_file#do()

    " Exits when is the only window shown
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
endif

