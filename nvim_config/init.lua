local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Install the plugin manager
local data_dir = vim.fn.stdpath('data') .. '/site'

if vim.fn.empty(vim.fn.glob(data_dir .. '/autoload/plug.vim')) > 0 then
  vim.fn.system({
    'curl', '-fLo', data_dir .. '/autoload/plug.vim', '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    command = 'PlugInstall --sync | source ' .. vim.env.MYVIMRC
  })
end
-- Install our plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- LSP Support
Plug('neovim/nvim-lspconfig')
-- Install LSPs, formatters, linters
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')     -- Required
Plug('hrsh7th/cmp-nvim-lsp') -- Required
Plug('L3MON4D3/LuaSnip')     -- Required
Plug('nvim-lua/plenary.nvim') -- For nvim-metals
Plug('scalameta/nvim-metals')

-- LSP-zero
Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v2.x' })

-- Colorscheme
Plug('bluz71/vim-moonfly-colors', { ['as'] = 'moonfly' })

vim.call('plug#end')

-- Color schemes should be loaded after plug#end().
-- We prepend it with 'silent!' to ignore errors when it's not yet installed.
vim.cmd('silent! colorscheme moonfly')
-- Our plugin-specific configurations
require('plugins.nvim-treesitter')
require('plugins.lspconfig')
require('plugins.metals_setup')
require("coc_settings")
