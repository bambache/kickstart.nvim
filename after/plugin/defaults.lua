-- gruvbox
vim.o.termguicolors = true
vim.cmd [[ colorscheme gruvbox ]]

-- custom search resume
vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
