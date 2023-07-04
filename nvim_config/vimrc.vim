set runtimepath^=~/.vim
let &packpath = &runtimepath
let g:vimsyn_embed = 'l'  " Lua syntax highlighting

set statusline+=%F  " Show filename in statusbar
set textwidth=120   " good for me and me alone
" Install vim-plug plugin manager https://github.com/junegunn/vim-plug/wiki/tips
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" plugins!
"
call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()  " Initialize the plugin system


let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-rust-analyzer',
      \'coc-go',
      \'coc-python',
      \'coc-sh',
      \'coc-json', 
      \'coc-css', 
      \'coc-git'
      \]
