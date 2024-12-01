return {
  'shortcuts/no-neck-pain.nvim',
  lazy = true,
  version = '*',
  keys = {
    {
      '<leader><leader>n',
      mode = 'n',
      function()
        vim.cmd('NoNeckPain')
      end,
      desc = 'no-neck-pain',
    },
  },
  opts = {
    width = 130,
    buffers = {
      right = {
        enabled = false,
      },
    },
  },
}
