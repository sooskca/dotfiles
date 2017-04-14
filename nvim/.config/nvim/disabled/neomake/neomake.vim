let g:neomake_typescript_enabled_makers=['tsc','tslint']

autocmd! BufWritePost * Neomake
