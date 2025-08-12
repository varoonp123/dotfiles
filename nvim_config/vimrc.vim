set runtimepath^=~/.vim
let &packpath = &runtimepath
let g:vimsyn_embed = 'l'  " Lua syntax highlighting

set statusline+=%F  " Show filename in statusbar
set textwidth=120   " good for me and me alone
set showmatch		" Show matching brackets.
set tabstop=4		"num spaces when reading tab char 
set softtabstop=4	"num spaces tab counts for when editting
autocmd FileType json,html,xml,yaml set tabstop=2
set expandtab		"basically makes tab char into 4 spaces
set number		    "show line numbers
set relativenumber  "Show relative line numberd
set signcolumn=auto "Grey bar on far left by line numbers only appears when there is diagnostic info
set mouse=a         "Allow mouse in all modes
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500 "Highlight matching parens for 500ms

" I like 80 character width for markdown files
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
