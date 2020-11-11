" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Editing {{{

  Plug 'arthurxavierx/vim-caser'
  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'machakann/vim-sandwich'

  Plug 'ntpeters/vim-better-whitespace' " {{{
    let g:strip_whitespace_on_save=1
    let g:better_whitespace_enabled=1
  " }}}

  Plug 'raimondi/delimitmate' " {{{
    let delimitMate_expand_cr = 1
  " }}}

  Plug 'terryma/vim-expand-region' " {{{
    map K <Plug>(expand_region_expand)
    map J <Plug>(expand_region_shrink)
  " }}}

  Plug 'junegunn/vim-easy-align' " {{{
    " Align everything, since by default it doesn't align inside a comment
    let g:easy_align_ignore_groups = []
    let g:easy_align_delimiters = {
          \ ';': { 'pattern': ';', 'left_margin': 0, 'stick_to_left': 1 } }
    xmap gl <">(LiveEasyAlign)
    nmap gl <">(LiveEasyAlign)
  " }}}

  Plug 'terryma/vim-multiple-cursors' " {{{
    let g:multi_cursor_exit_from_insert_mode = 0
  " }}}

  Plug 'thaerkh/vim-workspace' " {{{
    nnoremap <leader>s :ToggleWorkspace<CR>
  " }}}

  Plug 'kana/vim-textobj-user' "{{{
    Plug 'saaguero/vim-textobj-pastedtext'
  " }}}

  Plug 'wellle/targets.vim'


  "" Completion {{{

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " {{{
    let g:coc_global_extensions = [
          \'coc-tsserver',
          \'coc-emmet',
          \'coc-css',
          \'coc-html',
          \'coc-json',
          \'coc-pairs',
          \'coc-yank',
          \'coc-prettier']

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" Or use `complete_info` if your vim support it, like:
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gh :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup settings-plugin-coc
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nmap , [List]
    nnoremap <silent> [List]a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> [List]e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> [List]c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> [List]o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> [List]s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> [List]j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> [List]k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> [List]p  :<C-u>CocListResume<CR>
    " Show yanked text
    nnoremap <silent> [List]y  :<C-u>CocList -A --normal yank<CR>

    "}}}

  "" }}}

" }}}

" Programming {{{

  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-commentary'
  Plug 'mattn/emmet-vim'

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

    Plug 'janko-m/vim-test' " {{{
        nmap <silent> t<C-n> :TestNearest<CR>
        nmap <silent> t<C-f> :TestFile<CR>
        nmap <silent> t<C-s> :TestSuite<CR>
        nmap <silent> t<C-l> :TestLast<CR>
        nmap <silent> t<C-g> :TestVisit<CR>
    "}}}

    Plug 'editorconfig/editorconfig-vim'

    Plug 'tpope/vim-dispatch'

  " }}}

  "" Languages {{{

    """ JavaScript {{{
      Plug 'othree/yajs.vim'
    """ }}}

    """ Markdown {{{
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'
    """ }}}

    Plug 'sheerun/vim-polyglot' " {{{
      let g:polyglot_disabled = ['elm']
    " }}}

  " }}}

" }}}

" Interface {{{

  Plug 'mbbill/undotree' " {{{
    nnoremap <silent> [List]u :UndotreeToggle<cr>
  " }}}

  "" Appearance {{{

    Plug 'morhetz/gruvbox'

    Plug 'vim-airline/vim-airline' " {{{
      Plug 'vim-airline/vim-airline-themes'

      let g:airline#extensions#tabline#enabled = 1
      let g:airline_powerline_fonts = 1
      let g:airline_theme='base16_gruvbox_dark_hard'
  " }}}

  "" }}}

  "" Navigation {{{

    Plug 'farmergreg/vim-lastplace'

    Plug 'majutsushi/tagbar' " {{{
      let g:tagbar_type_elm = {
            \ 'kinds' : [
            \ 'f:function:0:0',
            \ 'm:modules:0:0',
            \ 'i:imports:1:0',
            \ 't:types:1:0',
            \ 'a:type aliases:0:0',
            \ 'c:type constructors:0:0',
            \ 'p:ports:0:0',
            \ 's:functions:0:0',
            \ ]
            \}
    " }}}

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " {{{
      let g:fzf_nvim_statusline = 0 " disable statusline overwriting

      nmap \ [fzf]
      nnoremap <silent> [fzf]\ :Files<CR>
      nnoremap <silent> [fzf]<space> :NV<CR>
      nnoremap <silent> [fzf]b :Buffers<CR>
      nnoremap <silent> [fzf]B :Windows<CR>
      nnoremap <silent> [fzf]l :BLines<CR>
      nnoremap <silent> [fzf]t :BTags<CR>
      nnoremap <silent> [fzf]T :Tags<CR>
      nnoremap <silent> [fzf]h :History<CR>
      nnoremap <silent> [fzf]s :execute 'Ag ' . input('Ag/')<CR>
      nnoremap <silent> [fzf]S :AgIn

      nnoremap <silent> [fzf]gl :Commits<CR>
      nnoremap <silent> [fzf]ga :BCommits<CR>
      nnoremap <silent> [fzf]ft :Filetypes<CR>

      imap <C-x><C-f> <plug>(fzf-complete-file-ag)
      imap <C-x><C-l> <plug>(fzf-complete-line)

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
      "}}}

    "" }}}


  "" }}}

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

"}}}

" Utilities {{{

  Plug 'konfekt/fastfold'
  Plug 'octref/rootignore'
  Plug 'tpope/vim-unimpaired'

  Plug 'mhinz/vim-startify' "{{{
    nnoremap <F4> :Startify<CR>
  "}}}


" }}}

call plug#end()
