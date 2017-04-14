let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set completeopt=longest,menuone,preview

let g:deoplete#sources = {}

let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
