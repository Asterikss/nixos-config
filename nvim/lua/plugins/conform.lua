return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>o',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format' },
      -- javascript = { 'prettierd', 'prettier', stop_after_first = true },
    },
    format_on_save = function(bufnr)
      if vim.g.enable_autoformat then
        return { timeout_ms = 500, lsp_format = 'never' }
      end
    end,
  },
  -- init = function()
  --   vim.o.formatexpr = 'v:lua.require'conform'.formatexpr()'
  -- end,
}
