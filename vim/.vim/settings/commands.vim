augroup user-commands
	autocmd!
	" Open the file placing the cursor where it was
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif

	" Close preview window when leaving insert mode http://stackoverflow.com/a/3107159/854676
	autocmd InsertLeave * if pumvisible() == 0|pclose|endif

	" Automatically equalize splits when Vim is resized
	autocmd VimResized * wincmd =
augroup END
