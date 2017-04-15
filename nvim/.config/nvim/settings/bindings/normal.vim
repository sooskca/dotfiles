" bindings/normal.vim - My normal mode bindings for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" 0 -- Go to first non-blank character
map 0 ^

" - -- Like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

" j|k -- Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Space -- Toggle folds
nnoremap <space> za

" Esc -- Clears the highlighting from the previous search
nnoremap <esc> :noh<return><esc>

" B|E -- Move to beginning and end of line
nnoremap B ^
nnoremap E $

" Q -- Closes the window
nnoremap Q :q<cr>

" gV -- Highlight last inserted text
nnoremap gV `[v`]

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

" <Leader><Leader> -- Open last buffer.
nnoremap <Leader><Leader> <C-^>

" <Leader>w -- Save the file
nmap <Leader>w :w!<cr>

" <Leader>c -- Close buffer
noremap <Leader>c :bd<CR>

" <Leader>ev|ez|sv -- Edits vimrc, zshrc and source vimrc
nnoremap <Leader>ev :vsp $MYVIMRC<CR>
nnoremap <Leader>ez :vsp ~/.zshrc<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" <Leader>h|v -- Split window horizontally and vertically
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" <Leader>. -- Set working directory
nnoremap <Leader>. :lcd %:p:h<CR>

" <Leader>e -- Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" <Leader>p -- Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" <Leader>r -- Cycle though relative line number + number, number (only), and
" no numbers.
nnoremap <silent> <Leader>r :call functions#cycle_line_numbers#do()<CR>
