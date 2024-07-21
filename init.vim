call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

lua require('config')
lua require("config.lazy")
colorscheme carbonfox


map <leader>ct :RustLsp testables<CR>
