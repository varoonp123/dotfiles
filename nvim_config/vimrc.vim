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
" Install vim-plug plugin manager https://github.com/junegunn/vim-plug/wiki/tips
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" plugins!
"
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Support
Plug 'neovim/nvim-lspconfig'
" Install LSPs+formatters+linters
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required
Plug 'nvim-lua/plenary.nvim' " For nvim-metals
Plug 'scalameta/nvim-metals'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }  " colorscheme

call plug#end()  " Initialize the plugin system

colorscheme moonfly



let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-rust-analyzer',
      \'coc-go',
      \'coc-sh',
      \'coc-json', 
      \'coc-vimlsp', 
      \'coc-css', 
      \'coc-sql', 
      \'coc-sqlfluff', 
      \'coc-pyright', 
      \'coc-java', 
      \'coc-lua', 
      \'coc-toml', 
      \'coc-yaml', 
      \'coc-texlab', 
      \'coc-tsserver', 
      \'coc-git'
      \]
