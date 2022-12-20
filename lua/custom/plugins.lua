return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
  })
  use 'ellisonleao/gruvbox.nvim'
  use({
    'nvim-tree/nvim-tree.lua',
      config= function ()
        require("nvim-tree").setup({})
      end
  })
  use 'nvim-tree/nvim-web-devicons'
end
