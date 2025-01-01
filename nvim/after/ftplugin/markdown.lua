vim.cmd('highlight clear Whitespace')
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 0
vim.opt_local.shiftwidth = 0
vim.opt_local.textwidth = 85
vim.api.nvim_buf_set_keymap(0, 'i', ';', '<End>:<CR><TAB>- ', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'i', 'q;', ';', { noremap = true })
vim.api.nvim_buf_set_keymap(0, 'i', '<C-k>', '<End><CR>- ', { noremap = true })
