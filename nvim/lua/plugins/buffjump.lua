return {
  'asterikss/buffjump.nvim',
  keys = { '<C-i>', '<C-o>', '<C-n>', '<C-p>' },
  dir = '~/projects/buffjump.nvim/master/',
  opts = {
    forward_key = '<C-n>',
    backward_key = '<C-p>',
    forward_same_buf_key = '<C-i>',
    backward_same_buf_key = '<C-o>',
    on_success = function()
      vim.cmd('normal! g`"zz')
    end,
    on_success_same_buf = function()
      vim.cmd('normal! zz')
    end,
  },
}
