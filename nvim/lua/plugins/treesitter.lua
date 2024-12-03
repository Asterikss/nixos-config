return {
  'nvim-treesitter/nvim-treesitter',
  dev = vim.g.system_id == 'nixos',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    local ensure_installed_tree = {}
    if vim.g.system_id ~= 'nixos' then
      vim.list_extend(ensure_installed_tree, {
        'python',
        'rust',
        'c',
        'cpp',
        'lua',
        'typescript',
        'tsx',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'bash',
        'yaml',
      })
    end
    require('nvim-treesitter.configs').setup({
      auto_install = false,
      ensure_installed = ensure_installed_tree,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        custom_captures = {},
        disable = {},
      },
      incremental_selection = {
        enable = false,
        disable = {},
        keymaps = {
          init_selection = 'gnn',
          node_decremental = 'grm',
          node_incremental = 'grn',
          scope_incremental = 'grc',
        },
      },
      indent = {
        enable = true,
        disable = { 'python' },
      },
    })
  end,
}
