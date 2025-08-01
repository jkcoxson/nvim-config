lua require('config')
lua require("config.lazy")
colorscheme carbonfox


map <leader>ct :RustLsp testables<CR>
nnoremap <leader>r "_di"P
