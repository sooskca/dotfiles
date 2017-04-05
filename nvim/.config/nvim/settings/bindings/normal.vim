" bindings/normal.vim - My normal mode bindings for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" 0 - Go to first non-blank character
map 0 ^

" j|k - Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Space - Toggle folds
nnoremap <space> za

" Esc - Clears the highlighting from the previous search
nnoremap <esc> :noh<return><esc>

" B|E - Move to beginning and end of line
nnoremap B ^
nnoremap E $

" Q - Closes the window
nnoremap Q :q<cr>

" gV - Highlight last inserted text
nnoremap gV `[v`]

" Tab|S-Tab - Navigate tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" C-j|k|l|h - Navigate windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" S-t - Create new tabs
nnoremap <silent> <S-t> :tabnew<CR>

" <leader>w - Save the file
nmap <leader>w :w!<cr>

" <leader>c - Close buffer
noremap <leader>c :bd<CR>

" <leader>ev|ez|sv - Edits vimrc, zshrc and source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp $HOME/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" <leader>h|v - Split window horizontally and vertically
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" <leader>. - Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" <leader>e - Opens an edit command with the path of the currently edited file filled in
noremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" <leader>te - Opens a tab edit command with the path of the currently edited file filled
noremap vleader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" <leader>p - Copy the full path of the current file to the clipboard
nnoremap <silent> <leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>
