" bindings/visual.vim - My visual mode bindings for neovim
" Maintainer:   José Araújo <sooskca@gmail.com>
" Version:      0.1

" *|# - Searches for the current selection on visual mode
vnoremap <silent> * :<C-u>call s:VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call s:VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" y - Yank and go to end of selection
xnoremap y y`]

" p - Paste in visual mode should not replace the default register with the
" deleted text
xnoremap p "_dP

" d - Delete into the blackhole register to not clobber the last yank. To 'cut', use 'x' instead
xnoremap d "_d

" Backspace - delete selected and go into insert mode
xnoremap <bs> c

" <|> - Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" . - Repeats the last command on every line
xnoremap . :normal.<cr>

" @ - Repeats macro on every line
xnoremap @ :normal@

" Tab - Indent
xmap <Tab> >

" Shift-Tab - Unindent
xmap <s-tab> <
