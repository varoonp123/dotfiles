local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

-- Our plugin-specific configurations
require('plugins.nvim-treesitter')
require('plugins.lspconfig')
require('plugins.metals_setup')
require("coc_settings")
