vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.listchars = 'space:·,tab:->'
vim.opt.list = true
vim.keymap.set('n', '<leader>si', ':set list!<CR>')
-- use spaces for tabs and more
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.relativenumber = true

-- gruvbox
vim.o.termguicolors = true
vim.cmd [[ colorscheme catppuccin-mocha ]]

-- custom search resume
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- nvim-tree
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<c-n>', ':Neotree toggle<CR>')

-- lualine options
-- require('lualine').setup({
-- 	options = {
-- 		icons_enabled = true,
-- 		theme = 'catppuccin-mocha',
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				'filename',
-- 				path = 1,
-- 			}
-- 		}
-- 	}
-- })
