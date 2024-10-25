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
set mouse=a         "Allow mouse in all modes
set signcolumn=yes
set inccommand=split
