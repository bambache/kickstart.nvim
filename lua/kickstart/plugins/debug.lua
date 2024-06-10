-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)
-- return {
--    "rcarriga/nvim-dap-ui",
--   dependencies = {
--     "mfussenegger/nvim-dap",
--     "nvim-neotest/nvim-nio",
--   }
-- },

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',

  -- NOTE: And you can specify dependencies as well
  dependencies = {
    "nvim-neotest/nvim-nio",
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = false,

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve', 'coreclr'
      },
      handlers = {},
    }

    require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    -- require('mason-nvim-dap').setup_handlers()

    -- require("dap.ext.vscode").json_decode = require 'json5'.parse
    local continue = function()
      if vim.fn.filereadable('.vscode/launch.json') then
        print("found launch.json")
        require('dap.ext.vscode').load_launchjs(nil, { coreclr = { 'cs' } })
      end
      print("continue")
      require('dap').continue()
    end



    dap.adapters.coreclr = {
      type = 'executable',
      command = vim.fn.stdpath("data") .. '/mason/packages/netcoredbg/netcoredbg',
      args = { '--interpreter=vscode' }
    }

    -- dap.configurations.cs = {
    --   {
    --     type = "coreclr",
    --     name = "launch - netcoredbg",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input('Path to dll:', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    --     end,
    --   },
    -- }

    -- vim.keymap.set('n', '<leader>dm', require('dap-python').test_method, { desc = '[D]ebug [M]ethod'})
    -- vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = '[D]ebug Start/[C]ontinue' })
    vim.keymap.set('n', '<leader>dc', continue, { desc = '[D]ebug Start/[C]ontinue' })
    vim.keymap.set('n', '<leader>dt', require('dap').toggle_breakpoint, { desc = '[D]ebug [T]oggle breakpoint' })
    vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = '[D]ebug Step [I]nto' })
    vim.keymap.set('n', '<leader>do', require('dap').step_over, { desc = '[D]ebug Steo [O]ver' })

    -- Basic debugging keymaps, feel free to change to your liking!
    -- vim.keymap.set('n', '<F5>', dap.continue)
    -- vim.keymap.set('n', '<F1>', dap.step_into)
    -- vim.keymap.set('n', '<F2>', dap.step_over)
    -- vim.keymap.set('n', '<F3>', dap.step_out)
    -- vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
    -- vim.keymap.set('n', '<leader>B', function()
    --   dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    -- end)

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
