vim.opt_local.textwidth = 85
vim.api.nvim_buf_set_keymap(0, 'i', 'qp', '```{python}<CR>```<Esc>O', { noremap = true })
