return {
  -- use({
  --   "folke/which-key.nvim",
  --   config = function()
  --     require("which-key").setup({})
  --   end
  -- })
  'ellisonleao/gruvbox.nvim',
  -- use({
  --   'nvim-tree/nvim-tree.lua',
  --   config = function ()
  --     require("nvim-tree").setup({})
  --   end
  -- })
  -- use 'nvim-tree/nvim-web-devicons'
  -- use "mfussenegger/nvim-dap"
  -- use({
  --   "rcarriga/nvim-dap-ui",
  --   config = function ()
  --     require("dapui").setup({
  --       icons = { expanded = "▾", collapsed = "▸" },
  --       mappings = {
  --         -- Use a table to apply multiple mappings
  --         expand = { "<CR>", "<2-LeftMouse>" },
  --         open = "o",
  --         remove = "d",
  --         edit = "e",
  --         repl = "r",
  --         toggle = "t",
  --       },
  --       -- Expand lines larger than the window
  --       -- Requires >= 0.7
  --       expand_lines = vim.fn.has("nvim-0.7"),
  --       -- Layouts define sections of the screen to place windows.
  --       -- The position can be "left", "right", "top" or "bottom".
  --       -- The size specifies the height/width depending on position. It can be an Int
  --       -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  --       -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  --       -- Elements are the elements shown in the layout (in order).
  --       -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  --       layouts = {
  --         {
  --           elements = {
  --             -- Elements can be strings or table with id and size keys.
  --             { id = "scopes", size = 0.25 },
  --             "breakpoints",
  --             "stacks",
  --             "watches",
  --           },
  --           size = 40, -- 40 columns
  --           position = "left",
  --         },
  --         {
  --           elements = {
  --             "repl",
  --             "console",
  --           },
  --           size = 0.25, -- 25% of total lines
  --           position = "bottom",
  --         },
  --       },
  --       floating = {
  --         max_height = nil, -- These can be integers or a float between 0 and 1.
  --         max_width = nil, -- Floats will be treated as percentage of your screen.
  --         border = "single", -- Border style. Can be "single", "double" or "rounded"
  --         mappings = {
  --           close = { "q", "<Esc>" },
  --         },
  --       },
  --       windows = { indent = 1 },
  --       render = {
  --         max_type_length = nil, -- Can be integer or nil.
  --       }
  --     })
  --   end
  -- })
  -- use({
  --   "mfussenegger/nvim-dap-python",
  --   config = function ()
  --     local pydeb = require('dap-python')
  --     pydeb.setup('~/uar/venv38/bin/python')
  --     pydeb.test_runner = 'pytest'
  --   end
  -- })
  -- use ({
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-neotest/neotest-python",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   },
  --   config = function ()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-python")({
  --           dap = { justMyCode = false },
  --         })
  --       }
  --     })
  --   end
  -- })
  ({
    'akinsho/bufferline.nvim',
    tag = "v4.6.1",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup()
    end
  }),
  ({
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end
  }),
  ({
    "dustinblackman/oatmeal.nvim",
    cmd = { "Oatmeal" },
    keys = {
      { "<leader>om", mode = "n", desc = "Start Oatmeal session" },
    },
    opts = {
      backend = "ollama",
      model = "codellama:latest",
    },
  }),
}
