let g:CommandTWildIgnore=&wildignore . ",*/bower_components"

let g:CommandTMaxCachedDirectories=0

let g:CommandTScanDotDirectories=1

nmap \ [CommandT]
nnoremap [CommandT] <nop>
nnoremap [CommandT]b :CommandTBuffer<cr>
nnoremap [CommandT]c :CommandTCommand<cr>
nnoremap [CommandT]j :CommandTJump<cr>
nnoremap [CommandT]l :CommandTLine<cr>
nnoremap [CommandT]m :CommandTMRU<cr>
nnoremap [CommandT]s :CommandTSearch<cr>
nnoremap [CommandT]t :CommandTTag<cr>
