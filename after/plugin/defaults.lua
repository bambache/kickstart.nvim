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
require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
	},
	sections = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	}
})

-- local dapui =require('dapui')
-- local dap = require('dap')

-- dap.adapters.coreclr={
--   type = 'executable',
--   command = '/home/florin/.local/share/nvim/mason/packages/netcoredbg/netcoredbg',
--   args = {'--interpreter=vscode'}
-- }
--
-- dap.configurations.cs = {
--   {
--     type = "coreclr",
--     name = "launch - netcoredbg",
--     request = "launch",
--     program = function()
--         return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
--     end,
--   },
-- }
--
-- dap.listeners.after.event_initialized["dapui_config"] = function ()
-- 	dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function ()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"]	= function ()
-- 	dapui.close()
-- end
--
-- -- require("dap.ext.vscode").load_launchjs()
-- local continue = function()
--   if vim.fn.filereadable('.vscode/launch.json') then
--     require('dap.ext.vscode').load_launchjs()
--   end
--   require('dap').continue()
-- end
-- vim.keymap.set('n', '<leader>dm', require('dap-python').test_method, { desc = '[D]ebug [M]ethod'})
-- vim.keymap.set('n', '<leader>dc', continue, { desc = '[D]ebug Start/[C]ontinue'})
-- vim.keymap.set('n', '<leader>dt', require('dap').toggle_breakpoint, { desc = '[D]ebug [T]oggle breakpoint'})
-- vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = '[D]ebug Step [I]nto'})
-- vim.keymap.set('n', '<leader>do', require('dap').step_over, { desc = '[D]ebug Steo [O]ver'})
--
-- vim.keymap.set('n', '<leader>bs', require('bufferline').pick_buffer, { desc = '[B]uffer [P]ick' })
-- lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})
