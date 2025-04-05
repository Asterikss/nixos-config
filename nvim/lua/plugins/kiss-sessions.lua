return {
  'asterikss/kiss-sessions.nvim',
  dir = '~/projects/kiss-sessions.nvim/master/',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'LoadDefaultSession',
  keys = {
    {
      '<Leader>n',
      mode = 'n',
      function()
        require('kiss-sessions').LoadSession()
      end,
      desc = 'Load KISS session',
    },
    {
      '<Leader>N',
      mode = 'n',
      function()
        require('kiss-sessions').SaveSession()
      end,
      desc = 'Save KISS session',
    },
    {
      '<A-X>',
      mode = { 'n', 't' },
      function()
        require('kiss-sessions').SaveDefaultSessionAndQuit()
      end,
      desc = 'Save default session and quit',
    },
  },
  opts = {},
}
