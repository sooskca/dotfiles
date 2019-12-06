" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Requirements  {{{
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'roxma/nvim-yarp'
  Plug 'prabirshrestha/async.vim'
"}}}

" Editing {{{

  Plug 'mbbill/undotree'
  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'tpope/vim-surround'


  Plug 'junegunn/vim-easy-align' " {{{
    " Align everything, since by default it doesn't align inside a comment
    let g:easy_align_ignore_groups = []
    let g:easy_align_delimiters = {
          \ ';': { 'pattern': ';', 'left_margin': 0, 'stick_to_left': 1 } }
    xmap gl <">(LiveEasyAlign)
    nmap gl <">(LiveEasyAlign)
    "}}}

  Plug 'terryma/vim-multiple-cursors' " {{{
    let g:multi_cursor_exit_from_insert_mode = 0
    " }}}

  Plug 'thaerkh/vim-workspace' " {{{
    nnoremap <leader>s :ToggleWorkspace<CR>
    " }}}

  Plug 'kana/vim-textobj-user' "{{{
    Plug 'fvictorio/vim-textobj-backticks'
    Plug 'saaguero/vim-textobj-pastedtext'
    "}}}

  "" Completion {{{

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " {{{
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

  "" }}}

" }}}

" Programming {{{

  Plug 'honza/vim-snippets'
  Plug 'metakirby5/codi.vim'
  Plug 'tpope/vim-commentary'

  Plug 'raimondi/delimitmate' " {{{
    let delimitMate_expand_cr = 1
    " }}}

  "" Source Control {{{

  Plug 'tpope/vim-fugitive' " {{{
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

  Plug 'mhinz/vim-signify' " {{{
    let g:signify_realtime = 1
    " }}}

  " }}}

  "" Code Quality {{{

  Plug 'editorconfig/editorconfig-vim'

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


  Plug 'w0rp/ale' "{{{
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

  Plug 'janko-m/vim-test' "{{{
      nmap <silent> t<C-n> :TestNearest<CR>
      nmap <silent> t<C-f> :TestFile<CR>
      nmap <silent> t<C-s> :TestSuite<CR>
      nmap <silent> t<C-l> :TestLast<CR>
      nmap <silent> t<C-g> :TestVisit<CR>
    "}}}

  Plug 'tpope/vim-dispatch'
  " }}}

  "" Libraries {{{
  " Plug 'posva/vim-vue'
  "}}}

  "" Languages {{{

    """ HTML & CSS {{{
    Plug 'mattn/emmet-vim'
    " }}}

    """ JavaScript/TypeScript {{{
    Plug 'HerringtonDarkholme/yats.vim'
    " }}}

    """ Godot {{{
    Plug 'calviken/vim-gdscript3'
    "}}}

  Plug 'sheerun/vim-polyglot'

  " }}}

" }}}

" Interface {{{

  " Appearance {{{
    Plug 'chriskempson/base16-vim'
    Plug 'ryanoasis/vim-devicons'
    "}}}

  " Status Line "{{{
    Plug 'vim-airline/vim-airline' "{{{
      Plug 'vim-airline/vim-airline-themes'

      let g:airline#extensions#tabline#enabled = 1
      let g:airline_powerline_fonts = 1
      let g:airline_theme='base16'
    "}}}
  "}}}

  " File Navigation "{{{
  Plug 'farmergreg/vim-lastplace'

  " Plug 'ctrlpvim/ctrlp.vim' "{{{
  "   Plug 'tacahiroy/ctrlp-funky'
  "   Plug 'sgur/ctrlp-extensions.vim'

  "   let g:ctrlp_clear_cache_on_exit=1
  "   let g:ctrlp_max_height=40
  "   let g:ctrlp_follow_symlinks=1
  "   let g:ctrlp_max_files=20000
  "   let g:ctrlp_extensions=['funky', 'undo']

  "   let g:ctrlp_custom_ignore = {
  "         \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "         \ 'file': '\v\.(exe|so|dll)$'
  "         \ }

  "   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

  "   if executable('ag')
  "     let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
  "   endif


  "   nmap \ [ctrlp]
  "   nnoremap [ctrlp] <nop>
  "   nnoremap [ctrlp]t :CtrlPBufTag<cr>
  "   nnoremap [ctrlp]T :CtrlPTag<cr>
  "   nnoremap [ctrlp]l :CtrlPLine<cr>
  "   nnoremap [ctrlp]o :CtrlPFunky<cr>
  "   nnoremap [ctrlp]b :CtrlPBuffer<cr>
  "   nnoremap [ctrlp]y :CtrlPYankring<cr>
  "   nnoremap [ctrlp]c :CtrlPCmdline<cr>
  "   nnoremap [ctrlp]u :CtrlPUndo<cr>

  "   let g:ctrlp_funky_syntax_highlight = 1
  "   let g:ctrlp_funky_matchtype = 'path'

  "   " }}}

  Plug 'junegunn/fzf.vim' " {{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    let g:fzf_nvim_statusline = 0 " disable statusline overwriting

    nmap \ [fzf]
    nnoremap <silent> [fzf]<space> :Files<CR>
    nnoremap <silent> [fzf]a :Buffers<CR>
    nnoremap <silent> [fzf]A :Windows<CR>
    nnoremap <silent> [fzf]; :BLines<CR>
    nnoremap <silent> [fzf]o :BTags<CR>
    nnoremap <silent> [fzf]O :Tags<CR>
    nnoremap <silent> [fzf]? :History<CR>
    nnoremap <silent> [fzf]/ :execute 'Ag ' . input('Ag/')<CR>
    nnoremap <silent> [fzf]. :AgIn

    nnoremap <silent> K :call SearchWordWithAg()<CR>
    vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
    nnoremap <silent> [fzf]gl :Commits<CR>
    nnoremap <silent> [fzf]ga :BCommits<CR>
    nnoremap <silent> [fzf]ft :Filetypes<CR>

    imap <C-x><C-f> <plug>(fzf-complete-file-ag)
    imap <C-x><C-l> <plug>(fzf-complete-line)


    function! SearchWordWithAg()
      execute 'Ag' expand('<cword>')
    endfunction

    function! SearchVisualSelectionWithAg() range
      let old_reg = getreg('"')
      let old_regtype = getregtype('"')
      let old_clipboard = &clipboard
      set clipboard&
      normal! ""gvy
      let selection = getreg('"')
      call setreg('"', old_reg, old_regtype)
      let &clipboard = old_clipboard
      execute 'Ag' selection
    endfunction

    function! SearchWithAgInDirectory(...)
      call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
    endfunction
    command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
  " }}}

  Plug 'scrooloose/nerdtree' "{{{
    Plug 'Xuyuanp/nerdtree-git-plugin'

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

  "}}}

"}}}

" Motion {{{
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-scripts/matchit.zip'
  Plug 'justinmk/vim-sneak'
"}}}

" Highlighting {{{

  Plug 'psychollama/further.vim'
  Plug 'yggdroot/indentline'
  Plug 'vasconcelloslf/vim-interestingwords'
  Plug 'xtal8/traces.vim'

  Plug 'ntpeters/vim-better-whitespace' " {{{
    autocmd BufEnter * EnableStripWhitespaceOnSave
    " }}}

"}}}

" Utilities {{{

  Plug 'konfekt/fastfold'
  Plug 'octref/rootignore'
  Plug 'mhinz/vim-startify'
  Plug 'wellle/tmux-complete.vim'

  Plug 'Valloric/ListToggle' " {{{
    let g:lt_location_list_toggle_map = '<leader>Q'
    let g:lt_quickfix_list_toggle_map = '<leader>q'
    let g:lt_height = 10
    " }}}

  Plug 'tpope/vim-unimpaired' " {{{
    nnoremap coa :ALEToggle<cr>
    " }}}

  Plug 'christoomey/vim-tmux-navigator' " {{{
    let g:tmux_navigator_save_on_switch = 1
    " }}}

" }}}

call plug#end()
