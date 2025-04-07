return {
  'numToStr/Comment.nvim',
  enabled = false,
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    toggler = {
      line = 'q',
      block = 'gbq',
    },
    opleader = {
      line = 'q',
      block = 'gb',
    },
  },
}
