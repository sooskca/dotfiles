" vim: fdm=marker ts=2 sts=2 sw=2
" vim-plug.vim - My vim-plug setup
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0

call plug#begin('~/.cache/plugged')

" Editing {{{
  Plug 'arthurxavierx/vim-caser'

  Plug 'ntpeters/vim-better-whitespace' "{{{
    let g:strip_whitespace_on_save=1
    let g:better_whitespace_enabled=1
  "}}}

  Plug 'mbbill/undotree' "{{{
    nnoremap <silent> [List]u :UndotreeToggle<cr>
  "}}}

  Plug 'tpope/vim-repeat'
  Plug 'mtth/scratch.vim'
  Plug 'machakann/vim-sandwich'

  Plug 'terryma/vim-expand-region' "{{{
    map K <Plug>(expand_region_expand)
    map J <Plug>(expand_region_shrink)
  "}}}

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

  Plug 'alok/notational-fzf-vim' "{{{
    let g:nv_search_paths = ['~/Wiki', './Notes.md']
  "}}}
  "
  Plug 'thaerkh/vim-workspace' " {{{
    nnoremap <leader>s :ToggleWorkspace<CR>
    " }}}

  Plug 'kana/vim-textobj-user' "{{{
    Plug 'saaguero/vim-textobj-pastedtext'
    "}}}
    "
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

  Plug 'raimondi/delimitmate' " {{{
    let delimitMate_expand_cr = 1
    " }}}

  if !exists("g:is_windows")
    Plug 'metakirby5/codi.vim' "{{{
      " since it is fullscreen, I'd like a 50/50 split
      let g:codi#width = 50.0

      " instead of destroying buffers, hide them and
      " index them by filetype into this dictionary
      let s:codi_filetype_tabs = {}

      fun! s:FullscreenScratch()
        " store filetype and bufnr of current buffer
        " for later reference
        let current_buf_ft  = &ft
        let current_buf_num = bufnr('%')

        " check if a scratch buffer for this filetype already exists
        let saved_scratch = get(s:codi_filetype_tabs, current_buf_ft, -1)

        " if a tabpage exists for current_buf_ft, go to it instead of
        " creating a new scratch buffer
        if saved_scratch != -1
          if index(map(gettabinfo(), 'v:val.tabnr'), saved_scratch) == -1
            unlet s:codi_filetype_tabs[current_buf_ft]
          else
            exe 'tabn' saved_scratch
            return
          endif
        endif

        " create a new empty tab, set scratch options and give it a name
        tabe
        setlocal buftype=nofile noswapfile modifiable buflisted bufhidden=hide
        exe ':file scratch::' . current_buf_ft

        " set filetype to that of original source file
        " e.g. ruby / python / w/e Codi supports
        let &filetype = current_buf_ft

        " store the tabpagenr per filetype so we can return
        " to it later when re-opening from the same filetype
        let s:codi_filetype_tabs[&filetype] = tabpagenr()

        " create a buffer local mapping that overrides the
        " outer one to delete the current scratch buffer instead
        " when the buffer is destroyed, this mapping will be
        " destroyed with it and the next <Leader><Leader>
        " will spawn a new fullscreen scratch window again
        nmap <silent><buffer> <Leader><Leader> :tabprevious<Cr>

        " everything is setup, filetype is set
        " let Codi do the rest :)
        Codi
      endfun

      " create a mapping to call the fullscreen scratch wrapper
      nmap <silent> <leader><leader>f :call <SID>FullscreenScratch()<Cr>"}}}

  endif

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

  "" Languages {{{
    """ JavaScript {{{
      Plug 'othree/yajs.vim'
    """ }}}

    """ Elm {{{
      Plug 'elm-tooling/elm-vim'
      Plug 'andys8/vim-elm-syntax'
    """ }}}

    Plug 'sheerun/vim-polyglot' "{{{
      let g:polyglot_disabled = ['elm']
    "}}}

  "" Libraries & Frameworks {{{
    """ React {{{
      " Plug 'mxw/vim-jsx'
    """ }}}
  " }}}

" }}}

" Interface {{{

  " Appearance {{{
    Plug 'morhetz/gruvbox'
    "}}}

  " Status Line "{{{
    Plug 'vim-airline/vim-airline' "{{{
      Plug 'vim-airline/vim-airline-themes'

      let g:airline#extensions#tabline#enabled = 1
      let g:airline_powerline_fonts = 1
      let g:airline_theme='base16_gruvbox_dark_hard'
    "}}}

  "}}}

  " File Navigation "{{{

  Plug 'farmergreg/vim-lastplace'

  Plug 'majutsushi/tagbar' "{{{
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
  """ }}}

  Plug 'junegunn/fzf.vim' " {{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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

  "Plug 'tpope/vim-vinegar' "{{{
  "  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

  "  autocmd FileType netrw setl bufhidden=delete

  ""}}}

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

"}}}

" Utilities {{{

  Plug 'konfekt/fastfold'
  Plug 'octref/rootignore'
  Plug 'tpope/vim-unimpaired'

  Plug 'vimwiki/vimwiki' "{{{

    let g:vimwiki_diary_months = {
          \ 1: 'Janeiro', 2: 'Fevereiro', 3: 'Março',
          \ 4: 'Abril', 5: 'Maio', 6: 'Junho',
          \ 7: 'Julho', 8: 'Agosto', 9: 'Setembro',
          \ 10: 'Outubro', 11: 'Novembro', 12: 'Dezembro'
          \ }
    let g:vimwiki_list = [{
          \ 'path': '~/Wiki/',
          \ 'syntax': 'markdown', 'ext': '.md',
          \ 'auto_diary_index': 1
          \ }]
  " }}}

  Plug 'mhinz/vim-startify' "{{{
    nnoremap <F4> :Startify<CR>
  "}}}

 "" Tmux {{{

  if executable('tmux')
    Plug 'wellle/tmux-complete.vim'
    Plug 'edkolev/tmuxline.vim'

    Plug 'christoomey/vim-tmux-navigator' "{{{
      let g:tmux_navigator_save_on_switch = 1
    "}}}
  endif

  "" }}}

" }}}

call plug#end()
