return {
  {
    'navarasu/onedark.nvim',
    enabled = false,
    -- priority = 1000,
    -- config = function()
    --   -- vim.cmd.colorscheme 'onedark'
    --   require('onedark').setup {
    --     style = 'deep'
    --   }
    --   require('onedark').load()
    -- end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({})
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
  },
  {
    'savq/melange',
    enabled = false,
  },
}
