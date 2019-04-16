" vim: fdm=marker ts=2 sts=2 sw=2
" keybindings.vim - My vim keybindings
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      1.0
"
" Command {{{

" W - Saves the file using sudo
cabbrev W !sudo tee "%"

" <C-a/e> - Go to the beginning and end of line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" <C-p/n> - Filter command history the same way as <Up> <Down> do
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" }}}

" Insert {{{

" jj - Exits insert modeejj
imap jk <Esc>

" <C-a/e> Go to the beginning and end of line
inoremap <C-a> <Home>
inoremap <C-e> <End>

" }}}

" Normal {{{

" 0 -- Go to first non-blank character
map 0 ^

" - -- Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

" , - Toggles fold
nnoremap , za

" j|k -- Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Esc -- Clears the highlighting from the previous search
nnoremap <esc> :noh<return><esc>

" B|E -- Move to beginning and end of line
nnoremap B ^
nnoremap E $

" Q -- Closes the window
nnoremap Q :q<cr>

" Tab|S-Tab -- Navigate tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" C-j|k|l|h -- Navigate windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" S-t -- Create new tabs
nnoremap <silent> <S-t> :tabnew<CR>

" <Leader><o> -- Open last buffer.
nnoremap <Leader>o <C-^>

" <Leader>w -- Save the file
nmap <Leader>w :w!<cr>

" <Leader>c -- Close buffer
noremap <Leader>c :bd<CR>

" <Leader>ev|sv -- Edits vimrc, zshrc and source vimrc
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" <Leader>h|v -- Split window horizontally and vertically
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" <Leader>. -- Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" <Leader>e -- Opens an edit command with the path of the currently edited file filled in
noremap <Leader>ee :e <C-R>=expand("%:p:h") . "/" <CR>

" <Leader>p -- Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" <Leader>r -- Cycle though relative line number + number, number (only), and
" no numbers.
nnoremap <silent> <Leader>r :call functions#CycleLineNumbers()<CR>

" <Leader>x - Replace every match in the quickfix list
nnoremap <leader>x :cdo s/<C-r>///g \| update<left><left><left><left><left><left><left><left><left><left><left>

" }}}

" Visual {{{

" Q - Execute macro over visual selection
xnoremap Q :'<,'>:normal @q<cr>

" Visual paste without losing the copied content
xnoremap p "0p

" }}}

" Terminal {{{

" Easy navigation
if has('terminal') || g:is_nvim
  tnoremap <esc><esc> <C-\><C-n>
  tnoremap <PageUp> <C-W>N<C-U>
endif

" }}}

