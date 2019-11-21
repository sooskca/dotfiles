" vim: fdm=marker ts=2 sts=2 sw=2
" plugins.vim - My vim plugins configuration
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0



"'vim-airline/vim-airline' "{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
"}}}

" 'w0rp/ale' {{{
" Disable realtime linting due to performance issue
let g:ale_lint_on_text_changed = 'normal'
" Ensure ale use location list
let g:ale_set_loclist = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 8
" Check on bufenter
let g:ale_lint_on_enter = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1

" Fixing
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'html': ['prettier'],
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier'],
      \   'css': ['prettier'],
      \}

let g:ale_fix_on_save = 1
"}}}

" 'ntpeters/vim-better-whitespace' {{{
autocmd BufEnter * EnableStripWhitespaceOnSave
" }}}

" 'ctrlpvim/ctrlp.vim' "{{{
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_max_height=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=20000
let g:ctrlp_extensions=['funky', 'undo']

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$'
      \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

if executable('ag')
  let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
endif


nmap \ [ctrlp]
nnoremap [ctrlp] <nop>
nnoremap [ctrlp]t :CtrlPBufTag<cr>
nnoremap [ctrlp]T :CtrlPTag<cr>
nnoremap [ctrlp]l :CtrlPLine<cr>
nnoremap [ctrlp]o :CtrlPFunky<cr>
nnoremap [ctrlp]b :CtrlPBuffer<cr>
nnoremap [ctrlp]y :CtrlPYankring<cr>
nnoremap [ctrlp]c :CtrlPCmdline<cr>
nnoremap [ctrlp]u :CtrlPUndo<cr>

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_matchtype = 'path'

" }}}

" 'raimondi/delimitmate' {{{
let delimitMate_expand_cr = 1
" }}}

" 'junegunn/vim-easy-align' {{{

" Align everything, since by default it doesn't align inside a comment
let g:easy_align_ignore_groups = []
let g:easy_align_delimiters = {
      \ ';': { 'pattern': ';', 'left_margin': 0, 'stick_to_left': 1 } }
xmap gl <">(LiveEasyAlign)
nmap gl <">(LiveEasyAlign)
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

" 'terryma/vim-multiple-cursors' {{{
let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" /neoclide/coc.nvim{{{

" make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <cr> to confirm completion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"}}}

" 'ncm2/ncm2' {{{
" autocmd BufEnter  *  call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
"}}}

" 'Shougo/deoplete.nvim' {{{
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#auto_complete_start_length = 2
" inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']

" let g:deoplete#sources#ternjs#filetypes = [
"                 \ 'html',
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'vue',
"                 \ ]
"}}}

" Shougo/neosnippet.vim {{{
" inoremap <silent> <expr> <CR> ncm2_neosnippet#expand_or("\<CR>", 'n')
" let g:neosnippet#enable_snipmate_compatibility = 1
" call deoplete#custom#option('smart_case', v:true)

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"  \<Plug>(neosnippet_expand_or_jump)" : '\<TAB>'

" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
"}}}

" 'scrooloose/nerdtree'"{{{
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
    autocmd User NERDTreeInit call functions#SelectLastFile()

    " Exits when is the only window shown
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  augroup END
endif
" }}}

" 'ternjs/tern_for_vim'{{{
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
"}}}

" 'christoomey/vim-tmux-navigator' {{{
let g:tmux_navigator_save_on_switch = 1
" }}}

"'tpope/vim-unimpaired' {{{
nnoremap coa :ALEToggle<cr>

" }}}
"
" 'mhinz/vim-signify' {{{
" let g:signify_realtime = 1
"}}}

" 'thaerkh/vim-workspace' {{{
nnoremap <leader>s :ToggleWorkspace<CR>
" }}}
