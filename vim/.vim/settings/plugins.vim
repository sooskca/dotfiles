" vim: fdm=marker ts=2 sts=2 sw=2
" plugins.vim - My vim plugins configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

"'vim-airline/vim-airline' "{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_oceanicnext'
"}}}

" 'w0rp/ale' {{{
let g:ale_lint_on_text_changed = 'normal'
let g:ale_set_loclist = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 8
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'html': ['prettier'],
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier'],
      \   'css': ['prettier'],
      \}
let g:ale_fix_on_save = 1

nnoremap coa :ALEToggle<cr>
"}}}

" 'junegunn/fzf.vim' "{{{

nmap \ [fzf]
nnoremap [fzf] <nop>
nnoremap [fzf]f :Files<cr>
nnoremap [fzf]F :GFiles<cr>
nnoremap [fzf]t :BTags<cr>
nnoremap [fzf]T :Tags<cr>
nnoremap [fzf]l :BLines<cr>
nnoremap [fzf]L :Lines<cr>
nnoremap [fzf]b :Buffers<cr>
nnoremap [fzf]u :History<cr>
nnoremap [fzf]c :History:<cr>
nnoremap [fzf]s :History/<cr>
" }}}

" 'raimondi/delimitmate' {{{
let delimitMate_expand_cr = 1
" }}}

" 'junegunn/vim-easy-align' {{{
xmap gl <">(LiveEasyAlign)
nmap gl <">(LiveEasyAlign)

let g:easy_align_ignore_groups = []
let g:easy_align_delimiters = {
      \ ';': { 'pattern': ';', 'left_margin': 0, 'stick_to_left': 1 } }
"}}}

" 'tpope/vim-fugitive' {{{
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

autocmd BufReadPost fugitive://* set bufhidden=delete
" }}}

" 'autozimu/LanguageClient-neovim' " {{{
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['~/.yarn/bin/javascript-typescript-stdio'],
    \ }
" }}}

" 'AndrewRadev/linediff.vim' {{{
autocmd User LinediffBufferReady nnoremap <buffer> q :LinediffReset<cr>
autocmd User LinediffBufferReady setlocal nocursorline
nnoremap <leader>d :Linediff<cr>
xnoremap <leader>d :Linediff<cr>
" }}}

" 'Valloric/ListToggle' {{{
let g:lt_location_list_toggle_map = '<leader>Q'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" }}}

" "'ncm2/ncm2'{{{
set completeopt=noinsert,menuone,noselect

inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

au BufEnter * call ncm2#enable_for_buffer()
au TextChangedI * call ncm2#auto_trigger()
"}}}

" 'bfredl/nvim-miniyank' {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)

map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

map <Leader>yc <Plug>(miniyank-tochar)
map <Leader>yl <Plug>(miniyank-toline)
map <Leader>yb <Plug>(miniyank-toblock)
" }}}
"
" 'terryma/vim-multiple-cursors' {{{
let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" amiorin/vim-project {{{
" let g:project_enable_welcome = 0
let g:project_use_nerdtree = 1
call project#rc('$HOME/Code')
if filereadable(expand('~/.vim/projects.vim'))
  source ~/.vim/projects.vim
endif
"}}}

" {{{ 'sirver/UltiSnips'
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" }}}
"
" 'scrooloose/nerdtree'"{{{
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\.git','\.hg']
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalUI=1
let g:NERDTreeMouseMode=2

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>

if has('autocmd')
  augroup settings-plugin-nerdtree
    autocmd!

    " Shows at startup (if a directory is opened)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " Tries to select last file
    autocmd User NERDTreeInit call functions#SelectLastFile()

    " Exits when is the only window shown
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
endif
" }}}

" "'mhinz/vim-startify' {{{
let g:startify_enable_special      = 0
let g:startify_files_number        = 8
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1


let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'node_modules/.*/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'c': '~/Code' },
        \ { 'cw': '~/Code/Web' },
        \ { 'wf': '~/Code/Web/forum' },
        \ { 'e': '~/Code/Exercism' },
        \ { 'ej': '~/Code/Exercism/javascript' },
        \ ]

let g:startify_custom_header =
        \ startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')

" }}}

" 'ternjs/tern_for_vim'{{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"}}}

" 'christoomey/vim-tmux-navigator' {{{
let g:tmux_navigator_save_on_switch = 1
" }}}

" 'mhinz/vim-signify' {{{
let g:signify_realtime = 1
"}}}

" 'thaerkh/vim-workspace' {{{
nnoremap <leader>s :ToggleWorkspace<CR>
" }}}
