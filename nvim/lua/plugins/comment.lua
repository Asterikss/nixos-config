return {
  'numToStr/Comment.nvim',
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
