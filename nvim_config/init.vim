set runtimepath^=~/.vim
let &packpath = &runtimepath

set statusline+=%F  " Show filename in statusbar
" Install vim-plug plugin manager https://github.com/junegunn/vim-plug/wiki/tips
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" plugins!
"
call plug#begin()
Plug 'junegunn/vim-easy-plugin'
Plug 'scrooloose/syntastic'
Plug 'averms/black-nvim', {'branch': 'release'}

call plug#end()  " Initialize the plugin system
