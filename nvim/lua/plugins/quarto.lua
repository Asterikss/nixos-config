return {
  'quarto-dev/quarto-nvim',
  ft = { 'quarto' },
  opts = {
    lspFeatures = {
      languages = { 'python' },
    },
    codeRunner = {
      enabled = false,
      default_method = nil, -- 'molten' or 'slime'
      -- ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      -- never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
  },
  dependencies = {
    -- for language features in code cells
    {
      'jmbuhr/otter.nvim',
      dependencies = {
        {
          'neovim/nvim-lspconfig',
          'nvim-treesitter/nvim-treesitter',
        },
      },
      opts = {},
    },
  },
}
