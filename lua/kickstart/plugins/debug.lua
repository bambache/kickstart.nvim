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

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    "ldelossa/nvim-dap-projects",

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<F5>',
      function() require('dap').continue() end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function() require('dap').step_into() end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function() require('dap').step_over() end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function() require('dap').step_out() end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function() require('dap').toggle_breakpoint() end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      '<F7>',
      function() require('dapui').toggle() end,
      desc = 'Debug: See last session result.',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve', 'coreclr', 'codelldb'
      },
      handlers = {},
    }

    require("easy-dotnet.netcoredbg").register_dap_variables_viewer()
    -- require("nvim-dap-projects").search_project_config()

    require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog
    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    -- require('mason-nvim-dap').setup_handlers()
    -- require("dap.ext.vscode").json_decode = require 'json5'.parse
    local continue = function()
      -- if vim.fn.filereadable('.vscode/launch.json') then
      --   print("found launch.json")
      --   require('dap.ext.vscode').load_launchjs(nil, { coreclr = { 'cs' } })
      -- end
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
    vim.keymap.set('n', '<F5>', continue, { desc = '[D]ebug Start/[C]ontinue' })
    vim.keymap.set('n', '<F9>', require('dap').toggle_breakpoint, { desc = '[D]ebug [T]oggle breakpoint' })
    vim.keymap.set('n', '<F11>', require('dap').step_into, { desc = '[D]ebug Step [I]nto' })
    vim.keymap.set('n', '<F10>', require('dap').step_over, { desc = '[D]ebug Steo [O]ver' })

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
          disconnect = '⏏',
        },
      },
    }

    -- Change breakpoint icons
    -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    -- local breakpoint_icons = vim.g.have_nerd_font
    --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
    --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
    -- for type, icon in pairs(breakpoint_icons) do
    --   local tp = 'Dap' .. type
    --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    -- end

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
